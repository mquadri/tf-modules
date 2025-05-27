locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

# This is required for resource modules

module "loadbalancer" {
  source                          = "Azure/avm-res-network-loadbalancer/azurerm"
  version                         = "0.2.2"
  name                            = var.name
  location                        = var.location
  public_ip_address_configuration = var.public_ip_address_configuration
  lock                            = var.lock
  sku                             = var.sku
  sku_tier                        = var.sku_tier
  resource_group_name             = var.resource_group_name
  enable_telemetry                = var.enable_telemetry
  edge_zone                       = var.edge_zone
  frontend_subnet_resource_id     = var.frontend_subnet_resource_id
  # Frontend IP Configuration
  frontend_ip_configurations = var.frontend_ip_configurations
  # Virtual Network for Backend Address Pool(s)
  backend_address_pool_configuration = var.backend_address_pool_configuration
  # Backend Address Pool
  backend_address_pools                   = var.backend_address_pools
  backend_address_pool_addresses          = var.backend_address_pool_addresses
  backend_address_pool_network_interfaces = var.backend_address_pool_network_interfaces
  # Health Probe(s)
  lb_probes         = var.lb_probes
  lb_outbound_rules = var.lb_outbound_rules
  lb_nat_rules      = var.lb_nat_rules
  lb_nat_pools      = var.lb_nat_pools
  # Load Balaner rule(s)
  lb_rules            = var.lb_rules
  diagnostic_settings = var.diagnostic_settings
  role_assignments    = var.role_assignments
  tags                = merge(local.mandatory_tags, try(var.tags,{}))
}
