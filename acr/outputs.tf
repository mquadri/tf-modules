# ###############################
# # Azure ACR outputs
# ###############################
output "private_endpoints" {
  description = "Azure Container registry Private endpoints"
  value       = module.avm-res-containerregistry-registry.private_endpoints
}

output "acr_resource_id" {
  description = "Azure Container registry Resource ID"
  value       = module.avm-res-containerregistry-registry.resource_id
}

output "acr_name" {
  description = "Azure Container registry Name"
  value       = module.avm-res-containerregistry-registry.name
}

output "acr_login_server" {
  description = "The URL that can be used to log into the container registry"
  value       = module.avm-res-containerregistry-registry.login_server
}

output "acr_admin_username" {
  description = "The Admin Username for the Container Registry if admin_enabled is true"
  value       = var.admin_enabled ? module.avm-res-containerregistry-registry.admin_username : null
}

output "acr_admin_password" {
  description = "The Admin Password for the Container Registry if admin_enabled is true"
  value       = var.admin_enabled ? module.avm-res-containerregistry-registry.admin_password : null
  sensitive   = true
}

output "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  value       = var.resource_group_name
}

output "network_rule_set" {
  description = "Network rule set for the container registry if configured"
  value       = local.network_rule_set
}

output "tags_applied" {
  description = "The tags applied to the Container Registry"
  value       = local.tags
}