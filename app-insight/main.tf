# This is required for resource modules
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
#Log Analytics Workspace for diagnostic settings. Required for workspace-based diagnostic settings.
data "azurerm_log_analytics_workspace" "this" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_rg_name
}

locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

# with a data source.
module "appinsight" {
  source                        = "Azure/avm-res-insights-component/azurerm"
  version                       = "0.1.4"
  location                      = var.location
  name                          = var.appinsight_name
  resource_group_name           = data.azurerm_resource_group.this.name
  workspace_id                  = data.azurerm_log_analytics_workspace.this.id
  enable_telemetry              = var.enable_telemetry
  local_authentication_disabled = var.local_authentication_disabled
  internet_ingestion_enabled    = var.internet_ingestion_enabled
  internet_query_enabled        = var.internet_query_enabled
  tags                          = merge(local.mandatory_tags, try(var.tags,{}))
}

resource "azurerm_monitor_private_link_scope" "this" {
  for_each            = var.enable_private_link_scope == true ? { this = var.enable_private_link_scope } : {}
  name                = var.monitor_private_link_scope
  resource_group_name = data.azurerm_resource_group.this.name
  tags                = merge(local.mandatory_tags, try(var.tags,{}))
}

resource "azurerm_monitor_private_link_scoped_service" "this" {
  for_each            = var.enable_private_link_scope == true ? { this = var.enable_private_link_scope } : {}
  linked_resource_id  = module.appinsight.resource_id
  name                = var.monitor_private_link_scoped_service_name
  resource_group_name = data.azurerm_resource_group.this.name
  scope_name          = azurerm_monitor_private_link_scope.this[each.key].name
}

module "diagnostics-setting-setup" {
  source                         = "../diagnostic-setting"
  for_each                       = var.enable_diagnostic_setting == true ? { this = var.enable_diagnostic_setting } : {}
  resource_id                    = module.appinsight.resource_id
  diagnostics_settings_name      = var.diagnostics_settings_name
  log_categories                 = var.log_categories
  excluded_log_categories        = var.excluded_log_categories
  metric_categories              = var.metric_categories
  logs_destinations_ids          = [data.azurerm_log_analytics_workspace.this.id]
  log_analytics_destination_type = var.log_analytics_destination_type
  depends_on                     = [module.appinsight]
}

