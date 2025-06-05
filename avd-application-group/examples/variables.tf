variable "application_groups" {
  type = map(object({
    virtual_desktop_application_group_resource_group_name          = string
    virtual_desktop_application_group_name                         = string
    virtual_desktop_application_group_location                     = string
    virtual_desktop_application_group_type                         = string
    virtual_desktop_application_group_host_pool_id                 = optional(string)
    host_pool_name                                                 = optional(string)
    host_pool_resource_group_name                                  = optional(string)
    virtual_desktop_application_group_description                  = optional(string)
    virtual_desktop_application_group_default_desktop_display_name = optional(string)
    diagnostic_settings                                            = optional(map(any))
    enable_telemetry                                               = optional(bool)
    lock                                                           = optional(map(any))
    role_assignments                                               = optional(map(any))
    tracing_tags_enabled                                           = optional(bool)
    tracing_tags_prefix                                            = optional(string)
    virtual_desktop_application_group_friendly_name                = optional(string)
    virtual_desktop_application_group_tags                         = optional(map(string))
    virtual_desktop_application_group_timeouts                     = optional(map(string))
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