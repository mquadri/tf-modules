output "resource_id" {
  description = "Id of Log Analytics resource in Azure."
  value       = module.avm-res-operationalinsights-workspace.resource_id
}

output "resource" {
  description = "Resource list of Log analytics workspace"
  value       = module.avm-res-operationalinsights-workspace.resource
  sensitive   = true
}

output "private_endpoints" {
  description = "private_endpoints"
  value       = module.avm-res-operationalinsights-workspace.private_endpoints
}

output "name" {
  description = "Name of Log Analytics resource in Azure."
  value       = "log-${local.naming}-${var.additionalcontext}"
}