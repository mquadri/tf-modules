output "name" {
  description = "The name of the key vault created."
  value       = var.existing_name != null ? var.existing_name : "kv${local.naming}${var.additionalcontext}"
}

output "id" {
  description = "The id of the key vault created."
  value       = module.avm-res-keyvault-vault.resource_id
}

output "url" {
  description = "The URI of the vault for performing operations on keys and secrets"
  value       = module.avm-res-keyvault-vault.uri
}

output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = module.avm-res-keyvault-vault.private_endpoints
}
