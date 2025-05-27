#PaaS SQL Outputs
output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = module.paas-sql-server-db.private_endpoints
}

output "resource" {
  description = "This is the full output for the resource."
  value       = module.paas-sql-server-db.resource
  sensitive   = true
}

output "resource_databases" {
  description = "A map of databases. The map key is the supplied input to var.databases. The map value is the entire azurerm_mssql_database resource."
  value       = module.paas-sql-server-db.resource_databases
  sensitive   = true
}

output "resource_elasticpools" {
  description = "A map of elastic pools. The map key is the supplied input to var.elastic_pools. The map value is the entire azurerm_mssql_elasticpool resource."
  value       = module.paas-sql-server-db.resource_elasticpools
}

output "resource_id" {
  description = "This is the id of the resource."
  value       = module.paas-sql-server-db.resource_id
}

output "resource_name" {
  description = "This is the name of the resource."
  value       = module.paas-sql-server-db.resource_name
}


#SQL MI Outputs
output "identity" {
  description = "Managed identities for the SQL MI instance.  This is not available from the `resource` output because AzureRM doesn't yet support adding both User and System Assigned identities."
  value       = module.application-sql-mi.identity
}

output "private_endpoints" {
  description = <<DESCRIPTION
  A map of the private endpoints created.
  DESCRIPTION
  value       = module.application-sql-mi.private_endpoints
}

output "resource" {
  description = "This is the full output for the resource."
  value       = module.application-sql-mi.resource
  sensitive   = true
}

output "resource_id" {
  description = "This is the resource ID of the resource."
  value       = module.application-sql-mi.resource_id
}
