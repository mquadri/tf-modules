output "data_collection_endpoint_name" {
  value       = [for x in azurerm_monitor_data_collection_endpoint.this : x.name]
  description = "The name of the monitor data collection endpoint"
}

output "azuresql_server_name" {
  value       = [for x in azurerm_monitor_data_collection_endpoint.this : x.id]
  description = "The id of the monitor data collection endpoint"
}
