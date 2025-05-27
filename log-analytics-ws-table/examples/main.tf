module "log_analytics_ws_table" {
  source                                                = "../"  
  log_analytics_workspace_table_name                    = var.log_analytics_workspace_table_name
  log_analytics_workspace_id                            = var.log_analytics_workspace_id
  log_analytics_workspace_table_retention_in_days       = var.log_analytics_workspace_table_retention_in_days
  log_analytics_workspace_table_total_retention_in_days = var.log_analytics_workspace_table_total_retention_in_days
}
 