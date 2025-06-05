# A map of the hosts in the Dedicated Host Group to the resource IDs
output "host_ids" {
  description = "A map of the hosts in the Dedicated Host Group to the resource IDs"
  value       = module.test
}

# The name of the Dedicated Host Group
output "name" {
  description = "The name of the Dedicated Host Group"
  value       = module.test.name
}

# All atrributes of the Dedicated Host group
output "resource" {
  description = "All atrributes of the Dedicated Host group"
  value       = module.test.resource
}