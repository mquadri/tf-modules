variable "workspaces" {
  type = map(object({
    virtual_desktop_workspace_name                = string
    virtual_desktop_workspace_resource_group_name = string
    virtual_desktop_workspace_location            = string
    resource_group_name                           = string
    diagnostic_settings                           = optional(map(any))
    enable_telemetry                              = optional(bool)
    lock                                          = optional(map(any))
    workspaces_appgroup_association = optional(list(object({
      appgroup_name                = optional(string)
      appgroup_resource_group_name = optional(string)
    })))
    private_endpoints                                       = optional(map(any))
    role_assignments                                        = optional(map(any))
    subresource_names                                       = optional(list(string))
    tags                                                    = optional(map(string))
    tracing_tags_enabled                                    = optional(bool)
    tracing_tags_prefix                                     = optional(string)
    virtual_desktop_workspace_description                   = optional(string)
    virtual_desktop_workspace_friendly_name                 = optional(string)
    virtual_desktop_workspace_public_network_access_enabled = optional(bool)
    virtual_desktop_workspace_tags                          = optional(map(string))
    virtual_desktop_workspace_timeouts                      = optional(map(string))
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
