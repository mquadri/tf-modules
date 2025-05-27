locals {
  env    = var.env == null ? lower(var.environment) : var.env
  naming = "${var.resourcetype}-${var.appname}-${local.env}-${var.location}"
  #aks_private_dns_name = "${lower(azurerm_kubernetes_cluster.main.name)}.privatelink.${lower(var.location)}.azmk8s.io"
  tags = {
    app_id        = var.app_id
    msftmigration = var.msftmigration
    environment   = var.environment
  }

  identities = {
    system_assigned            = (try(var.managed_identities.system_assigned, false)) ? true : false
    user_assigned_resource_ids = concat(try(tolist(var.managed_identities.user_assigned_resource_ids), []), [azurerm_user_assigned_identity.aks-spn.id])
  }

  identitiesBicep = {
    systemAssigned          = local.identities.system_assigned
    userAssignedResourceIds = local.identities.user_assigned_resource_ids
  }

  aadProfile = {
    aadProfileEnableAzureRBAC     = true
    aadProfileManaged             = true
    aadProfileAdminGroupObjectIDs = [var.admin_group_object_ids]
    aadProfileClientAppID         = var.aad_profile_client_id
    aadProfileServerAppID         = var.aad_profile_server_id
    aadProfileServerAppSecret     = var.aad_profile_server_app_secret
    aadProfileTenantID            = var.tenant_id
  }

  istioServiceMeshCertificateAuthority = var.certificate_authority != null ? {
    istioservicemeshcertificateauthoritycertchainobjectname = var.certificate_authority.cert_chain_object_name
    istioservicemeshcertificateauthoritycertobjectname      = var.certificate_authority.cert_object_name
    istioservicemeshcertificateauthoritykeyvaultresourceid  = var.certificate_authority.key_vault_resource_id
    istioservicemeshcertificateauthorityrootcertobjectname  = var.certificate_authority.root_cert_object_name
  } : null


  sku_tier = lower(local.env) == "prod" ? "Premium" : "Standard"

  diagnosticSettingsBicep = var.diagnostic_settings != {} ? [for key, diagnostic in var.diagnostic_settings :
    {
      name                                = try(diagnostic.name, key)
      eventHubAuthorizationRuleResourceId = try(diagnostic.event_hub_authorization_rule_resource_id, null)
      eventHubName                        = try(diagnostic.event_hub_name, null)
      logAnalyticsDestinationType         = try(diagnostic.log_analytics_destination_type, "Dedicated")
      logCategoriesAndGroups = concat([for v in diagnostic.log_categories : {
        category = v
        }], [for v in diagnostic.log_groups : {
        category = v
      }])
      marketplacePartnerResourceId = try(diagnostic.marketplace_partner_resource_id, null)
      metricCategories             = try(diagnostic.metric_categories, [{ category = "AllMetrics", enabled = true }])
      storageAccountResourceId     = try(diagnostic.storage_account_resource_id, null)
      workspaceResourceId          = try(diagnostic.workspace_resource_id, null)
  }] : null

  agentPools = [for node in var.additional_node_pools : {
    name                              = node.name
    availabilityZones                 = node.zones
    count                             = node.node_count
    sourceResourceId                  = node.host_group_id != null ? node.host_group_id : node.capacity_reservation_group_id != null ? node.capacity_reservation_group_id : null
    enableAutoScaling                 = true
    enableDefaultTelemetry            = false
    enableEncryptionAtHost            = node.enable_host_encryption
    enableFIPS                        = node.fips_enabled
    enableNodePublicIP                = node.enable_node_public_ip
    enableUltraSSD                    = node.ultra_ssd_enabled
    gpuInstanceProfile                = node.gpu_instance
    kubeletDiskType                   = node.kubelet_disk_type
    maxCount                          = node.cluster_auto_scaling_max_count
    maxPods                           = node.max_pods
    minCount                          = node.cluster_auto_scaling_min_count
    mode                              = "User"
    maxSurge                          = node.max_surge
    minPods                           = null
    nodeLabels                        = node.labels
    nodePublicIpPrefixResourceId      = node.node_public_ip_prefix_id
    nodeTaints                        = node.taints
    orchestratorVersion               = var.kubernetes_version
    osDiskSizeGB                      = node.os_disk_size_gb
    osDiskType                        = node.os_disk_type
    osSku                             = node.os_sku
    osType                            = node.os_type
    podSubnetId                       = node.pod_subnet_id
    proximityPlacementGroupResourceId = node.proximity_placement_group_id
    scaleDownMode                     = node.scale_down_mode
    scaleSetEvictionPolicy            = node.eviction_policy
    scaleSetPriority                  = node.priority
    enableSecureBoot                  = false
    enableVTPM                        = false
    spotMaxPrice                      = node.spot_max_price
    tags                              = local.tags
    type                              = node.type
    vmSize                            = node.vm_size
    vnetSubnetResourceId              = node.vnet_subnet_id != null ? node.vnet_subnet_id : data.azurerm_subnet.aks-subnet-node-cidr.id
    workloadRuntime                   = node.workload_runtime
  }]

  service_principal = var.aks_service_principal != null ? {
    clientId     = var.aks_service_principal.client_id
    clientSecret = var.aks_service_principal.client_secret
  } : null

  fluxExtension = var.flux_extension_configuration.enabled ? {
    name                           = var.flux_extension_configuration.name
    releaseNamespace               = var.flux_extension_configuration.release_namespace
    targetNamespace                = var.flux_extension_configuration.target_namespace
    releaseTrain                   = var.flux_extension_configuration.release_train
    configurationProtectedSettings = var.flux_extension_configuration.configuration_protected_settings
    configurationSettings          = try(values(var.flux_extension_configuration.configuration_settings), null)
    varsion                        = var.flux_extension_configuration.version
    configurations                 = var.flux_extension_configuration.configurations
  } : null

  identityProfile = var.kubelet_identity != null ? {
    kubeletIdentity = {
      resourceId = var.kubelet_identity.user_assigned_identity_i
    }
  } : null

  primaryAgentPoolProfile = [for k, node in var.primary_node_pools :
    {
      name                      = k
      count                     = node.node_count
      availabilityZones         = node.zones
      sourceResourceId          = node.host_group_id != null ? node.host_group_id : node.capacity_reservation_group_id != null ? node.capacity_reservation_group_id : null
      enableAutoScaling         = true
      enableEncryptionAtHost    = node.enable_host_encryption
      enableFIPS                = node.fips_enabled
      enableNodePublicIP        = node.enable_node_public_ip
      enableUltraSSD            = node.ultra_ssd_enabled
      gpuInstanceProfile        = node.gpu_instance
      kubeletDiskType           = node.kubelet_disk_type
      maxCount                  = node.max_count
      maxPods                   = node.max_pods
      minCount                  = node.min_count
      mode                      = "System"
      nodeLabels                = node.node_labels
      nodePublicIPPrefixID      = node.node_public_ip_prefix_id
      nodeTaints                = node.node_taints
      orchestratorVersion       = var.kubernetes_version
      osDiskSizeGB              = node.os_disk_size_gb
      osDiskType                = node.os_disk_type
      osType                    = node.os_type
      osSku                     = node.os_sku
      podSubnetID               = node.pod_subnet_id
      proximityPlacementGroupID = node.proximity_placement_group_id
      scaleDownMode             = node.scale_down_mode
      scaleSetEvictionPolicy    = node.scale_set_eviction_policy
      scaleSetPriority          = node.priority
      enableSecureBoot          = false
      enableVTPM                = false
      sshAccess                 = node.os_sku == "Automatic" ? "Disabled" : "LocalUser"
      spotMaxPrice              = node.spot_max_price
      tags                      = local.tags
      type                      = node.type
      maxSurge                  = node.max_surge
      vnetSubnetResourceId      = var.vnet_subnet_id
      vmSize                    = "Standard_D2S_v3"
    }
  ]

  roleAssigments = var.role_assignments != {} ? [for key, role in var.role_assignments :
    {
      name                               = role.name
      roleDefinitionIdOrName             = role.role_definition_id_or_name
      principalId                        = role.principal_id
      description                        = role.description
      principalType                      = role.principal_type
      condition                          = role.condition
      conditionVersion                   = role.condition_version
      delegatedManagedIdentityResourceId = role.delegated_managed_identity_resource_id
    }
  ] : []

  subscription_id = var.subscription_id == null ? data.azurerm_subscription.current.subscription_id : var.subscription_id

  maintenance_configuration = (var.maintenance_window_auto_upgrade != null || var.maintenance_window_node_os != null) ? concat([
    var.maintenance_window_auto_upgrade != null ? {
      name = "aksManagedAutoUpgradeSchedule"
      maintenanceWindow = {
        durationHours = var.maintenance_window_auto_upgrade.duration
        schedule = {
          absoluteMonthly = var.maintenance_window_auto_upgrade.frequency == "AbsoluteMonthly" ? {
            dayOfmonth = var.maintenance_window_auto_upgrade.day_of_month
          } : null
          weekly = var.maintenance_window_auto_upgrade.frequency == "Weekly" ? {
            dayOfweek = var.maintenance_window_auto_upgrade.day_of_week
          } : null
          relativeMonthly = var.maintenance_window_auto_upgrade.frequency == "RelativeMonthly" ? {
            dayOfweek      = var.maintenance_window_auto_upgrade.day_of_week
            intervalMonths = var.maintenance_window_auto_upgrade.interval
            week_index     = var.maintenance_window_auto_upgrade.week_index != null ? var.maintenance_window_auto_upgrade.week_index : null
          } : null
          startDate = var.maintenance_window_auto_upgrade.start_date != null ? {
            date = var.maintenance_window_auto_upgrade.start_date
          } : null
          startTime = var.maintenance_window_auto_upgrade.start_time != null ? {
            time = var.maintenance_window_auto_upgrade.start_time
          } : null
          utcOffset = var.maintenance_window_auto_upgrade.utc_offset != null ? {
            offset = var.maintenance_window_auto_upgrade.utc_offset
          } : null
          notAllowedDates = var.maintenance_window_auto_upgrade.not_allowed != null ? {
            end   = var.maintenance_window_auto_upgrade.not_allowed.end
            start = var.maintenance_window_auto_upgrade.not_allowed.start
          } : null
        }
      }
    } : null], [
    var.maintenance_window_node_os != null ? {
      name = "aksManagedNodeOSUpgradeSchedule"
      maintenanceWindow = {
        durationHours = var.maintenance_window_node_os.duration
        schedule = {
          absoluteMonthly = var.maintenance_window_node_os.frequency == "AbsoluteMonthly" ? {
            dayOfmonth = var.maintenance_window_node_os.day_of_month
          } : null
          weekly = var.maintenance_window_node_os.frequency == "Weekly" ? {
            dayOfweek = var.maintenance_window_node_os.day_of_week
          } : null
          relativeMonthly = var.maintenance_window_node_os.frequency == "RelativeMonthly" ? {
            dayOfweek      = var.maintenance_window_node_os.day_of_week
            intervalMonths = var.maintenance_window_node_os.interval
            week_index     = var.maintenance_window_node_os.week_index != null ? var.maintenance_window_node_os.week_index : null
          } : null
          startDate = var.maintenance_window_node_os.start_date != null ? {
            date = var.maintenance_window_node_os.start_date
          } : null
          startTime = var.maintenance_window_node_os.start_time != null ? {
            time = var.maintenance_window_node_os.start_time
          } : null
          utcOffset = var.maintenance_window_node_os.utc_offset != null ? {
            offset = var.maintenance_window_node_os.utc_offset
          } : null
          notAllowedDates = var.maintenance_window_node_os.not_allowed != null ? {
            end   = var.maintenance_window_node_os.not_allowed.end
            start = var.maintenance_window_node_os.not_allowed.start
          } : null
        }
      }
  } : null]) : null
  # Experimental feature
  # nodeResourceGroupProfile = {
  #   restrictionLevel = "ReadOnly"
  # }

}