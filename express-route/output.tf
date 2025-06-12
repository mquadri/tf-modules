output "authorization_keys" {
  description = "Authorization keys for the ExpressRoute circuit."
  sensitive   = true
  value       = module.express_route_circuit.authorization_keys
}

output "authorization_used_status" {
  description = "Authorization used status."
  value       = module.express_route_circuit.authorization_used_status
}

output "express_route_gateway_connections" {
  description = "ExpressRoute gateway connections."
  value       = module.express_route_circuit.express_route_gateway_connections
}

output "name" {
  description = "The resource name of the ExpressRoute circuit."
  value       = module.express_route_circuit.name
}

output "peerings" {
  description = "ExpressRoute Circuit peering configurations."
  value       = module.express_route_circuit.peerings
  sensitive   = true
}

output "resource_id" {
  description = "The resource ID of the ExpressRoute circuit."
  value       = module.express_route_circuit.resource_id
}

output "virtual_network_gateway_connections" {
  description = "Virtual network gateway connections."
  value       = module.express_route_circuit.virtual_network_gateway_connections
}