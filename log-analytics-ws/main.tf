
module "avm-res-operationalinsights-workspace" {
  source                                                = "Azure/avm-res-operationalinsights-workspace/azurerm"
  version                                               = "0.4.2"
  location                                              = var.location
  name                                                  = "log-${local.naming}-${var.additionalcontext}"
  resource_group_name                                   = var.resource_group_name
  log_analytics_workspace_local_authentication_disabled = var.log_analytics_workspace_local_authentication_disabled
  log_analytics_workspace_sku                           = var.log_analytics_workspace_sku
  log_analytics_workspace_retention_in_days             = var.log_analytics_workspace_retention_in_days
  log_analytics_workspace_internet_ingestion_enabled    = var.log_analytics_workspace_internet_ingestion_enabled
  log_analytics_workspace_internet_query_enabled        = var.log_analytics_workspace_internet_query_enabled
  tags                                                  = local.tags
  log_analytics_workspace_identity = {
    type         = local.identity_type
    identity_ids = var.additional_identities != null ? var.additional_identities : []
  }
  #AMPLS
  monitor_private_link_scope               = var.monitor_private_link_scope
  monitor_private_link_scoped_service_name = var.monitor_private_link_scoped_service_name
  private_endpoints                        = var.private_endpoints
}