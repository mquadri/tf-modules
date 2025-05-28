output "ai_services_id" {
  description = "The ID of the AI Services account."
  value       = azapi_resource.AIServicesResource.id
}

output "ai_hub_id" {
  description = "The ID of the AI Hub workspace."
  value       = azapi_resource.hub.id
}

output "ai_project_id" {
  description = "The ID of the AI Project workspace."
  value       = azapi_resource.project.id
}

output "ai_services_endpoint" {
  description = "The endpoint of the AI Services account."
  value       = jsondecode(azapi_resource.AIServicesResource.output).properties.endpoint
}

# Full resource objects (optional, can be useful for debugging or more complex scenarios)
output "ais_resource_object" {
  description = "Full resource object of the AI Services instance."
  value       = azapi_resource.AIServicesResource
  sensitive   = true 
}

output "hub_resource_object" {
  description = "Full resource object of the Azure AI Hub instance."
  value       = azapi_resource.hub
  sensitive   = true
}

output "project_resource_object" {
  description = "Full resource object of the Azure AI Project instance."
  value       = azapi_resource.project
  sensitive   = true
}

output "aisc_resource_object" {
  description = "Full resource object of the AzAPI AI Services Connection instance."
  value       = azapi_resource.AIServicesConnection
  sensitive   = true
}
