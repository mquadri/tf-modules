# Required for each Redis cache instance
variable "redis_caches" {
  type = map(object({
    name                               = string
    location                           = string
    resource_group_name                = string
    subnet_name                        = optional(string, "")
    virtual_network_name               = optional(string, "")
    subnet_resource_group_name         = optional(string, "") # Fetch the subnet using this name
    capacity                           = optional(number, 2)
    sku_name                           = optional(string, "Premium")
    access_keys_authentication_enabled = optional(bool, null)
    cache_access_policies = optional(map(object({
      name        = string
      permissions = string
    })), {})
    cache_access_policy_assignments = optional(map(object({
      name               = string
      access_policy_name = string
      object_id          = string
      object_id_alias    = string
    })), {})
    cache_firewall_rules = optional(map(object({
      name     = string
      start_ip = string
      end_ip   = string
    })), {})
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
    enable_non_ssl_port = optional(bool, false)
    enable_telemetry    = optional(bool, true)
    linked_redis_caches = optional(map(object({
      linked_redis_cache_resource_id = string
      linked_redis_cache_location    = string
      server_role                    = string
    })), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})
    minimum_tls_version = optional(string, "1.2")
    patch_schedule = optional(set(object({
      day_of_week        = optional(string, "Saturday")
      maintenance_window = optional(string, "PT5H")
      start_hour_utc     = optional(number, 0)
    })), [])
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
      private_dns_zone_group_name             = optional(string, "default")
      subnet_resource_id                      = string
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
    private_static_ip_address               = optional(string, null)
    public_network_access_enabled           = optional(bool, true)
    redis_configuration = optional(object({
      aof_backup_enabled                       = optional(bool)
      aof_storage_connection_string_0          = optional(string)
      aof_storage_connection_string_1          = optional(string)
      enable_authentication                    = optional(bool)
      active_directory_authentication_enabled  = optional(bool)
      maxmemory_reserved                       = optional(number)
      maxmemory_delta                          = optional(number)
      maxfragmentationmemory_reserved          = optional(number)
      maxmemory_policy                         = optional(string)
      data_persistence_authentication_method   = optional(string)
      rdb_backup_enabled                       = optional(bool)
      rdb_backup_frequency                     = optional(number)
      rdb_backup_max_snapshot_count            = optional(number)
      rdb_storage_connection_string            = optional(string)
      storage_account_subscription_resource_id = optional(string)
      notify_keyspace_events                   = optional(string)
    }), {})
    redis_version        = optional(number, null)
    replicas_per_master  = optional(number, null)
    replicas_per_primary = optional(number, null)
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
    shard_count     = optional(number, null)
    tags            = optional(map(string), null)
    tenant_settings = optional(map(string), {})
    zones           = optional(list(string), ["1", "2", "3"])
  }))
  nullable = false
}

# tags
variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX","NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}

