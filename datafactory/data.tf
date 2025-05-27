data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "vnet-rg" {
  name = var.vnet_resource_group_name
}

data "azurerm_subnet" "pe" {
  name                 = var.pe_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.vnet-rg.name
}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group_name
}
data "azurerm_private_dns_zone" "adf_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.private_dns_rg
  provider            = azurerm.management
}

data "azurerm_private_dns_zone" "adf_portal_dns_zone" {
  name                = var.private_dns_portal_zone_name
  resource_group_name = var.private_dns_rg
  provider            = azurerm.management
}

data "azurerm_storage_account" "linked_sa" {
  count               = length(var.sa_datalake_linkedNames)
  name                = var.sa_datalake_linkedNames[count.index]
  resource_group_name = var.resource_group_name
}

