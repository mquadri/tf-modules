# tflint-ignore: terraform_required_providers
data "http" "bicep_json_release" {
  url = "https://raw.githubusercontent.com/Azure/bicep-registry-modules/avm/res/container-service/managed-cluster/0.8.3/avm/res/container-service/managed-cluster/main.json"
  request_headers = {
    Accept     = "application/json"
    User-Agent = "request module"
  }
}
resource "azapi_resource" "aks-deployment" {

  depends_on = [data.http.bicep_json_release, azurerm_user_assigned_identity.aks-spn, module.avm-rbac-assignments-management]
  lifecycle {
    precondition {
      condition     = (var.oms_agent_enabled && var.monitoring_workspace_id != null) || (!var.oms_agent_enabled)
      error_message = "If oms_agent_enabled is true, monitoring_workspace_id must be set"
    }
    precondition {
      condition     = (var.workload_identity_enabled && var.oidc_issuer_enabled) || (!var.workload_identity_enabled)
      error_message = "To enable Azure AD Workload Identity oidc_issuer_enabled must be set to true."
    }
  }


  type                   = "Microsoft.Resources/deployments@2024-03-01"
  name                   = "${local.naming}-${var.additionalcontext}"
  parent_id              = "/subscriptions/${local.subscription_id}/resourceGroups/${var.resource_group_name}"
  tags                   = local.tags
  response_export_values = ["*"]
  body = jsonencode({
    properties = {
      mode     = "Incremental"
      template = jsondecode(data.http.bicep_json_release.response_body)
      parameters = {
        aadProfile                                    = { value = local.aadProfile }
        aciConnectorLinuxEnabled                      = { value = false }
        adminUsername                                 = var.linux_profile != null ? { value = var.linux_profile.adminUsername } : {}
        agentPools                                    = { value = local.agentPools }
        aksServicePrincipalProfile                    = local.service_principal != null ? { value = local.service_principal } : {}
        appGatewayResourceId                          = var.ingress_application_gateway.enabled ? { value = var.ingress_application_gateway.gateway_id } : {}
        authorizedIPRanges                            = var.authorized_ip_ranges != null ? { value = var.authorized_ip_ranges } : {}
        autoNodeOsUpgradeProfileUpgradeChannel        = { value = var.node_os_upgrade_channel }
        autoScalerProfileBalanceSimilarNodeGroups     = { value = var.auto_scaler_profile.balance_similar_node_groups }
        autoScalerProfileExpander                     = { value = var.auto_scaler_profile.expander }
        autoScalerProfileMaxEmptyBulkDelete           = { value = var.auto_scaler_profile.empty_bulk_delete_max }
        autoScalerProfileMaxGracefulTerminationSec    = { value = var.auto_scaler_profile.max_graceful_termination_sec }
        autoScalerProfileMaxNodeProvisionTime         = { value = var.auto_scaler_profile.max_node_provisioning_time }
        autoScalerProfileMaxTotalUnreadyPercentage    = { value = var.auto_scaler_profile.max_unready_percentage }
        autoScalerProfileNewPodScaleUpDelay           = { value = var.auto_scaler_profile.new_pod_scale_up_delay }
        autoScalerProfileOkTotalUnreadyCount          = { value = var.auto_scaler_profile.max_unready_nodes }
        autoScalerProfileScaleDownDelayAfterAdd       = { value = var.auto_scaler_profile.scale_down_delay_after_add }
        autoScalerProfileScaleDownDelayAfterDelete    = { value = var.auto_scaler_profile.scale_down_delay_after_delete }
        autoScalerProfileScaleDownDelayAfterFailure   = { value = var.auto_scaler_profile.scale_down_delay_after_failure }
        autoScalerProfileScaleDownUnneededTime        = { value = var.auto_scaler_profile.scale_down_unneeded }
        autoScalerProfileScaleDownUnreadyTime         = { value = var.auto_scaler_profile.scale_down_unready }
        autoScalerProfileScanInterval                 = { value = var.auto_scaler_profile.scan_interval }
        autoScalerProfileSkipNodesWithLocalStorage    = { value = var.auto_scaler_profile.skip_nodes_with_local_storage }
        autoScalerProfileSkipNodesWithSystemPods      = { value = var.auto_scaler_profile.skip_nodes_with_system_pods }
        autoScalerProfileUtilizationThreshold         = { value = var.auto_scaler_profile.scale_down_utilization_threshold }
        autoUpgradeProfileUpgradeChannel              = { value = var.automatic_channel_upgrade }
        azurePolicyEnabled                            = { value = true }
        azurePolicyVersion                            = { value = "v2" }
        backendPoolType                               = var.network_profile.load_balancer_profile != null ? { value = var.network_profile.load_balancer_profile.backend_pool_type } : {}
        costAnalysisEnabled                           = { value = var.cost_analysis_enabled }
        defaultIngressControllerType                  = { value = var.defaultIngressControllerType }
        diagnosticSettings                            = local.diagnosticSettingsBicep != null ? { value = local.diagnosticSettingsBicep } : {}
        disableCustomMetrics                          = { value = false }
        disableLocalAccounts                          = { value = true }
        disablePrometheusMetricsScraping              = { value = false }
        disableRunCommand                             = { value = false }
        diskEncryptionSetResourceId                   = {}
        dnsPrefix                                     = { value = "${local.naming}-${var.additionalcontext}" }
        dnsServiceIP                                  = { value = var.network_profile.dns_service_ip }
        dnsZoneResourceId                             = { value = var.private_dns_zone_id }
        enableAzureDefender                           = { value = var.microsoft_defender.enabled }
        enableAzureMonitorProfileMetrics              = { value = false }
        enableContainerInsights                       = { value = var.enable_container_insights }
        enableDnsZoneContributorRoleAssignment        = { value = false }
        enableImageCleaner                            = { value = var.image_cleaner_interval_hours > 0 }
        enableKeyvaultSecretsProvider                 = { value = var.key_vault_secrets_provider.secret_rotation_enabled }
        enableOidcIssuerProfile                       = { value = var.oidc_issuer_enabled }
        enablePodSecurityPolicy                       = { value = false }
        enablePrivateCluster                          = { value = true }
        enablePrivateClusterPublicFQDN                = { value = false }
        enableRBAC                                    = { value = true }
        enableSecretRotation                          = { value = var.key_vault_secrets_provider.secret_rotation_enabled }
        enableStorageProfileBlobCSIDriver             = { value = var.storage_profile.blob_driver_enabled }
        enableStorageProfileDiskCSIDriver             = { value = var.storage_profile.disk_driver_enabled }
        enableStorageProfileFileCSIDriver             = { value = var.storage_profile.file_driver_enabled }
        enableStorageProfileSnapshotController        = { value = var.storage_profile.snapshot_controller_enabled }
        enableTelemetry                               = { value = false }
        enableWorkloadIdentity                        = { value = var.workload_identity_enabled }
        fluxExtension                                 = local.fluxExtension != null ? { value = local.fluxExtension } : {}
        httpApplicationRoutingEnabled                 = { value = var.http_application_routing_enabled }
        httpProxyConfig                               = {}
        identityProfile                               = local.identityProfile != null ? { value = local.identityProfile } : {}
        imageCleanerIntervalHours                     = { value = var.image_cleaner_interval_hours }
        ingressApplicationGatewayEnabled              = { value = var.ingress_application_gateway.enabled }
        istioServiceMeshCertificateAuthority          = local.istioServiceMeshCertificateAuthority != null ? { value = local.istioServiceMeshCertificateAuthority } : {}
        istioServiceMeshEnabled                       = var.service_mesh_profile != null ? { value = true } : { value = false }
        istioServiceMeshExternalIngressGatewayEnabled = { value = var.external_ingress_gateway_enabled }
        istioServiceMeshInternalIngressGatewayEnabled = { value = var.internal_ingress_gateway_enabled }
        istioservicemeshrevisions                     = var.service_mesh_profile != null ? { value = var.service_mesh_profile.revisions } : {}
        kedaAddon                                     = { value = var.workload_autoscaler_profile.keda_enabled }
        kubeDashboardEnabled                          = { value = false }
        kubernetesVersion                             = { value = var.kubernetes_version }
        loadBalancerSku                               = { value = var.network_profile.load_balancer_sku }
        location                                      = { value = var.location }
        lock                                          = var.lock != null ? { value = var.lock } : {}
        maintenanceConfigurations                     = local.maintenance_configuration != null ? { value = local.maintenance_configuration } : {}
        managedIdentities                             = { value = local.identitiesBicep }
        managedOutboundIPCount                        = var.network_profile.load_balancer_profile != null ? { value = var.network_profile.load_balancer_profile.managed_outbound_ip_count } : {}
        metricAnnotationsAllowList                    = { value = "" }
        metricLabelsAllowlist                         = { value = "" }
        monitoringWorkspaceResourceId                 = var.monitoring_workspace_id != null ? { value = var.monitoring_workspace_id } : {}
        name                                          = { value = "${local.naming}-${var.additionalcontext}" }
        networkDataplane                              = { value = var.network_profile.network_data_plane }
        networkPlugin                                 = { value = var.network_profile.network_plugin }
        networkPluginMode                             = { value = var.network_profile.network_plugin_mode }
        networkPolicy                                 = { value = var.network_profile.network_policy }
        nodeResourceGroup                             = var.node_resource_group != null ? { value = var.node_resource_group } : { value = "MC-${local.naming}-${var.additionalcontext}_nodes" }
        # Experimental Feature
        # nodeResourceGroupProfile = { value = {
        #   restrictionLevel = "ReadOnly"
        # } }
        omsAgentEnabled                                  = { value = var.oms_agent_enabled }
        omsAgentUseAADAuth                               = { value = var.oms_agent_use_aad_auth }
        openServiceMeshEnabled                           = { value = false }
        outboundType                                     = { value = var.network_profile.outbound_type }
        podCidr                                          = { value = var.network_profile.pod_cidr }
        podIdentityProfileAllowNetworkPluginKubenet      = { value = false }
        podIdentityProfileEnable                         = { value = false }
        podIdentityProfileUserAssignedIdentities         = {}
        podIdentityProfileUserAssignedIdentityExceptions = {}
        primaryAgentPoolProfiles                         = { value = local.primaryAgentPoolProfile }
        privateDNSZone                                   = { value = var.private_dns_zone_id }
        publicNetworkAccess                              = { value = "Disabled" }
        roleAssignments                                  = { value = local.roleAssigments }
        serviceCidr                                      = { value = var.network_profile.service_cidr }
        skuTier                                          = { value = local.sku_tier }
        sshPublicKey                                     = try(var.linux_profile.ssh_key, null) != null ? { value = var.linux_profile.ssh_key } : {}
        supportPlan                                      = { value = "KubernetesOfficial" }
        syslogPort                                       = { value = 28330 }
        tags                                             = { value = local.tags }
        vpaAddon                                         = { value = var.workload_autoscaler_profile.vertical_pod_autoscaler_enabled }
        webApplicationRoutingEnabled                     = { value = var.web_app_routing_enabled }
      }
    }
  })

}
