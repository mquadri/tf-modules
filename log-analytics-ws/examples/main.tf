
#---------------------------------------------------------
# Resource Group Creation or selection - Default is "false"
#----------------------------------------------------------
resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = "EastUS"
}

#---------------------------------------------------------
# Data Sources
#----------------------------------------------------------
# data "azurerm_resource_group" "rgrp" {
#   count = var.create_resource_group ? 0 : 1
#   name  = var.resource_group_name
# }


module "law" {
  source                                                = "../"
  depends_on                                            = [azurerm_resource_group.rg]
  resource_group_name                                   = var.resource_group_name
  location                                              = var.location
  monitor_private_link_scoped_service_name              = var.monitor_private_link_scoped_service_name
  log_analytics_workspace_local_authentication_disabled = var.log_analytics_workspace_local_authentication_disabled
  log_analytics_workspace_sku                           = var.log_analytics_workspace_sku
  log_analytics_workspace_retention_in_days             = var.log_analytics_workspace_retention_in_days
  log_analytics_workspace_internet_ingestion_enabled    = var.log_analytics_workspace_internet_ingestion_enabled
  log_analytics_workspace_internet_query_enabled        = var.log_analytics_workspace_internet_query_enabled
  appname                                               = var.appname
  env                                                   = var.env
  additionalcontext                                     = var.additionalcontext
  appid                                                 = var.appid
  resourcetype                                          = var.resourcetype
  costappownermanager                                   = var.costappownermanager
  costappownertech                                      = var.costappownertech
  costbudgetowner                                       = var.costbudgetowner
  costcostcenter                                        = var.costcostcenter
  costvp                                                = var.costvp
  costdivision                                          = var.costdivision
  costallocation                                        = var.costallocation
  appfunction                                           = var.appfunction
  monthlybudget                                         = var.monthlybudget
  costbaseline                                          = var.costbaseline
  monitor_private_link_scope = {
    pe1 = {
      name        = var.monitor_private_link_scope_name
      resource_id = azurerm_resource_group.rg[0].id
    }
  }
  private_endpoints = {
    pe1 = {
      private_dns_zone_resource_ids   = [for _, dns in data.azurerm_private_dns_zone.ampls : dns.id]
      name                            = "pe-${local.naming}"
      private_service_connection_name = "psc-${local.naming}-${var.additionalcontext}"
      tags                            = local.tags
      private_dns_zone_group_name     = "pe-${local.naming}-${var.additionalcontext}"
      location                        = var.location
      resource_group_name             = var.resource_group_name
      subnet_resource_id              = "/subscriptions/${var.subscription_id}/resourceGroups/${var.virtual_network_rg}/providers/Microsoft.Network/virtualNetworks/${var.virtual_network_name}/subnets/${var.pe_subnet_name}"
    }
  }
}

module "diagnostics_setting_setup" {
  source                         = "../../diagnostic-setting"
  for_each                       = var.enable_diagnostic_setting == true ? { this = var.enable_diagnostic_setting } : {}
  resource_id                    = data.azurerm_storage_account.analytics_storage_account.id
  diagnostics_settings_name      = var.diagnostics_settings_name != null ? var.diagnostics_settings_name : "rv${local.naming}${var.additionalcontext}"
  log_categories                 = var.log_categories
  log_category_groups            = var.log_category_groups
  excluded_log_categories        = var.excluded_log_categories
  excluded_log_category_groups   = var.excluded_log_category_groups
  metric_categories              = var.metric_categories
  logs_destinations_ids          = [data.azurerm_storage_account.analytics_storage_account.id, module.law.resource_id]
  log_analytics_destination_type = var.log_analytics_destination_type
  depends_on                     = [module.law, azurerm_resource_group.rg]
}