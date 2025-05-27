output "name" {
  description = "The name of the Network Security Group resource"
  value       = module.nsg.name
}

output "resource" {
  description = "The Network Security Group resource"
  value       = module.nsg.resource
}

output "resource_id" {
  description = "The id of the Network Security Group resource"
  value       = module.nsg.resource_id
}