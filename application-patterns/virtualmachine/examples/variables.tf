variable "vm_admin_pwd_keyvault_name" {
  description = "keyvault name to store admin password"
  type        = string
}

variable "machine_creds_akv_rg" {
  description = "keyvault name resource group name"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "vm_config" {
  description = "define the configuration for vm"
  type = map(object({
    vm_name                            = string
    resource_group_name                = string
    vm_size                            = string
    admin_username                     = string
    additionalcontext                  = string
    akv_resource_id                    = optional(string)
    availability_zone                  = optional(string, null)
    computer_name                      = optional(string, null)
    os_kernel_type                     = string
    generate_admin_password_or_ssh_key = bool
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))
    eviction_policy = optional(string, null)
    tags = object({
      app_id              = string
      appname             = string
      appid               = string
      env                 = string
      costCenter          = string
      costVP              = string
      costAppOwnerTech    = string
      costAppOwnerManager = string
      costBudgetOwner     = string
      costDivision        = string
      costAllocation      = string
      appFunction         = string
      monthlyBudget       = string
      costbaseline        = string
      managed_by          = string
      environment         = string
      msftmigration       = string
      os_support          = string
    })
    data_disk_config = optional(object({
      data_disk_enabled          = optional(bool)
      disk_controller_type       = optional(string, null)
      encryption_at_host_enabled = optional(bool, null)
      data_disks = optional(map(object({
        data_disk_name         = string
        data_disk_type         = string
        data_disk_size_gb      = number
        data_disk_caching      = string
        data_disk_machine_lun  = number
        trusted_launch_enabled = optional(bool, false)
      })))
    }))
    os_disk_config = object({
      os_disk_name              = string
      os_disk_cache             = string
      os_disk_size_gb           = number
      os_disk_type              = string
      os_disk_write_accelerator = bool
    })
    plan = optional(object({
      name      = string
      product   = string
      publisher = string
    }))
    source_image_config = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    network_interfaces = map(object({
      name = string
      ip_configurations = map(object({
        name = string
        app_gateway_backend_pools = optional(map(object({
          app_gateway_backend_pool_resource_id = string
        })), {})
        create_public_ip_address                                    = optional(bool, false)
        gateway_load_balancer_frontend_ip_configuration_resource_id = optional(string)
        is_primary_ipconfiguration                                  = optional(bool, true)
        load_balancer_backend_pools = optional(map(object({
          load_balancer_backend_pool_resource_id = string
        })), {})
        load_balancer_nat_rules = optional(map(object({
          load_balancer_nat_rule_resource_id = string
        })), {})
        private_ip_address            = optional(string)
        private_ip_address_allocation = optional(string, "Dynamic")
        private_ip_address_version    = optional(string, "IPv4")
        private_ip_subnet_resource_id = optional(string)
        public_ip_address_lock_name   = optional(string)
        public_ip_address_name        = optional(string)
        public_ip_address_resource_id = optional(string)
      }))
      accelerated_networking_enabled = optional(bool, false)
      application_security_groups = optional(map(object({
        application_security_group_resource_id = string
      })), {})
      diagnostic_settings = optional(map(object({
        name                                     = optional(string, null)
        log_categories                           = optional(set(string), [])
        log_groups                               = optional(set(string), [])
        metric_categories                        = optional(set(string), ["AllMetrics"])
        log_analytics_destination_type           = optional(string, null)
        workspace_resource_id                    = optional(string, null)
        storage_account_resource_id              = optional(string, null)
        event_hub_authorization_rule_resource_id = optional(string, null)
        event_hub_name                           = optional(string, null)
        marketplace_partner_resource_id          = optional(string, null)
      })), {})
      dns_servers             = optional(list(string))
      inherit_tags            = optional(bool, true)
      internal_dns_name_label = optional(string)
      ip_forwarding_enabled   = optional(bool, false)
      lock_level              = optional(string)
      lock_name               = optional(string)
      network_security_groups = optional(map(object({
        network_security_group_resource_id = string
      })), {})
      resource_group_name = optional(string)
      role_assignments = optional(map(object({
        principal_id                           = string
        role_definition_id_or_name             = string
        assign_to_child_public_ip_addresses    = optional(bool, true)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        principal_type                         = optional(string, null)
      })), {})
      tags = optional(map(string), null)
    }))
    default_private_nic_enabled = optional(bool, false)
    public_ip_enabled           = optional(bool, false)
    public_ip_sku               = optional(string)
    public_vnet_name            = optional(string, "")
    public_vnet_rg              = optional(string, "")
    public_subnet               = optional(string, "")
    public_nsg                  = optional(string, "")
    public_nsg_rg               = optional(string, "")
    sr_sec_exception            = optional(string, "")
    public_only                 = optional(bool, false)
    nsg_diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), ["allLogs"])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
    machine_ssh_port = optional(number, 22)
    additional_security_rules = optional(map(object({
      access                                     = string
      name                                       = string
      description                                = optional(string)
      destination_address_prefix                 = optional(string)
      destination_address_prefixes               = optional(set(string))
      destination_application_security_group_ids = optional(set(string))
      destination_port_range                     = optional(string)
      destination_port_ranges                    = optional(set(string))
      direction                                  = string
      priority                                   = number
      protocol                                   = string
      source_address_prefix                      = optional(string)
      source_address_prefixes                    = optional(set(string))
      source_application_security_group_ids      = optional(set(string))
      source_port_range                          = optional(string)
      source_port_ranges                         = optional(set(string))
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    })), {})
    nsg_creation_enabled     = optional(bool, false)
    vnet_name                = string
    subnet_name              = string
    accelerated_networking   = optional(bool, false)
    vnet_resource_group_name = string
    storage_analytics_name   = optional(string, null)
    storage_account_rg_name  = optional(string, null)

    auto_shutdown_config = optional(object({
      auto_shutdown_enabled                  = optional(bool, false)
      auto_shutdown_time                     = optional(string)
      auto_shutdown_timezone                 = optional(string)
      auto_shutdown_notification_enabled     = optional(bool, false)
      auto_shutdown_notification_time        = optional(string, null)
      auto_shutdown_notification_webhook_url = optional(string, null)
    }), {})
    additional_unattend_contents = optional(list(object({
      content = string
      setting = string
    })), [])
    bypass_platform_safety_checks_on_user_schedule_enabled = optional(bool, false)
    capacity_reservation_group_id                          = optional(string, null)
    proximity_placement_group                              = optional(string, null)
    dedicated_host_group_resource_id                       = optional(string, null)
    dedicated_host_resource_id                             = optional(string, null)
    edge_zone                                              = optional(string, null)
    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), [])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
    extensions = optional(map(object({
      kernel_type                 = string
      name                        = string
      publisher                   = string
      type                        = string
      type_handler_version        = string
      auto_upgrade_minor_version  = optional(bool)
      automatic_upgrade_enabled   = optional(bool)
      failure_suppression_enabled = optional(bool, false)
      settings                    = optional(string)
      protected_settings          = optional(string)
      provision_after_extensions  = optional(list(string), [])
      tags                        = optional(map(string), null)
      protected_settings_from_key_vault = optional(object({
        secret_url      = string
        source_vault_id = string
      }))
    })), {})
    lock = optional(object({
      name = optional(string, null)
      kind = string
    }), null)
    max_bid_price       = optional(number, -1)
    priority            = optional(string, "Regular")
    vtpm_enabled        = optional(bool, false)
    secure_boot_enabled = optional(bool, null)
    azure_backup_configurations = optional(map(object({
      resource_group_name       = optional(string, null)
      recovery_vault_name       = string
      backup_policy_resource_id = optional(string, null)
      exclude_disk_luns         = optional(list(number), null)
      include_disk_luns         = optional(list(number), null)
      protection_state          = optional(string, null)
    })), {})
    license_type                 = optional(string, null)
    availability_set_resource_id = optional(string, null)
    source_image_resource_id     = optional(string, null)

    new_backup_config = optional(object({
      create_recovery_vault          = optional(bool, false)
      recovery_create_resource_group = optional(bool, null)
      recovery_resource_group_name   = optional(string, null)
      recovery_rg_role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })), {})
      recovery_lock = optional(object({
        kind = string
        name = optional(string, null)
      }), null)
      recovery_location                           = optional(string, null)
      recovery_services_vault_name                = optional(string, null)
      recovery_vault_sku                          = optional(string, "Standard")
      recovery_vault_storage_mode_type            = optional(string, "LocallyRedundant")
      recovery_vault_cross_region_restore_enabled = optional(bool, false)
      recovery_vault_soft_delete_enabled          = optional(bool, true)
      recovery_vault_immutability                 = optional(string, "Disabled")
      recovery_enable_encryption                  = optional(bool, false)
      recovery_vault_identity_type                = optional(string, null)
      recovery_enable_private_endpoint            = optional(bool, false)
      recovery_subscription_id                    = optional(string, null)
      recovery_pe_subnet_name                     = optional(string, null)
      recovery_virtual_network_name               = optional(string, null)
      recovery_virtual_network_rg                 = optional(string, null)
      recovery_vm_backup_policies = optional(map(object({
        name                           = string
        policy_type                    = string
        timezone                       = string
        instant_restore_retention_days = optional(number)
        frequency                      = string
        time                           = string
        hour_interval                  = optional(number)
        hour_duration                  = optional(number)
        weekdays                       = optional(set(string))
        daily = optional(list(object({
          count = number
        })), [])
        weekly = optional(list(object({
          count    = number
          weekdays = optional(set(string))
        })), [])
        monthly = optional(list(object({
          count             = number
          weekdays          = optional(set(string))
          weeks             = optional(set(string))
          days              = optional(set(number))
          include_last_days = optional(bool)
        })), [])
        yearly = optional(list(object({
          count             = number
          weekdays          = optional(set(string))
          weeks             = optional(set(string))
          months            = optional(set(string))
          days              = optional(set(number))
          include_last_days = optional(bool)
        })), [])
      })), {})
      file_share_backup_policies = optional(map(object({
        name      = string
        timezone  = string
        frequency = string
        time      = string
        daily = optional(list(object({
          count = number
        })), [])
        weekly = optional(list(object({
          count    = number
          weekdays = set(string)
        })), [])
        monthly = optional(list(object({
          count             = number
          weekdays          = optional(set(string))
          weeks             = optional(set(string))
          days              = optional(set(number))
          include_last_days = optional(bool)
        })), [])
        yearly = optional(list(object({
          count             = number
          weekdays          = optional(set(string))
          weeks             = optional(set(string))
          months            = optional(set(string))
          days              = optional(set(number))
          include_last_days = optional(bool)
        })), [])
      })), {})
      recovery_key_vault_key_name          = optional(string, null)
      recovery_key_vault_name              = optional(string, null)
      recovery_key_vault_rg_name           = optional(string, null)
      infrastructure_encryption_enabled    = optional(bool, false)
      recovery_kv_role_definition          = optional(string, "Key Vault Crypto Service Encryption User")
      user_assigned_identity_rg_name       = optional(string, null)
      existing_user_assigned_identity_name = optional(string, null)
      recovery_vault_public_access_enabled = optional(bool, false)
      recovery_private_endpoints = optional(map(object({
        name                           = string
        private_connection_resource_id = string
        is_manual_connection           = optional(bool)
        subresource_names              = list(string)
        request_message                = optional(string)
        private_dns_zone_group_name    = optional(string)
        private_dns_zone_ids           = optional(list(string))
      })), {})
      recovery_domain_name = optional(string, null)
      recovery_a_records = optional(map(object({
        name                = string
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        records             = list(string)
        tags                = optional(map(string), null)
      })), {})
      recovery_aaa_records = optional(map(object({
        name                = string
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        records             = list(string)
        tags                = optional(map(string), null)
      })), {})
      recovery_cname_records = optional(map(object({
        name                = string
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        record              = string
        tags                = optional(map(string), null)
      })), {})
      recovery_mx_records = optional(map(object({
        name                = optional(string, "@")
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        records = map(object({
          preference = number
          exchange   = string
        }))
        tags = optional(map(string), null)
      })), {})
      recovery_enable_telemetry = optional(bool, true)
      recovery_ptr_records = optional(map(object({
        name                = string
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        records             = list(string)
        tags                = optional(map(string), null)
      })), {})
      recovery_soa_record = optional(object({
        email        = string
        expire_time  = optional(number, 2419200)
        minimum_ttl  = optional(number, 10)
        refresh_time = optional(number, 3600)
        retry_time   = optional(number, 300)
        ttl          = optional(number, 3600)
        tags         = optional(map(string), null)
      }), null)
      recovery_srv_records = optional(map(object({
        name                = string
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        records = map(object({
          priority = number
          weight   = number
          port     = number
          target   = string
        }))
        tags = optional(map(string), null)
      })), {})
      recovery_txt_records = optional(map(object({
        name                = string
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        records = map(object({
          value = string
        }))
        tags = optional(map(string), null)
      })), {})
      recovery_tags = optional(map(string), null)
      recovery_virtual_network_links = optional(map(object({
        vnetlinkname     = string
        vnetid           = string
        autoregistration = optional(bool, false)
        tags             = optional(map(string), null)
      })), {})
      recovery_dns_zone_id                    = optional(string, "")
      recovery_create_dns_zone                = optional(bool, false)
      recovery_enable_diagnostic_setting      = optional(bool, false)
      recovery_diagnostics_settings_name      = optional(string, null)
      recovery_log_categories                 = optional(list(string), [])
      recovery_excluded_log_categories        = optional(list(string), [])
      recovery_metric_categories              = optional(list(string), [])
      recovery_logs_destinations_ids          = optional(list(string), [""])
      recovery_log_analytics_destination_type = optional(string, "AzureDiagnostics")
    }), {})
  }))
}
