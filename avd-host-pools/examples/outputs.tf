output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = module.avd_host_pool.private_endpoints
}

output "registrationinfo_token" {
  description = "The token for the host pool registration."
  sensitive   = true
  value       = module.avd_host_pool.registrationinfo_token
}

output "resource" {
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
  value       = module.avd_host_pool.resource
}

output "resource_id" {
  description = "The ID of the Virtual Desktop Host Pool."
  value       = module.avd_host_pool.resource_id
}