output "log_analytics_workspace_table_id" {
  description = "The ID of the Log Analytics Workspace Table."
  value       = azurerm_log_analytics_workspace_table.table_name.id
}