output "mgmt_ip_address_public" {
  description = "VM-Series management IP address. If `create_public_ip` was `true`, it is a public IP address, otherwise a private IP address."
  value       = azurerm_public_ip.mgmt.ip_address
}

output "mgmt_ip_address_private" {
  description = "Private IP address of mgmt interface"
  value       = azurerm_network_interface.mgmt.ip_configuration[0].private_ip_address
}

output "principal_id" {
  description = "The oid of Azure Service Principal of the created VM-Series. Usable only if `identity_type` contains SystemAssigned."
  value       = azurerm_virtual_machine.one.identity[0].principal_id
}

output "metrics_instrumentation_key" {
  description = "The Instrumentation Key of the created instance of Azure Application Insights. The instance is unused by default, but is ready to receive custom PAN-OS metrics from the firewalls. To use it, paste this Instrumentation Key into PAN-OS -> Device -> VM-Series -> Azure."
  value       = azurerm_application_insights.this.instrumentation_key
  sensitive   = true
}

output "avset_id" {
  description = "the av set ID"
  value       = azurerm_availability_set.backend.id
}