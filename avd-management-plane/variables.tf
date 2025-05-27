variable "management_plane" {
  description = "Management plane configuration for Azure Virtual Desktop"
  type = map(object({
    location                                     = string
    log_analytics_workspace_name                 = string
    resource_group_name                          = string
    virtual_desktop_application_group_name       = string
    virtual_desktop_application_group_type       = string
    virtual_desktop_host_pool_load_balancer_type = string
    virtual_desktop_host_pool_name               = string
    virtual_desktop_host_pool_type               = string
    virtual_desktop_scaling_plan_name            = string
    virtual_desktop_scaling_plan_time_zone       = string
    virtual_desktop_workspace_name               = string
    enable_telemetry                             = optional(bool, true)
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})
    public_network_access_enabled  = optional(bool, true)
    registration_expiration_period = optional(string, "48h")
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
    schedules = optional(map(object({
      name                                 = string
      days_of_week                         = set(string)
      off_peak_start_time                  = string
      off_peak_load_balancing_algorithm    = string
      ramp_down_capacity_threshold_percent = number
      ramp_down_force_logoff_users         = bool
      ramp_down_load_balancing_algorithm   = string
      ramp_down_minimum_hosts_percent      = number
      ramp_down_notification_message       = string
      ramp_down_start_time                 = string
      ramp_down_stop_hosts_when            = string
      ramp_down_wait_time_minutes          = number
      peak_start_time                      = string
      peak_load_balancing_algorithm        = string
      ramp_up_capacity_threshold_percent   = optional(number)
      ramp_up_load_balancing_algorithm     = string
      ramp_up_minimum_hosts_percent        = optional(number)
      ramp_up_start_time                   = string
      })), {
      schedule1 = {
        name                                 = "Weekdays"
        days_of_week                         = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
        ramp_up_start_time                   = "05:00"
        ramp_up_load_balancing_algorithm     = "BreadthFirst"
        ramp_up_minimum_hosts_percent        = 20
        ramp_up_capacity_threshold_percent   = 10
        peak_start_time                      = "09:00"
        peak_load_balancing_algorithm        = "BreadthFirst"
        ramp_down_start_time                 = "19:00"
        ramp_down_load_balancing_algorithm   = "DepthFirst"
        ramp_down_minimum_hosts_percent      = 10
        ramp_down_force_logoff_users         = false
        ramp_down_wait_time_minutes          = 45
        ramp_down_notification_message       = "Please log off in the next 45 minutes..."
        ramp_down_capacity_threshold_percent = 5
        ramp_down_stop_hosts_when            = "ZeroSessions"
        off_peak_start_time                  = "22:00"
        off_peak_load_balancing_algorithm    = "DepthFirst"
      }
    })
    subresource_names                                              = optional(list(string), [])
    time_zone                                                      = optional(string, "Eastern Standard Time")
    tracing_tags_enabled                                           = optional(bool, false)
    tracing_tags_prefix                                            = optional(string, "avm_")
    virtual_desktop_application_group_default_desktop_display_name = optional(string, null)
    virtual_desktop_application_group_description                  = optional(string, null)
    virtual_desktop_application_group_friendly_name                = optional(string, null)
    virtual_desktop_application_group_tags                         = optional(map(string), null)
    virtual_desktop_application_group_timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), null)
    virtual_desktop_host_pool_custom_rdp_properties            = optional(string, "drivestoredirect:s:*;audiomode:i:0;videoplaybackmode:i:1;redirectclipboard:i:1;redirectprinters:i:1;devicestoredirect:s:*;redirectcomports:i:1;redirectsmartcards:i:1;usbdevicestoredirect:s:*;enablecredsspsupport:i:1;use multimon:i:0")
    virtual_desktop_host_pool_description                      = optional(string, null)
    virtual_desktop_host_pool_friendly_name                    = optional(string, null)
    virtual_desktop_host_pool_maximum_sessions_allowed         = optional(number, null)
    virtual_desktop_host_pool_personal_desktop_assignment_type = optional(string, null)
    virtual_desktop_host_pool_preferred_app_group_type         = optional(string, null)
    virtual_desktop_host_pool_scheduled_agent_updates = optional(object({
      enabled                   = optional(bool)
      timezone                  = optional(string)
      use_session_host_timezone = optional(bool)
      schedule = optional(list(object({
        day_of_week = string
        hour_of_day = number
      })))
    }), null)
    virtual_desktop_host_pool_start_vm_on_connect = optional(bool, null)
    virtual_desktop_host_pool_tags                = optional(map(string), null)
    virtual_desktop_host_pool_timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), null)
    virtual_desktop_host_pool_validate_environment = optional(bool, null)
    virtual_desktop_scaling_plan_description       = optional(string, null)
    virtual_desktop_scaling_plan_exclusion_tag     = optional(string, null)
    virtual_desktop_scaling_plan_friendly_name     = optional(string, null)
    virtual_desktop_scaling_plan_host_pool = optional(list(object({
      hostpool_id          = string
      scaling_plan_enabled = bool
    })), null)
    virtual_desktop_scaling_plan_tags = optional(map(string), null)
    virtual_desktop_scaling_plan_timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), null)
    virtual_desktop_workspace_description                   = optional(string, null)
    virtual_desktop_workspace_friendly_name                 = optional(string, null)
    virtual_desktop_workspace_public_network_access_enabled = optional(bool, null)
    virtual_desktop_workspace_tags                          = optional(map(string), null)
    virtual_desktop_workspace_timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), null)
  }))
  default = {}
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
