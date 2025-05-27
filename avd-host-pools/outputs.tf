output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = { for p, pe in module.avm-res-desktopvirtualization-hostpool : p => pe.private_endpoints }
}

output "registrationinfo_token" {
  description = "The token for the host pool registration."
  sensitive   = true
  value       = { for t, token in module.avm-res-desktopvirtualization-hostpool : t => token.registrationinfo_token }
}

output "resource" {
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
  value       = { for r, resource in module.avm-res-desktopvirtualization-hostpool : r => resource.resource_id }
}

output "resource_id" {
  description = "The ID of the Virtual Desktop Host Pool."
  value       = { for r, resource in module.avm-res-desktopvirtualization-hostpool : r => resource.resource_id.id }
} 