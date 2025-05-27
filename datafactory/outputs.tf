output "datafactory_name" {
  value = azurerm_data_factory.adf.name
}

output "datafactory_id" {
  value = azurerm_data_factory.adf.id
}

output "datafactory_location" {
  value = azurerm_data_factory.adf.location
}

output "datafactory_resource_group" {
  value = azurerm_data_factory.adf.resource_group_name
}

output "datafactory_private_endpoint_connection" {
  value = azurerm_private_endpoint.datafactory.private_service_connection
}

output "datafactory_portal_private_endpoint_connection" {
  value = length(azurerm_private_endpoint.adf-portal) > 0 ? azurerm_private_endpoint.adf-portal[0].private_service_connection : null
}

output "datafactory_private_dns_a_record" {
  value = azurerm_private_dns_a_record.adf.name
}

output "azurerm_data_factory_integration_runtime_self_hosted" {
  value = length(azurerm_data_factory_integration_runtime_self_hosted.shir) > 0 ? azurerm_data_factory_integration_runtime_self_hosted.shir[*].name : null
}

output "azure_shir_windows_vm_name" {
  value = azurerm_windows_virtual_machine.windows[*].name
}

output "azure_shir_windows_vm_id" {
  value = azurerm_windows_virtual_machine.windows[*].id
}