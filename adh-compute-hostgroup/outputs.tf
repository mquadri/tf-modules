output "name" {
  description = "The name of the Dedicated Host Group"
  value       = module.avm-dedicated_host_group.name
}

# All atrributes of the Dedicated Host group
output "resource" {
  description = "All atrributes of the Dedicated Host group"
  value       = module.avm-dedicated_host_group
}