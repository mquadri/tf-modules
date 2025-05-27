data "azurerm_resource_group" "db-rg" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "vnet-rg" {
  name = var.vnet_resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet-rg.name
}

data "azurerm_subnet" "mgmt" {
  name                 = var.mgmt-public-snet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

data "azurerm_subnet" "int" {
  name                 = var.int-private-snet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

data "azurerm_subnet" "pe" {
  name                 = var.pe_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

data "azurerm_private_dns_zone" "db_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.private_dns_rg
  provider            = azurerm.management
}
