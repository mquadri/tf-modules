data "azurerm_web_application_firewall_policy" "this" {
  for_each            = var.waf_firewall_policy != null ? var.waf_firewall_policy : {}
  name                = each.value.waf_name
  resource_group_name = each.value.waf_resource_group_name
}

data "azurerm_subnet" "gateway_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.subnet_rg
}

locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

module "avm-res-network-applicationgateway" {
  source  = "Azure/avm-res-network-applicationgateway/azurerm"
  version = "0.4.1"
  # insert the 9 required variables here
  backend_address_pools = var.backend_address_pools
  backend_http_settings = var.backend_http_settings
  frontend_ports        = var.frontend_ports
  gateway_ip_configuration = {
    name      = var.gateway_ip_configuration.name
    subnet_id = data.azurerm_subnet.gateway_subnet.id
  }
  http_listeners        = var.http_listeners
  location              = var.location
  name                  = var.name
  request_routing_rules = var.request_routing_rules
  resource_group_name   = var.resource_group_name

  # optional
  app_gateway_waf_policy_resource_id    = try(data.azurerm_web_application_firewall_policy.this["waf"].id, null) != null ? data.azurerm_web_application_firewall_policy.this["waf"].id : var.app_gateway_waf_policy_resource_id
  authentication_certificate            = var.authentication_certificate
  autoscale_configuration               = var.autoscale_configuration
  create_public_ip                      = var.create_public_ip
  custom_error_configuration            = var.custom_error_configuration
  diagnostic_settings                   = var.diagnostic_settings
  enable_telemetry                      = var.enable_telemetry
  fips_enabled                          = var.fips_enabled
  frontend_ip_configuration_private     = var.frontend_ip_configuration_private
  frontend_ip_configuration_public_name = var.frontend_ip_configuration_public_name
  global                                = var.global
  http2_enable                          = var.http2_enable
  lock                                  = var.lock
  managed_identities                    = var.managed_identities
  private_link_configuration            = var.private_link_configuration
  probe_configurations                  = var.probe_configurations
  public_ip_name                        = var.public_ip_name
  public_ip_resource_id                 = var.public_ip_resource_id
  redirect_configuration                = var.redirect_configuration
  rewrite_rule_set                      = var.rewrite_rule_set
  role_assignments                      = var.role_assignments
  sku                                   = var.sku
  ssl_certificates                      = var.ssl_certificates
  ssl_policy                            = var.ssl_policy
  ssl_profile                           = var.ssl_profile
  tags                                  = merge(local.mandatory_tags, try(var.tags, {}))
  timeouts                              = var.timeouts
  trusted_client_certificate            = var.trusted_client_certificate
  trusted_root_certificate              = var.trusted_root_certificate
  url_path_map_configurations           = var.url_path_map_configurations
  waf_configuration                     = var.waf_configuration
  zones                                 = var.zones
}
