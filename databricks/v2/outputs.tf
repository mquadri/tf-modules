output "workspace_id" {
  value       = azurerm_databricks_workspace.db-ws.workspace_id
  description = "ID of the Databricks workspace"
}

output "workspace_url" {
  value       = "https://${azurerm_databricks_workspace.db-ws.workspace_url}"
  description = "value of the Databricks workspace URL"
}

output "workspace_resource_id" {
  value       = azurerm_databricks_workspace.db-ws.id
  description = "ID of the Databricks workspace resource"
}

output "resource_group_name" {
  value       = data.azurerm_resource_group.db-rg.name
  description = "Name of the resource group"
}

output "resource_group_id" {
  value       = data.azurerm_resource_group.db-rg.id
  description = "ID of the resource group"
}

output "nsg_id" {
  value       = azurerm_network_security_group.databricks.id
  description = "ID of the new NSG"
}

output "nsg_name" {
  value       = azurerm_network_security_group.databricks.name
  description = "Name of the new NSG"
}

output "route_table_id" {
  value       = azurerm_route_table.databricks.id
  description = "ID of the new route table"
}