output "express_route_circuit_id" {
  value       = azurerm_express_route_circuit.erc.id
  description = "ID of the Circuit"
}

output "service_key" {
  value       = azurerm_express_route_circuit.erc.service_key
  description = "Service Key of the Circuit"
}

