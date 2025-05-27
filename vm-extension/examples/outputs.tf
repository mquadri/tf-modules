output "resource_id" {
  description = "The Azure resource id for the deployed virtual machine extension"
  value       = module.vm-extension.resource_id
  sensitive   = true
}
