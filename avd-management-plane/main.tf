locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "avm-ptn-avd-lza-managementplane" {
  source  = "Azure/avm-ptn-avd-lza-managementplane/azurerm"
  version = "0.1.5"

  for_each = var.management_plane

  location                                                       = each.value.location
  log_analytics_workspace_name                                   = each.value.log_analytics_workspace_name
  resource_group_name                                            = each.value.resource_group_name
  virtual_desktop_application_group_name                         = each.value.virtual_desktop_application_group_name
  virtual_desktop_application_group_type                         = each.value.virtual_desktop_application_group_type
  virtual_desktop_host_pool_load_balancer_type                   = each.value.virtual_desktop_host_pool_load_balancer_type
  virtual_desktop_host_pool_name                                 = each.value.virtual_desktop_host_pool_name
  virtual_desktop_host_pool_type                                 = each.value.virtual_desktop_host_pool_type
  virtual_desktop_scaling_plan_name                              = each.value.virtual_desktop_scaling_plan_name
  virtual_desktop_scaling_plan_time_zone                         = each.value.virtual_desktop_scaling_plan_time_zone
  virtual_desktop_workspace_name                                 = each.value.virtual_desktop_workspace_name
  enable_telemetry                                               = each.value.enable_telemetry
  managed_identities                                             = each.value.managed_identities
  public_network_access_enabled                                  = each.value.public_network_access_enabled
  registration_expiration_period                                 = each.value.registration_expiration_period
  role_assignments                                               = each.value.role_assignments
  schedules                                                      = each.value.schedules
  subresource_names                                              = each.value.subresource_names
  time_zone                                                      = each.value.time_zone
  tracing_tags_enabled                                           = each.value.tracing_tags_enabled
  tracing_tags_prefix                                            = each.value.tracing_tags_prefix
  virtual_desktop_application_group_default_desktop_display_name = each.value.virtual_desktop_application_group_default_desktop_display_name
  virtual_desktop_application_group_description                  = each.value.virtual_desktop_application_group_description
  virtual_desktop_application_group_friendly_name                = each.value.virtual_desktop_application_group_friendly_name
  virtual_desktop_application_group_tags                         = each.value.virtual_desktop_application_group_tags
  virtual_desktop_application_group_timeouts                     = each.value.virtual_desktop_application_group_timeouts
  virtual_desktop_host_pool_custom_rdp_properties                = each.value.virtual_desktop_host_pool_custom_rdp_properties
  virtual_desktop_host_pool_description                          = each.value.virtual_desktop_host_pool_description
  virtual_desktop_host_pool_friendly_name                        = each.value.virtual_desktop_host_pool_friendly_name
  virtual_desktop_host_pool_maximum_sessions_allowed             = each.value.virtual_desktop_host_pool_maximum_sessions_allowed
  virtual_desktop_host_pool_personal_desktop_assignment_type     = each.value.virtual_desktop_host_pool_personal_desktop_assignment_type
  virtual_desktop_host_pool_preferred_app_group_type             = each.value.virtual_desktop_host_pool_preferred_app_group_type
  virtual_desktop_host_pool_scheduled_agent_updates              = each.value.virtual_desktop_host_pool_scheduled_agent_updates
  virtual_desktop_host_pool_start_vm_on_connect                  = each.value.virtual_desktop_host_pool_start_vm_on_connect
  virtual_desktop_host_pool_tags                                 = merge(local.mandatory_tags, try(each.value.virtual_desktop_host_pool_tags,{}))
  virtual_desktop_host_pool_timeouts                             = each.value.virtual_desktop_host_pool_timeouts
  virtual_desktop_host_pool_validate_environment                 = each.value.virtual_desktop_host_pool_validate_environment
  virtual_desktop_scaling_plan_description                       = each.value.virtual_desktop_scaling_plan_description
  virtual_desktop_scaling_plan_exclusion_tag                     = each.value.virtual_desktop_scaling_plan_exclusion_tag
  virtual_desktop_scaling_plan_friendly_name                     = each.value.virtual_desktop_scaling_plan_friendly_name
  virtual_desktop_scaling_plan_host_pool                         = each.value.virtual_desktop_scaling_plan_host_pool
  virtual_desktop_scaling_plan_tags                              = merge(local.mandatory_tags, try(each.value.virtual_desktop_scaling_plan_tags,{}))
  virtual_desktop_scaling_plan_timeouts                          = each.value.virtual_desktop_scaling_plan_timeouts
  virtual_desktop_workspace_description                          = each.value.virtual_desktop_workspace_description
  virtual_desktop_workspace_friendly_name                        = each.value.virtual_desktop_workspace_friendly_name
  virtual_desktop_workspace_public_network_access_enabled        = each.value.virtual_desktop_workspace_public_network_access_enabled
  virtual_desktop_workspace_tags                                 = merge(local.mandatory_tags, try(each.value.virtual_desktop_workspace_tags,{}))
  virtual_desktop_workspace_timeouts                             = each.value.virtual_desktop_workspace_timeouts
}
