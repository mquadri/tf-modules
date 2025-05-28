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

output "primary_admin_keys" {
  description = "A map of primary admin keys for the Azure AI Search services, keyed by the input search_service map keys."
  value       = { for k, inst in module.avm-res-search-searchservice : k => inst.resource.primary_key }
  sensitive   = true
}

output "secondary_admin_keys" {
  description = "A map of secondary admin keys for the Azure AI Search services, keyed by the input search_service map keys."
  value       = { for k, inst in module.avm-res-search-searchservice : k => inst.resource.secondary_key }
  sensitive   = true
}