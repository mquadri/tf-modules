variable "flow_logs" {
  description = "A map of flow logs to be created."
  type = map(object({
    name                 = string
    location             = optional(string)
    network_watcher_name = string
    resource_group_name  = string

    # Storage Account Details
    storage_account_name = string
    storage_account_rg   = string

    # Virtual Network Details (Target Resource)
    vnet_name = string
    vnet_rg   = string

    # Flow Log Version
    version = optional(number, 1)

    # Retention Policy
    retention_policy = object({
      days    = number
      enabled = bool
    })

    # Traffic Analytics (Optional)
    traffic_analytics = optional(object({
      enabled               = bool
      workspace_id          = string
      workspace_region      = string
      workspace_resource_id = string
      interval_in_minutes   = optional(number, 60)
    }), null)

    # Condition Monitor
    condition_monitor = optional(map(object({
      name = string
      endpoint = set(object({
        address               = optional(string)
        coverage_level        = optional(string)
        excluded_ip_addresses = optional(set(string))
        included_ip_addresses = optional(set(string))
        name                  = string
        target_resource_id    = optional(string)
        target_resource_type  = optional(string)
        filter = optional(object({
          type = optional(string)
          item = optional(set(object({
            address = optional(string)
            type    = optional(string)
          })))
        }))
      }))
      test_configuration = set(object({
        name                      = string
        preferred_ip_version      = optional(string)
        protocol                  = string
        test_frequency_in_seconds = optional(number)
        http_configuration = optional(object({
          method                   = optional(string)
          path                     = optional(string)
          port                     = optional(number)
          prefer_https             = optional(bool)
          protocol                 = string
          valid_status_code_ranges = optional(set(string))
          request_header = optional(set(object({
            name  = string
            value = string
          })))
        }))
        icmp_configuration = optional(object({
          trace_route_enabled = optional(bool)
        }))
        success_threshold = optional(object({
          checks_failed_percent = optional(number)
          round_trip_time_ms    = optional(number)
        }))
        tcp_configuration = optional(object({
          destination_port_behavior = optional(string)
          port                      = number
          trace_route_enabled       = optional(bool)
        }))
      }))
      test_group = set(object({
        destination_endpoints    = set(string)
        enabled                  = optional(bool)
        name                     = string
        source_endpoints         = set(string)
        test_configuration_names = set(string)
      }))
      notes                         = optional(string, null)
      output_workspace_resource_ids = optional(list(string), null)
    })), null)

    # Telemetry
    enable_telemetry = optional(bool, true)

    # Lock
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)


    # Role Assignments
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

    # Tags
    tags = optional(map(string), null)
  }))
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
