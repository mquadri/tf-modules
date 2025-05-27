output "id" {
  description = "The ID of the Storage Container."
  value       = azurerm_storage_container.newcontainer.id
}

output "has_immutability_policy" {
  description = "Is there an Immutability Policy configured on this Storage Container?"
  value       = azurerm_storage_container.newcontainer.has_immutability_policy
}

output "has_legal_hold" {
  description = "Is there a Legal Hold configured on this Storage Container?"
  value       = azurerm_storage_container.newcontainer.has_legal_hold
}

output "resource_manager_id" {
  description = "The Resource Manager ID of this Storage Container."
  value       = azurerm_storage_container.newcontainer.resource_manager_id
}

output "name" {
  description = "The name of the created resource group."
  value       = azurerm_storage_container.newcontainer.name
}