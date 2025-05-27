output "id" {
  description = "The ID of the Synapse Workspace."
  value       = azurerm_synapse_workspace.synapse0000.id
}

output "principal_id" {
  description = "The Principal ID for the Service Principal associated with the Managed Service Identity of this App Service."
  value       = azurerm_synapse_workspace.synapse0000.identity[*].principal_id
}