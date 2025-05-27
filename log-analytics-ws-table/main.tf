resource "azurerm_log_analytics_workspace_table" "table_name" {
  workspace_id            = var.log_analytics_workspace_id
  name                    = var.log_analytics_workspace_table_name
  retention_in_days       = var.log_analytics_workspace_table_retention_in_days
  total_retention_in_days = var.log_analytics_workspace_table_total_retention_in_days
}