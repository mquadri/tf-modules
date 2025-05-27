# #######################################
# # Azure Log analytics workspace outputs
# #######################################

output "resource_id" {
  description = "Id of Log Analytics resource in Azure."
  value       = module.law.resource_id
}

output "resource" {
  description = "Resource list of Log analytics workspace"
  value       = module.law.resource
  sensitive   = true
}

output "private_endpoints" {
  description = "private_endpoints"
  value       = module.law.private_endpoints
}