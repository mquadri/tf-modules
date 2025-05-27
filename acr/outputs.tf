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