# # ###############################
# # # Azure user managed identity outputs
# # ###############################
output "client_id" {
  description = "The client id of the user assigned identity"
  value       = module.user_managed_identity_setup.client_id
}

output "principal_id" {
  description = "The principal id of the user assigned identity"
  value       = module.user_managed_identity_setup.principal_id
}

output "resource" {
  description = "The resource details of the user assigned identity"
  value       = module.user_managed_identity_setup.resource
}

output "resource_id" {
  description = "The resource Id of the user assigned identity"
  value       = module.user_managed_identity_setup.resource_id
}

output "resource_name" {
  description = "The name of the User Assigned Identity that was created."
  value       = module.user_managed_identity_setup.resource_name
}

output "tenant_id" {
  description = "The ID of the Tenant which the Identity belongs to."
  value       = module.user_managed_identity_setup.tenant_id
}