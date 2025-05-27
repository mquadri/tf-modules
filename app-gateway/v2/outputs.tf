output "public_ip" {
  description = "A public IP assigned to the Application Gateway."
  value       = azurerm_public_ip.pip.ip_address
}

output "backend-address-pool-id" {
  description = "the azure resource ID of the application gateway's backend address pool"
  value       = azurerm_application_gateway.appgw.backend_address_pool
}

output "application-gateway-name" {
  description = "the azure application gateway name"
  value       = azurerm_application_gateway.appgw.name
}

output "application-gateway-id" {
  description = "the azure application gateway id"
  value       = azurerm_application_gateway.appgw.id
}

