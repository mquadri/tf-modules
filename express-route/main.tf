locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

module "express_route_circuit" {
  source                               = "Azure/avm-res-network-expressroutecircuit/azurerm"
  version                              = "0.2.1"
  resource_group_name                  = var.resource_group_name
  name                                 = var.name
  service_provider_name                = var.service_provider_name
  peering_location                     = var.peering_location
  bandwidth_in_mbps                    = var.bandwidth_in_mbps
  bandwidth_in_gbps                    = var.bandwidth_in_gbps
  authorization_key                    = var.authorization_key
  allow_classic_operations             = var.allow_classic_operations
  er_gw_connections                    = var.er_gw_connections
  vnet_gw_connections                  = var.vnet_gw_connections
  location                             = var.location
  sku                                  = var.sku
  peerings                             = var.peerings
  express_route_circuit_authorizations = var.express_route_circuit_authorizations
  enable_telemetry                     = var.enable_telemetry # see variables.tf
  customer_managed_key                 = var.customer_managed_key
  diagnostic_settings                  = var.diagnostic_settings
  tags                                 = merge(local.mandatory_tags, try(var.tags, {}))
  role_assignments                     = var.role_assignments
}

