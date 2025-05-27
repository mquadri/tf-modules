output "client_id" {
  description = "User managed identity Client ID"
  value       = [for x in module.avm-res-managedidentity-userassignedidentity : x.client_id]
}

output "principal_id" {
  description = "User managed identity principal ID"
  value       = [for x in module.avm-res-managedidentity-userassignedidentity : x.principal_id]
}

output "resource" {
  description = "User managed identity resource output"
  value       = [for x in module.avm-res-managedidentity-userassignedidentity : x.resource]
}

output "resource_id" {
  description = "User managed identity resource ID"
  value       = [for x in module.avm-res-managedidentity-userassignedidentity : x.resource_id]
}

output "resource_name" {
  description = "The name of the User Assigned Identity that was created."
  value       = [for x in module.avm-res-managedidentity-userassignedidentity : x.resource_name]
}

output "tenant_id" {
  description = "The ID of the Tenant which the Identity belongs to."
  value       = [for x in module.avm-res-managedidentity-userassignedidentity : x.tenant_id]
}