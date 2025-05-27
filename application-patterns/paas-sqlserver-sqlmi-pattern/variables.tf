#PaaS SQL server & DB variables
variable "application_sql_server" {
  type = map(object({
    location            = string
    resource_group_name = string
    diagnostic_settings = optional(map(object({
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
    enable_telemetry = optional(bool, false)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})
    name = string
    private_endpoints = optional(map(object({
      name = optional(string, null)
      role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })), {})
      lock = optional(object({
        kind = string
        name = optional(string, null)
      }), null)
      tags               = optional(map(string), null)
      subnet_resource_id = string
      #subresource_name                        = string # NOTE: `subresource_name` can be excluded if the resource does not support multiple sub resource types (e.g. storage account supports blob, queue, etc)
      private_dns_zone_group_name             = optional(string, "default")
      private_dns_zone_resource_ids           = optional(set(string), [])
      application_security_group_associations = optional(map(string), {})
      private_service_connection_name         = optional(string, null)
      network_interface_name                  = optional(string, null)
      location                                = optional(string, null)
      resource_group_name                     = optional(string, null)
      ip_configurations = optional(map(object({
        name               = string
        private_ip_address = string
      })), {})
    })), {})
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    tags                = optional(map(string), null)
    server_version      = string
    administrator_login = optional(string, null)
    connection_policy   = optional(string, null)
    azuread_administrator = optional(object({
      azuread_authentication_only = optional(bool, false)
      login_username              = string
      object_id                   = string
      tenant_id                   = optional(string, null)
    }), null)
    public_network_access_enabled                = optional(bool, false)
    outbound_network_restriction_enabled         = optional(bool, false)
    primary_user_assigned_identity_id            = optional(string, null)
    transparent_data_encryption_key_vault_key_id = optional(string, null)
    firewall_rules = optional(map(object({
      end_ip_address   = string
      start_ip_address = string
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    })), {})
    elastic_pools = optional(map(object({
      name     = string
      location = optional(string)
      sku = optional(object({
        name     = string
        capacity = number
        tier     = string
        family   = optional(string)
      }))
      per_database_settings = optional(object({
        min_capacity = number
        max_capacity = number
      }))
      maintenance_configuration_name = optional(string, "SQL_Default")
      zone_redundant                 = optional(bool, "true")
      license_type                   = optional(string)
      max_size_gb                    = optional(number)
      max_size_bytes                 = optional(number)

      role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })))

      lock = optional(object({
        kind = string
        name = optional(string, null)
      }))

      diagnostic_settings = optional(map(object({
        name                            = optional(string, null)
        event_hub_authorization_rule_id = optional(string, null)
        event_hub_name                  = optional(string, null)
        log_analytics_destination_type  = optional(string, null)
        log_analytics_workspace_id      = optional(string, null)
        marketplace_partner_resource_id = optional(string, null)
        storage_account_resource_id     = optional(string, null)
        log_categories                  = optional(list(string))
        log_groups                      = optional(list(string))
      })))

      tags = optional(map(string))
    })), {})
    databases = optional(map(object({
      name                                                       = string
      auto_pause_delay_in_minutes                                = optional(number)
      create_mode                                                = optional(string, "Default")
      collation                                                  = optional(string)
      elastic_pool_key                                           = optional(string)
      geo_backup_enabled                                         = optional(bool, true)
      maintenance_configuration_name                             = optional(string)
      ledger_enabled                                             = optional(bool, false)
      license_type                                               = optional(string)
      max_size_gb                                                = optional(number)
      min_capacity                                               = optional(number)
      restore_point_in_time                                      = optional(string)
      recover_database_id                                        = optional(string)
      restore_dropped_database_id                                = optional(string)
      read_replica_count                                         = optional(number)
      read_scale                                                 = optional(bool)
      sample_name                                                = optional(string)
      sku_name                                                   = optional(string)
      storage_account_type                                       = optional(string, "Geo")
      transparent_data_encryption_enabled                        = optional(bool, true)
      transparent_data_encryption_key_vault_key_id               = optional(string)
      transparent_data_encryption_key_automatic_rotation_enabled = optional(bool)
      zone_redundant                                             = optional(bool)

      import = optional(object({
        storage_uri            = string
        storage_key            = string
        storage_key_type       = string
        administrator_login    = string
        administrator_password = string
        authentication_type    = string
        storage_account_id     = optional(string)
      }))

      long_term_retention_policy = optional(object({
        weekly_retention  = string
        monthly_retention = string
        yearly_retention  = string
        week_of_year      = number
      }))

      short_term_retention_policy = optional(object({
        retention_days           = number
        backup_interval_in_hours = optional(number, 12)
      }))

      threat_detection_policy = optional(object({
        state                      = optional(string, "Disabled")
        disabled_alerts            = optional(list(string))
        email_account_admins       = optional(string, "Disabled")
        email_addresses            = optional(list(string))
        retention_days             = optional(number)
        storage_account_access_key = optional(string)
        storage_endpoint           = optional(string)
      }))

      role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })))

      lock = optional(object({
        kind = string
        name = optional(string, null)
      }))

      diagnostic_settings = optional(map(object({
        name                            = optional(string, null)
        event_hub_authorization_rule_id = optional(string, null)
        event_hub_name                  = optional(string, null)
        log_analytics_destination_type  = optional(string, null)
        log_analytics_workspace_id      = optional(string, null)
        marketplace_partner_resource_id = optional(string, null)
        storage_account_resource_id     = optional(string, null)
        log_categories                  = optional(list(string))
        log_groups                      = optional(list(string))
      })))

      managed_identities = optional(object({
        system_assigned            = optional(bool, false)
        user_assigned_resource_ids = optional(set(string), [])
      }))

      tags = optional(map(string))
    })), {})
    key_vault_name    = optional(string, null)
    key_vault_rg_name = optional(string, null)
    msftmigration     = string
    environment       = string
    app_id            = string
  }))
  default = {}
}




