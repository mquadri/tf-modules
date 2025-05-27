output "resource_group_name" {
  description = "The name for the resource group where the resource was created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.resource_group_name
}

output "name" {
  description = "The name of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.id
}

output "endpoint" {
  description = "The endpoint of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.endpoint
}

output "primary_key" {
  description = "The primary key of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.primary_key
}

output "secondary_key" {
  description = "The secondary key of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.secondary_key
}

output "connection_string" {
  description = "The connection string of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.connection_strings[0]
  sensitive   = true
}
