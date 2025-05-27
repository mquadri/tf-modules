output "content_safety_name" {
  value = module.content_safety.name
}

output "content_safety_private_endpoints" {
  value = module.content_safety.private_endpoints
}

output "content_safety_resource" {
  value     = module.content_safety.resource
  sensitive = true
}

output "content_safety_resource_id" {
  value = module.content_safety.resource_id
}