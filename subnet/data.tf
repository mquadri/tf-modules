data "azurerm_resource_group" "this" {
  name = var.vnet_resource_group_name
}

data "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.this.name
}
