output "resource" {
  value       = module.application_insight.resource
  description = "The resource details of app insight."
  sensitive   = true
}
output "resource_id" {
  value       = module.application_insight.resource_id
  description = "The resource id of app insight."
}