output "application_gateway_id" {
  description = "The ID of the Azure Application Gateway."
  value       = module.avm-res-network-applicationgateway.application_gateway_id
}

output "application_gateway_name" {
  description = "The name of the Azure Application Gateway."
  value       = module.avm-res-network-applicationgateway.application_gateway_name
}

output "backend_address_pools" {
  description = "Information about the backend address pools configured for the Application Gateway, including their names."
  value       = module.avm-res-network-applicationgateway.backend_address_pools
}

output "backend_http_settings" {
  description = "Information about the backend HTTP settings for the Application Gateway, including settings like port and protocol."
  value       = module.avm-res-network-applicationgateway.backend_http_settings
}

output "frontend_port" {
  description = "Information about the frontend ports used by the Application Gateway, including their names and port numbers."
  value       = module.avm-res-network-applicationgateway.frontend_port
}

output "http_listeners" {
  description = "Information about the HTTP listeners configured for the Application Gateway, including their names and settings."
  value       = module.avm-res-network-applicationgateway.http_listeners
}

output "new_public_ip_address" {
  description = "The actual public IP address associated with the Public IP resource, if we create a new one."
  value       = try(module.avm-res-network-applicationgateway.azurerm_public_ip.this[0].ip_address, "")
}

output "probes" {
  description = "Information about health probes configured for the Application Gateway, including their settings."
  value       = module.avm-res-network-applicationgateway.probes
}

output "public_ip_id" {
  description = "The ID of the Azure Public IP address associated with the Application Gateway."
  value       = var.create_public_ip == true ? module.avm-res-network-applicationgateway.azurerm_public_ip.this[0].id : var.public_ip_resource_id
}


output "request_routing_rules" {
  description = "Information about request routing rules defined for the Application Gateway, including their names and configurations."
  value       = module.avm-res-network-applicationgateway.request_routing_rules
}

output "resource_id" {
  description = "Resource ID of the Application Gateway."
  value       = module.avm-res-network-applicationgateway.resource_id
}

output "ssl_certificates" {
  description = "Information about SSL certificates used by the Application Gateway, including their names and other details."
  value       = module.avm-res-network-applicationgateway.ssl_certificates
}

output "tags" {
  description = "The tags applied to the Application Gateway."
  value       = module.avm-res-network-applicationgateway.tags
}

output "waf_configuration" {
  description = "Information about the Web Application Firewall (WAF) configuration, if applicable."
  value       = module.avm-res-network-applicationgateway.waf_configuration
}

output "application_gateway_combined_output" {
  description = "A combined output containing details of the Azure Application Gateway."
  value = {
    application_gateway_id   = module.avm-res-network-applicationgateway.application_gateway_id
    application_gateway_name = module.avm-res-network-applicationgateway.application_gateway_name
    backend_address_pools    = module.avm-res-network-applicationgateway.backend_address_pools
    backend_http_settings    = module.avm-res-network-applicationgateway.backend_http_settings
    frontend_port            = module.avm-res-network-applicationgateway.frontend_port
    http_listeners           = module.avm-res-network-applicationgateway.http_listeners
    probes                   = module.avm-res-network-applicationgateway.probes
    new_public_ip_address    = try(module.avm-res-network-applicationgateway.azurerm_public_ip.this[0].ip_address, "")
    public_ip_id             = var.create_public_ip == true ? module.avm-res-network-applicationgateway.azurerm_public_ip.this[0].id : var.public_ip_resource_id
    request_routing_rules    = module.avm-res-network-applicationgateway.request_routing_rules
    resource_id              = module.avm-res-network-applicationgateway.resource_id
    ssl_certificates         = module.avm-res-network-applicationgateway.ssl_certificates
    tags                     = module.avm-res-network-applicationgateway.tags
    waf_configuration        = module.avm-res-network-applicationgateway.waf_configuration
  }
}