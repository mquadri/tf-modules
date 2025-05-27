variable "datacollection_endpoint" {
  description = "A map of data collection endpoints"
  type = map(object({
    monitor_data_collection_endpoint_name        = string
    monitor_data_collection_endpoint_kind        = string
    monitor_data_collection_endpoint_description = string
  }))
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resource"
  type        = map(string)
  default     = {}
}

variable "data_sources" {
  description = "Map containing various data source configurations"
  type = object({
    syslog = optional(list(object({
      facility_names = list(string),
      log_levels     = list(string),
      name           = string,
      streams        = list(string)
    })))
    performance_counter = optional(list(object({
      streams                       = list(string),
      sampling_frequency_in_seconds = number,
      counter_specifiers            = list(string),
      name                          = optional(string)
    })))
    windows_event_log = optional(list(object({
      streams        = list(string),
      x_path_queries = list(string),
      name           = optional(string)
    })))
    extension = optional(list(object({
      streams        = list(string),
      extension_name = optional(string),
      name           = string
    })))
    iis_log = optional(list(object({
      streams         = list(string),
      name            = string,
      log_directories = list(string)
    })))
    log_file = optional(list(object({
      format        = string,
      file_patterns = list(string),
      name          = string,
      streams       = list(string),
      settings = map(object({
        text = object({
          record_start_timestamp_format = string
        })
      }))
    })))
  })
  default = {}
}

variable "monitor_data_collection_rule" {
  description = "Map containing log analytics data export rules"
  type = map(object({
    rule_name                     = string
    dcr_rg_name                   = string
    description                   = string
    log_analytics_name            = string
    data_collection_endpoint_name = string // Name of the Azure monitor data collection endpoint
    log_analytics_id              = string
    kind                          = string
    public_network_access_enabled = optional(bool, false)
    streams                       = optional(list(string))
    destinations                  = list(string)
    transform_kql                 = optional(string)
  }))
  default = {
  }
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

variable "dcr_association" {
  type = map(object({
    name                    = string
    target_resource_id      = string
    data_collection_rule_id = string
  }))
  description = "Map of DCR Association"
  default     = {}
}

