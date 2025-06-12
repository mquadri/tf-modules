variable "avd_dcr_insights" {
  description = "Map of AVD Insights configurations."
  type = map(object({
    monitor_data_collection_rule_resource_group_name = string
    monitor_data_collection_rule_kind                = string
    monitor_data_collection_rule_location            = string
    monitor_data_collection_rule_name                = string

    monitor_data_collection_rule_data_flow = list(object({
      built_in_transform = optional(string)
      destinations       = list(string)
      output_stream      = optional(string)
      streams            = list(string)
      transform_kql      = optional(string)
    }))

    monitor_data_collection_rule_destinations = object({
      azure_monitor_metrics = optional(object({
        name = optional(string)
      }))
      event_hub = optional(object({
        event_hub_id = optional(string)
        name         = optional(string)
      }))
      event_hub_direct = optional(object({
        event_hub_id = optional(string)
        name         = optional(string)
      }))
      log_analytics = optional(object({
        name                  = optional(string)
        workspace_resource_id = optional(string)
      }))
      monitor_account = optional(list(object({
        monitor_account_id = optional(string)
        name               = optional(string)
      })))
      storage_blob = optional(list(object({
        container_name     = optional(string)
        name               = optional(string)
        storage_account_id = optional(string)
      })))
      storage_blob_direct = optional(list(object({
        container_name     = optional(string)
        name               = optional(string)
        storage_account_id = optional(string)
      })))
      storage_table_direct = optional(list(object({
        name               = optional(string)
        storage_account_id = optional(string)
        table_name         = optional(string)
      })))
    })

    monitor_data_collection_rule_data_sources = object({
      data_import = optional(object({
        event_hub_data_source = list(object({
          consumer_group = optional(string)
          name           = string
          stream         = string
        }))
      }))
      extension = optional(list(object({
        extension_json     = optional(string)
        extension_name     = string
        input_data_sources = optional(list(string))
        name               = string
        streams            = list(string)
      })))
      iis_log = optional(list(object({
        log_directories = optional(list(string))
        name            = string
        streams         = list(string)
      })))
      log_file = optional(list(object({
        file_patterns = list(string)
        format        = string
        name          = string
        streams       = list(string)
        settings = optional(object({
          text = object({
            record_start_timestamp_format = string
          })
        }))
      })))
      performance_counter = optional(list(object({
        counter_specifiers            = list(string)
        name                          = string
        sampling_frequency_in_seconds = number
        streams                       = list(string)
      })))
      platform_telemetry = optional(list(object({
        name    = string
        streams = list(string)
      })))
      prometheus_forwarder = optional(list(object({
        name    = string
        streams = list(string)
        label_include_filter = optional(set(object({
          label = string
          value = string
        })))
      })))
      syslog = optional(list(object({
        facility_names = list(string)
        log_levels     = list(string)
        name           = string
        streams        = optional(list(string))
      })))
      windows_event_log = optional(list(object({
        name           = string
        streams        = list(string)
        x_path_queries = list(string)
      })))
      windows_firewall_log = optional(list(object({
        name    = string
        streams = list(string)
      })))
    })

    monitor_data_collection_rule_timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))

    monitor_data_collection_rule_tags = optional(map(string))

    monitor_data_collection_rule_stream_declaration = optional(set(object({
      stream_name = string
      column = list(object({
        name = string
        type = string
      }))
    })))

    monitor_data_collection_rule_identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))

    monitor_data_collection_rule_description = optional(string)

    monitor_data_collection_rule_data_collection_endpoint_id = optional(string)

    monitor_data_collection_rule_association_name = optional(string)

    monitor_data_collection_rule_association_description = optional(string)

    monitor_data_collection_rule_association_data_collection_rule_id = optional(string)

    monitor_data_collection_rule_association_data_collection_endpoint_id = optional(string)

    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))

    enable_telemetry = bool

    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))

    #Diagnostic setting code in AVD-insights has a bug and this can only be used once bug is fixed in AVM.
    #For enabling Diagnostic setting for AVD-insights, use the Diagnostic setting module.
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
    })))

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
    vm_id                             = string
    vm_name                           = list(string)
    vm_extension_name                 = string
    vm_extension_publisher            = string
    vm_extension_type                 = string
    vm_extension_type_version         = string
    vm_extension_auto_upgrade_enabled = bool
    vm_association_name               = string
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
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}