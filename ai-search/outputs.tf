output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = { for p, pe in module.avm-res-search-searchservice : p => pe.private_endpoints }
}

output "resource" {
  description = "This is the full output for the resource."
  value       = { for r, resource in module.avm-res-search-searchservice : r => resource.resource }
  sensitive   = true
}

output "resource_id" {
  description = "The ID of the machine learning workspace."
  value       = { for r, r_id in module.avm-res-search-searchservice : r => r_id.resource_id }
}