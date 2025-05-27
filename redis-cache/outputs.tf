output "redis_name" {
  description = "The name of the redis resource."
  value       = { for key, cache in module.redis_cache : key => cache.name }
}

output "redis_private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = { for key, cache in module.redis_cache : key => cache.private_endpoints }
}

output "redis_resource_id" {
  description = "The resource ID of the Redis cache resource."
  value       = { for key, cache in module.redis_cache : key => cache.resource_id }
}

output "redis_system_assigned_mi_principal_id" {
  description = "The resource ID for the system-managed identity principal ID."
  value       = { for key, cache in module.redis_cache : key => cache.system_assigned_mi_principal_id }
}

output "redis_all_info" {
  description = "A map of all Redis cache information, including name, private endpoints, resource ID, and system-assigned MI principal ID."
  value = {
    for key, cache in module.redis_cache : key => {
      name                           = cache.name
      private_endpoints              = cache.private_endpoints
      resource_id                    = cache.resource_id
      system_assigned_mi_principal_id = cache.system_assigned_mi_principal_id
    }
  }
}
