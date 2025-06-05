locals {
  #naming = "${var.appname}${var.env}"
  tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    costDivision        = var.costDivision
    costRegion          = var.location
    costVP              = var.costVP
    environment         = var.environment
    app_id              = var.app_id
    msftmigration       = var.msftmigration
    costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
    appFunction         = var.appFunction
    monthlyBudget       = var.monthlyBudget
    costbaseline        = var.costbaseline #(year resource created)
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
  }
}
module "application_insight" {
  source                                   = "../"
  resource_group_name                      = var.resource_group_name
  appinsight_name                          = var.appinsight_name
  log_analytics_workspace_name             = var.log_analytics_workspace_name
  enable_diagnostic_setting                = var.enable_diagnostic_setting
  diagnostics_settings_name                = var.diagnostics_settings_name
  log_categories                           = var.log_categories
  excluded_log_categories                  = var.excluded_log_categories
  metric_categories                        = var.metric_categories
  enable_telemetry                         = var.enable_telemetry
  monitor_private_link_scope               = var.monitor_private_link_scope
  monitor_private_link_scoped_service_name = var.monitor_private_link_scoped_service_name
  tags                                     = local.tags
  internet_query_enabled                   = var.internet_query_enabled
  local_authentication_disabled            = var.local_authentication_disabled
  internet_ingestion_enabled               = var.internet_ingestion_enabled
  log_analytics_destination_type           = var.log_analytics_destination_type
  log_rg_name                              = var.log_rg_name
  enable_private_link_scope                = var.enable_private_link_scope
}
