data "azurerm_subnet" "snet_nic" {
  resource_group_name  = var.nic_rg
  virtual_network_name = var.nic_vnet
  name                 = var.nic_subnet_name
}
