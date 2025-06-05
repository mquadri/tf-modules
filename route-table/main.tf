data "azurerm_subnet" "this" {
  for_each             = var.subnet != null ? var.subnet : {}
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}

locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

module "avm-res-network-routetable" {
  source                        = "Azure/avm-res-network-routetable/azurerm"
  version                       = "0.2.2"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  name                          = var.name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  enable_telemetry              = var.enable_telemetry
  lock                          = var.lock
  role_assignments              = var.role_assignments
  routes                        = var.routes
  subnet_resource_ids           = try(data.azurerm_subnet.this["subnet"].id, null) != null ? data.azurerm_subnet.this["subnet"].id : var.subnet_resource_ids
  tags                          = merge(local.mandatory_tags, try(var.tags, {}))
}