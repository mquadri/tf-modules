locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "avm-ptn-virtualwan" {
  source  = "Azure/avm-ptn-virtualwan/azurerm"
  version = "0.5.0"

  for_each                              = var.vwan_vhub
  allow_branch_to_branch_traffic        = each.value.allow_branch_to_branch_traffic
  location                              = each.value.location
  resource_group_name                   = each.value.resource_group_name
  virtual_wan_name                      = each.value.virtual_wan_name
  create_resource_group                 = each.value.create_resource_group
  type                                  = each.value.type
  virtual_wan_tags                      = each.value.virtual_wan_tags
  virtual_hubs                          = each.value.virtual_hubs
  virtual_network_connections           = each.value.virtual_network_connections
  er_circuit_connections                = each.value.er_circuit_connections
  expressroute_gateways                 = each.value.expressroute_gateways
  firewalls                             = each.value.firewalls
  p2s_gateway_vpn_server_configurations = each.value.p2s_gateway_vpn_server_configurations
  p2s_gateways                          = each.value.p2s_gateways
  routing_intents                       = each.value.routing_intents
  vpn_gateways                          = each.value.vpn_gateways
  vpn_site_connections                  = each.value.vpn_site_connections
  vpn_sites                             = each.value.vpn_sites
  disable_vpn_encryption                = each.value.disable_vpn_encryption
  office365_local_breakout_category     = each.value.office365_local_breakout_category
  resource_group_tags                   = each.value.resource_group_tags
  tags                                  = merge(local.mandatory_tags,try(each.value.tags,{}))
}