output "name" {
  description = "The name of the Network Security Group resource"
  value       = module.avm-res-network-networksecuritygroup.name
}

output "resource" {
  description = "The Network Security Group resource"
  value       = module.avm-res-network-networksecuritygroup
}

output "resource_id" {
  description = "The id of the Network Security Group resource"
  value       = module.avm-res-network-networksecuritygroup.resource_id
}