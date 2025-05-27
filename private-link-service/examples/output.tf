output "pls_ids" {
  value       = [for p in module.private_link_services_example.azurerm_private_link_service_this : p.id]
  description = "Private Link Service Id"
}

output "pls_dns_names" {
  value       = [for p in module.private_link_services_example.azurerm_private_link_service_this : p.alias]
  description = "A globally unique DNS Name for your Private Link Service. You can use this alias to request a connection to your Private Link Service."
}