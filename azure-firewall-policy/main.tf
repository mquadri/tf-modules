locals {
  base_policy = var.base_policy_name != null ? {
    "base" = var.base_policy_name
  } : {}

    mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }

}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
data "azurerm_firewall_policy" "this" {
  for_each            = local.base_policy
  name                = each.value
  resource_group_name = var.base_policy_resource_group_name != null ? var.base_policy_resource_group_name : data.azurerm_resource_group.this.name
}
module "avm-res-network-firewallpolicy" {
  source                                            = "Azure/avm-res-network-firewallpolicy/azurerm"
  version                                           = "0.2.3"
  location                                          = var.location
  name                                              = var.name
  resource_group_name                               = data.azurerm_resource_group.this.name
  diagnostic_settings                               = var.diagnostic_settings
  enable_telemetry                                  = var.enable_telemetry
  role_assignments                                  = var.role_assignments
  firewall_policy_auto_learn_private_ranges_enabled = var.firewall_policy_auto_learn_private_ranges_enabled
  firewall_policy_base_policy_id                    = try(var.firewall_policy_base_policy_id, null) != null ? var.firewall_policy_base_policy_id : (length(data.azurerm_firewall_policy.this) > 0 ? data.azurerm_firewall_policy.this["base"].id : null)
  firewall_policy_dns                               = var.firewall_policy_dns
  firewall_policy_explicit_proxy                    = var.firewall_policy_explicit_proxy
  firewall_policy_identity                          = var.firewall_policy_identity
  firewall_policy_insights                          = var.firewall_policy_insights
  firewall_policy_intrusion_detection               = var.firewall_policy_intrusion_detection
  firewall_policy_private_ip_ranges                 = var.firewall_policy_private_ip_ranges
  firewall_policy_sku                               = var.firewall_policy_sku
  firewall_policy_sql_redirect_allowed              = var.firewall_policy_sql_redirect_allowed
  firewall_policy_threat_intelligence_allowlist     = var.firewall_policy_threat_intelligence_allowlist
  firewall_policy_threat_intelligence_mode          = var.firewall_policy_threat_intelligence_mode
  firewall_policy_timeouts                          = var.firewall_policy_timeouts
  firewall_policy_tls_certificate                   = var.firewall_policy_tls_certificate
  lock                                              = var.lock
  tags                                              = merge(local.mandatory_tags, try(var.tags,{}))
}