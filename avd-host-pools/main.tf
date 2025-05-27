locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "avm-res-desktopvirtualization-hostpool" {
  source  = "Azure/avm-res-desktopvirtualization-hostpool/azurerm"
  version = "0.2.1"

  for_each = var.avd_host_pools

  virtual_desktop_host_pool_load_balancer_type               = each.value.virtual_desktop_host_pool_load_balancer_type
  virtual_desktop_host_pool_location                         = each.value.virtual_desktop_host_pool_location
  virtual_desktop_host_pool_name                             = each.value.virtual_desktop_host_pool_name
  virtual_desktop_host_pool_resource_group_name              = each.value.virtual_desktop_host_pool_resource_group_name
  virtual_desktop_host_pool_type                             = each.value.virtual_desktop_host_pool_type
  virtual_desktop_host_pool_custom_rdp_properties            = each.value.virtual_desktop_host_pool_custom_rdp_properties
  virtual_desktop_host_pool_description                      = each.value.virtual_desktop_host_pool_description
  virtual_desktop_host_pool_friendly_name                    = each.value.virtual_desktop_host_pool_friendly_name
  virtual_desktop_host_pool_maximum_sessions_allowed         = each.value.virtual_desktop_host_pool_maximum_sessions_allowed
  virtual_desktop_host_pool_personal_desktop_assignment_type = each.value.virtual_desktop_host_pool_personal_desktop_assignment_type
  virtual_desktop_host_pool_preferred_app_group_type         = each.value.virtual_desktop_host_pool_preferred_app_group_type
  virtual_desktop_host_pool_scheduled_agent_updates          = each.value.virtual_desktop_host_pool_scheduled_agent_updates
  virtual_desktop_host_pool_start_vm_on_connect              = each.value.virtual_desktop_host_pool_start_vm_on_connect
  virtual_desktop_host_pool_tags                             = each.value.virtual_desktop_host_pool_tags
  virtual_desktop_host_pool_timeouts                         = each.value.virtual_desktop_host_pool_timeouts
  virtual_desktop_host_pool_validate_environment             = each.value.virtual_desktop_host_pool_validate_environment
  virtual_desktop_host_pool_vm_template                      = each.value.virtual_desktop_host_pool_vm_template
  resource_group_name                                        = each.value.resource_group_name
  diagnostic_settings                                        = each.value.diagnostic_settings
  enable_telemetry                                           = each.value.enable_telemetry
  lock                                                       = each.value.lock
  private_endpoints                                          = each.value.private_endpoints
  registration_expiration_period                             = each.value.registration_expiration_period
  role_assignments                                           = each.value.role_assignments
  tracing_tags_enabled                                       = each.value.tracing_tags_enabled
  tracing_tags_prefix                                        = each.value.tracing_tags_prefix
  tags                                                       = merge(local.mandatory_tags, try(each.value.tags,{}))
}
