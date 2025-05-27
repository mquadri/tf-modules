output "name" {
  description = "Specifies the name of the API Management"
  value       = azurerm_api_management.apim0.name
}

output "id" {
  description = "Specifies the id of the API Management"
  value       = azurerm_api_management.apim0.id
}

output "url" {
  description = "Specifies the url of the API Management"
  value       = azurerm_api_management.apim0.gateway_url
}

output "identity" { # Use principal_id instead of this
  description = "Specifies the identity of the API Management"
  value       = azurerm_api_management.apim0.identity[*].principal_id
}

output "private_ip_addresses" {
  value = azurerm_api_management.apim0.private_ip_addresses
}

output "public_ip_addresses" {
  value = azurerm_api_management.apim0.public_ip_addresses
}

output "principal_id" {
  description = "Specifies the identity of the API Management"
  value       = azurerm_api_management.apim0.identity[*].principal_id
}
output "additional_location" {
  value       = length(azurerm_api_management.apim0.additional_location) > 0 ? azurerm_api_management.apim0.additional_location : null
  description = "Zero or more `additional_location` blocks."
}
output "additional_location_private_ip_addresses" {
  value       = length(azurerm_api_management.apim0.additional_location) > 0 ? azurerm_api_management.apim0.additional_location[0].private_ip_addresses : null
  description = "Private IP Addresses array from the first `additional_location` block."
}
