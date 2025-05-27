management_plane = {
  "management-plane" = {
    location                                     = "eastus"
    log_analytics_workspace_name                 = "law-test"
    resource_group_name                          = "test-rg"
    virtual_desktop_application_group_name       = "test-ag"
    virtual_desktop_application_group_type       = "RemoteApp"
    virtual_desktop_host_pool_load_balancer_type = "BreadthFirst"
    virtual_desktop_host_pool_name               = "test-host-pool-1"
    virtual_desktop_host_pool_type               = "Pooled"
    virtual_desktop_scaling_plan_name            = "example-scaling-plan"
    virtual_desktop_scaling_plan_time_zone       = "GMT Standard Time"
    virtual_desktop_workspace_name               = "avd-workspace"
    enable_telemetry                             = false
    managed_identities = {
      system_assigned            = false
      user_assigned_resource_ids = []
    }
    private_endpoints                                              = {}
    public_network_access_enabled                                  = true
    registration_expiration_period                                 = "48h"
    role_assignments                                               = {}
    schedules                                                      = {}
    subresource_names                                              = []
    time_zone                                                      = "Eastern Standard Time"
    tracing_tags_enabled                                           = false
    tracing_tags_prefix                                            = "avm_"
    virtual_desktop_application_group_default_desktop_display_name = null
    virtual_desktop_application_group_description                  = null
    virtual_desktop_application_group_friendly_name                = null
    virtual_desktop_application_group_tags                         = {}
    virtual_desktop_application_group_timeouts = {
      create = null
      delete = null
      read   = null
      update = null
    }
    virtual_desktop_host_pool_custom_rdp_properties            = "authentication level:i:0"
    virtual_desktop_host_pool_description                      = null
    virtual_desktop_host_pool_friendly_name                    = null
    virtual_desktop_host_pool_maximum_sessions_allowed         = null
    virtual_desktop_host_pool_personal_desktop_assignment_type = null
    virtual_desktop_host_pool_preferred_app_group_type         = null
    virtual_desktop_host_pool_scheduled_agent_updates = {
      enabled                   = true
      timezone                  = null
      use_session_host_timezone = false
      schedule = [
        {
          day_of_week = "Sunday"
          hour_of_day = 0
        },
        {
          day_of_week = "Wednesday"
          hour_of_day = 4
        }
      ]
    }
    virtual_desktop_host_pool_start_vm_on_connect = false
    virtual_desktop_host_pool_tags = {
      environment = "test"
    }
    virtual_desktop_host_pool_timeouts = {
      create = null
      delete = null
      read   = null
      update = null
    }
    virtual_desktop_host_pool_validate_environment = false
    virtual_desktop_scaling_plan_description       = null
    virtual_desktop_scaling_plan_exclusion_tag     = null
    virtual_desktop_scaling_plan_friendly_name     = null
    virtual_desktop_scaling_plan_host_pool         = []
    virtual_desktop_scaling_plan_tags              = {}
    virtual_desktop_scaling_plan_timeouts = {
      create = null
      delete = null
      read   = null
      update = null
    }
    virtual_desktop_workspace_description                   = null
    virtual_desktop_workspace_friendly_name                 = null
    virtual_desktop_workspace_public_network_access_enabled = true
    virtual_desktop_workspace_tags                          = {}
    virtual_desktop_workspace_timeouts = {
      create = null
      delete = null
      read   = null
      update = null
    }
  }
}
