data "azurerm_virtual_desktop_application_group" "existing_app_groups" {
  for_each = {
    for key, value in local.workspace_app_association : key => value
    if try(value.appgroup_name, null) != null
  }
  name                = each.value.appgroup_name
  resource_group_name = each.value.appgroup_resource_group_name
  depends_on          = [module.avm-res-desktopvirtualization-workspace]
}

data "azurerm_virtual_desktop_workspace" "existing_workspace" {
  for_each = {
    for key, value in local.workspace_app_association : key => value
    if try(value.appgroup_name, null) != null
  }
  name                = each.value.virtual_desktop_workspace_name
  resource_group_name = each.value.virtual_desktop_workspace_resource_group_name
  depends_on          = [module.avm-res-desktopvirtualization-workspace]
}

module "avm-res-desktopvirtualization-workspace" {
  source  = "Azure/avm-res-desktopvirtualization-workspace/azurerm"
  version = "0.1.5"
  # insert the 4 required variables here
  for_each                                      = var.workspaces
  virtual_desktop_workspace_name                = each.value.virtual_desktop_workspace_name
  virtual_desktop_workspace_resource_group_name = each.value.virtual_desktop_workspace_resource_group_name
  resource_group_name                           = each.value.resource_group_name
  virtual_desktop_workspace_location            = each.value.virtual_desktop_workspace_location
  #optional
  diagnostic_settings                                     = try(each.value.diagnostic_settings, null) != null ? each.value.diagnostic_settings : {}
  enable_telemetry                                        = try(each.value.enable_telemetry, true) != null ? each.value.enable_telemetry : true
  lock                                                    = try(each.value.lock, null)
  private_endpoints                                       = try(each.value.private_endpoints, {}) != null ? each.value.private_endpoints : {}
  role_assignments                                        = try(each.value.role_assignments, {}) != null ? each.value.role_assignments : {}
  subresource_names                                       = try(each.value.subresource_names, []) != null ? each.value.subresource_names : []
  tags                                                    = merge(local.mandatory_tags, try(each.value.tags, {}))
  tracing_tags_enabled                                    = try(each.value.tracing_tags_enabled, false) != null ? each.value.tracing_tags_enabled : false
  tracing_tags_prefix                                     = try(each.value.tracing_tags_prefix, "avm_") != null ? each.value.tracing_tags_prefix : "avm_"
  virtual_desktop_workspace_description                   = try(each.value.virtual_desktop_workspace_description, null)
  virtual_desktop_workspace_friendly_name                 = try(each.value.virtual_desktop_workspace_friendly_name, null)
  virtual_desktop_workspace_public_network_access_enabled = try(each.value.virtual_desktop_workspace_public_network_access_enabled, null)
  virtual_desktop_workspace_tags                          = merge(local.mandatory_tags, try(each.value.virtual_desktop_workspace_tags, {}))
  virtual_desktop_workspace_timeouts                      = try(each.value.virtual_desktop_workspace_timeouts, null)
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "workappgr" {
  for_each = {
    for key, value in local.workspace_app_association : key => value
    if try(value.appgroup_name, null) != null
  }
  application_group_id = data.azurerm_virtual_desktop_application_group.existing_app_groups[each.key].id
  workspace_id         = data.azurerm_virtual_desktop_workspace.existing_workspace[each.key].id
  depends_on           = [module.avm-res-desktopvirtualization-workspace]
}
