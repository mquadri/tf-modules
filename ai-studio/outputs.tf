output "workspace_name" {
  value = azapi_resource.project.id
}

output "endpoint" {
  value = jsondecode(azapi_resource.AIServicesResource.output).properties.endpoint
}

output "ais_resource" {
  value       = azapi_resource.AIServicesResource
  description = "Resource of the instance of AIServices."
}

output "hub_resource" {
  value       = azapi_resource.hub
  description = "Resource of the instance of Azure AI Hub."
}

output "project_resource" {
  value       = azapi_resource.project
  description = "Resource of the instance of Azure AI Project."
}

output "aisc_resource" {
  value       = azapi_resource.AIServicesConnection
  description = "Resource of the instance of AzAPI AI Services Connection."
}
