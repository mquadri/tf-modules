data "azurerm_virtual_network" "this" {
  for_each            = var.virtual_network != null ? var.virtual_network : {}
  name                = each.value.vnet_name
  resource_group_name = each.value.vnet_resource_group_name
}

data "azurerm_public_ip" "this" {
  for_each            = var.public_ip != null ? var.public_ip : {}
  name                = each.value.public_ip_name
  resource_group_name = each.value.public_ip_resource_group_name
}

data "azurerm_subnet" "this" {
  for_each             = var.virtual_network != null ? var.virtual_network : {}
  name                 = "AzureBastionSubnet"
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.vnet_resource_group_name
}

locals {
  ip_configuration = {
    for k, v in var.public_ip : k => {
      name                 = v.name
      subnet_id            = try(data.azurerm_subnet.this["vnet"].id, null) != null ? data.azurerm_subnet.this["vnet"].id : join("", [var.virtual_network_id, "/subnets/AzureBastionSubnet"])
      public_ip_address_id = try(data.azurerm_public_ip.this["pip"].id, null)
    }
  }

  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "avm-res-network-bastionhost" {
  source                 = "Azure/avm-res-network-bastionhost/azurerm"
  version                = "0.3.0"
  location               = var.location
  name                   = var.name
  resource_group_name    = var.resource_group_name
  ip_configuration       = try(local.ip_configuration.pip, null) != null ? local.ip_configuration.pip : null
  enable_telemetry       = var.enable_telemetry
  copy_paste_enabled     = var.copy_paste_enabled
  file_copy_enabled      = var.file_copy_enabled
  sku                    = var.sku
  ip_connect_enabled     = var.ip_connect_enabled
  scale_units            = var.scale_units
  shareable_link_enabled = var.shareable_link_enabled
  tunneling_enabled      = var.tunneling_enabled
  kerberos_enabled       = var.kerberos_enabled
  virtual_network_id     = try(data.azurerm_virtual_network.this["vnet"].id, null) != null ? data.azurerm_virtual_network.this["vnet"].id : try(var.virtual_network_id, null)
  tags                   = local.mandatory_tags
}