output "id" {
  description = "A map of subnet names to their IDs."
  value       = { for s, subnet in azurerm_subnet_network_security_group_association.this : s => subnet.id }

}