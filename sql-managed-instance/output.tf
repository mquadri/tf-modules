output "identity" {
  description = "Managed identities for the SQL MI instance.  This is not available from the `resource` output because AzureRM doesn't yet support adding both User and System Assigned identities."
  value       = module.avm-res-sql-managedinstance.identity
}

output "private_endpoints" {
  description = <<DESCRIPTION
  A map of the private endpoints created.
  DESCRIPTION
  value       = module.avm-res-sql-managedinstance.private_endpoints
}

output "resource" {
  description = "This is the full output for the resource."
  value       = module.avm-res-sql-managedinstance.resource
  sensitive   = true
}

output "resource_id" {
  description = "This is the resource ID of the resource."
  value       = module.avm-res-sql-managedinstance.resource_id
}
