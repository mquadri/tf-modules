output "authorization_keys" {
  description = "Authorization keys for the ExpressRoute circuit."
  sensitive   = true
  value       = module.exr_circuit_test.authorization_keys
}

output "authorization_used_status" {
  description = "Authorization used status."
  value       = module.exr_circuit_test.authorization_used_status
}

output "express_route_gateway_connections" {
  description = "ExpressRoute gateway connections."
  value       = module.exr_circuit_test.express_route_gateway_connections
}

output "name" {
  description = "The resource name of the ExpressRoute circuit."
  value       = module.exr_circuit_test.name
}

output "peerings" {
  description = "ExpressRoute Circuit peering configurations."
  value       = module.exr_circuit_test.peerings
  sensitive   = true
}

output "resource_id" {
  description = "The resource ID of the ExpressRoute circuit."
  value       = module.exr_circuit_test.resource_id
}

output "virtual_network_gateway_connections" {
  description = "Virtual network gateway connections."
  value       = module.exr_circuit_test.virtual_network_gateway_connections
}