#SQL Managed instance variables
variable "application_sql_mi" {
  type = map(object({
    resourcetype        = string
    appid               = string
    appname             = string
    env                 = string
    environment         = string
    msftmigration       = string
    additionalcontext   = string
    location            = string
    resource_group_name = string
    diagnostic_settings = optional(map(object({
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
    enable_telemetry = optional(bool, true)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})
    private_endpoints = optional(map(object({
      name = optional(string, null)
      role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })), {})
      lock = optional(object({
        kind = string
        name = optional(string, null)
      }), null)
      tags                                    = optional(map(string), null)
      subnet_resource_id                      = string
      private_dns_zone_group_name             = optional(string, "default")
      private_dns_zone_resource_ids           = optional(set(string), [])
      application_security_group_associations = optional(map(string), {})
      private_service_connection_name         = optional(string, null)
      network_interface_name                  = optional(string, null)
      location                                = optional(string, null)
      resource_group_name                     = optional(string, null)
      ip_configurations = optional(map(object({
        name               = string
        private_ip_address = string
      })), {})
    })), {})
    private_endpoints_manage_dns_zone_group = optional(bool, true)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    tags = optional(map(string), null)
    databases = optional(map(object({
      name                      = string
      short_term_retention_days = optional(number)
      long_term_retention_policy = optional(object({
        monthly_retention = optional(string)
        week_of_year      = optional(number)
        weekly_retention  = optional(string)
        yearly_retention  = optional(string)
      }))
      point_in_time_restore = optional(object({
        restore_point_in_time = string
        source_database_id    = string
      }))
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    })), {})
    failover_group = optional(map(object({
      location                                  = optional(string)
      name                                      = optional(string)
      partner_managed_instance_id               = optional(string)
      readonly_endpoint_failover_policy_enabled = optional(bool)
      read_write_endpoint_failover_policy = optional(object({
        grace_minutes = optional(number)
        mode          = optional(string)
      }))
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    })), {})
    administrator_login               = string
    enable_advanced_threat_protection = optional(bool, true)
    license_type                      = string
    sku_name                          = string
    storage_size_in_gb                = number
    subnet_id                         = string
    vcores                            = number
    collation                         = optional(string, null)
    dns_zone_partner_id               = optional(string, null)
    maintenance_configuration_name    = optional(string, null)
    minimum_tls_version               = optional(string, null)
    proxy_override                    = optional(string, null)
    public_data_endpoint_enabled      = optional(bool, null)
    storage_account_type              = optional(string, null)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), null)
    timezone_id = optional(string, null)
    transparent_data_encryption = optional(object({
      auto_rotation_enabled = optional(bool)
      key_vault_key_id      = optional(string)
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    }), {})
    active_directory_administrator = optional(object({
      azuread_authentication_only = optional(bool)
      login_username              = optional(string)
      object_id                   = optional(string)
      tenant_id                   = optional(string)
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    }), {})
    security_alert_policy = optional(object({
      disabled_alerts              = optional(set(string))
      email_account_admins_enabled = optional(bool)
      email_addresses              = optional(set(string))
      enabled                      = optional(bool)
      retention_days               = optional(number)
      storage_account_access_key   = optional(string)
      storage_endpoint             = optional(string)
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    }), {})
    storage_account_resource_id = optional(string, null)
    vulnerability_assessment = optional(object({
      storage_account_access_key = optional(string)
      storage_container_path     = optional(string)
      storage_container_sas_key  = optional(string)
      recurring_scans = optional(object({
        email_subscription_admins = optional(bool)
        emails                    = optional(list(string))
        enabled                   = optional(bool)
      }))
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    }), null)
    zone_redundant_enabled = optional(bool, true)
    key_vault_name         = string
    key_vault_rg_name      = string
  }))
  default = {}
}
