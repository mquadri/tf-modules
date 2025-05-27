data "azurerm_web_application_firewall_policy" "this" {
  for_each            = var.waf_firewall_policy != null ? var.waf_firewall_policy : {}
  name                = each.value.waf_name
  resource_group_name = each.value.waf_resource_group_name
}

module "application_gateway" {
  source = "../"

  backend_address_pools    = var.backend_address_pools
  backend_http_settings    = var.backend_http_settings
  frontend_ports           = var.frontend_ports
  gateway_ip_configuration = var.gateway_ip_configuration
  subnet_name              = var.subnet_name
  vnet_name                = var.vnet_name
  subnet_rg                = var.subnet_rg
  http_listeners           = var.http_listeners
  location                 = var.location
  name                     = var.name
  request_routing_rules    = var.request_routing_rules
  resource_group_name      = var.resource_group_name

  app_gateway_waf_policy_resource_id = try(data.azurerm_web_application_firewall_policy.this["waf"].id, null)

  create_public_ip = var.create_public_ip
  sku              = var.sku
  tags             = var.tags
  app_id           = var.app_id
  msftmigration    = var.msftmigration
  environment      = var.environment
}
