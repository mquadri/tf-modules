output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = module.ai-search.private_endpoints
}

output "resource" {
  description = "This is the full output for the resource."
  value       = module.ai-search.resource
  sensitive   = true
}

output "resource_id" {
  description = "The ID of the machine learning workspace."
  value       = module.ai-search.resource_id
}