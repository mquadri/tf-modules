data "azurerm_subnet" "aks-subnet-node-cidr" {
  name                 = var.aks_vnet_subnet_name
  virtual_network_name = var.aks_vnet_name
  resource_group_name  = var.network_resource_group_name
}

data "azurerm_virtual_network" "aks-vnet" {
  name                = var.aks_vnet_name
  resource_group_name = var.network_resource_group_name
}

data "azurerm_subscription" "current" {
}