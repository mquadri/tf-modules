output "resource" {
  value       = module.appinsight.resource
  description = "The resource details of app insight."
  sensitive   = true
}
output "resource_id" {
  value       = module.appinsight.resource_id
  description = "The resource id of app insight."
}
output "connection_string" {
  value = module.appinsight.connection_string
}