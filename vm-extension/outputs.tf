output "resource_id" {
  description = "The Azure resource id for the deployed virtual machine extension"
  value       = azurerm_virtual_machine_extension.vm-extension[*]
  sensitive   = true
}
