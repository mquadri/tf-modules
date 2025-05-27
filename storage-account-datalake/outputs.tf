output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_storage_account.storageaccount.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_storage_account.storageaccount.id
}

output "primary_connection_string" {
  description = "The primary connection string of the storage account created."
  value       = azurerm_storage_account.storageaccount.primary_connection_string
}

output "secondary_connection_string" {
  description = "The secondary connection string of the storage account created."
  value       = azurerm_storage_account.storageaccount.secondary_connection_string
}

output "primary_access_key" {
  description = "The primary access key of the storage account created."
  value       = azurerm_storage_account.storageaccount.primary_access_key
}

output "secondary_access_key" {
  description = "The secondary access key of the storage account created."
  value       = azurerm_storage_account.storageaccount.secondary_access_key
}

output "private_ip_address" {
  description = "the private ip address of the private endpoint"
  value       = azurerm_private_endpoint.registry_pe.private_service_connection[0].private_ip_address
}


output "storage_data_lake_gen2_filesystem_id" {
  description = "The id of the data lake gen2 filesystem created."
  value       = azurerm_storage_data_lake_gen2_filesystem.dlfs.id
}
