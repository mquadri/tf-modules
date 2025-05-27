output "data_explorer_id" {
  value       = azurerm_kusto_cluster.dec-cluster.id
  description = "ID of the Data Explorer cluster"
}

output "data_explorer_uri" {
  value       = azurerm_kusto_cluster.dec-cluster.uri
  description = "URI of the Data Explorer cluster"
}

output "data_explorer_ingestion_uri" {
  value       = azurerm_kusto_cluster.dec-cluster.data_ingestion_uri
  description = "URI of the Data Explorer cluster ingestion"
}

output "resource_group_name" {
  value       = data.azurerm_resource_group.dec-rg.name
  description = "Name of the resource group"
}

output "resource_group_id" {
  value       = data.azurerm_resource_group.dec-rg.id
  description = "ID of the resource group"
}

output "nsg_id" {
  value       = azurerm_network_security_group.dec.id
  description = "ID of the new NSG"
}

output "nsg_name" {
  value       = azurerm_network_security_group.dec.name
  description = "Name of the new NSG"
}

output "route_table_id" {
  value       = azurerm_route_table.dec.id
  description = "ID of the new route table"
}