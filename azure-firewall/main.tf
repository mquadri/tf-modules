data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azurerm_firewall_policy" "this" {
  name                = var.firewall_policy_name
  resource_group_name = var.policy_resource_group_name != null ? var.policy_resource_group_name : data.azurerm_resource_group.this.name
}

data "azurerm_public_ip" "this" {
  for_each            = var.public_ip != null ? var.public_ip : {}
  name                = each.value.public_ip_name
  resource_group_name = each.value.public_ip_resource_group_name
}

data "azurerm_public_ip" "management" {
  for_each            = var.public_ip_management != null ? var.public_ip_management : {}
  name                = each.value.public_ip_name
  resource_group_name = each.value.public_ip_resource_group_name
}
data "azurerm_subnet" "this" {
  for_each             = var.virtual_network != null ? var.virtual_network : {}
  name                 = "AzureFirewallSubnet"
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.vnet_resource_group_name
}
data "azurerm_subnet" "management" {
  for_each             = var.virtual_network_management != null ? var.virtual_network_management : {}
  name                 = "AzureFirewallManagementSubnet"
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.vnet_resource_group_name
}

data "azurerm_virtual_hub" "this" {
  for_each            = var.virtual_hub != null ? var.virtual_hub : {}
  name                = each.value.hub_name
  resource_group_name = each.value.hub_resource_group_name
}
locals {

  ip_configuration = [
    for v in var.public_ip : {
      name                 = v.name
      subnet_id            = try(data.azurerm_subnet.this["vnet"].id, null) != null ? data.azurerm_subnet.this["vnet"].id : join("", [var.virtual_network_id, "/subnets/AzureFirewallSubnet"])
      public_ip_address_id = try(data.azurerm_public_ip.this["pip"].id, null)
    }
  ]
  management_ip_configuration = {
    for k, v in var.public_ip_management : k => {
      name                 = v.name
      subnet_id            = try(data.azurerm_subnet.management["vnet"].id, null) != null ? data.azurerm_subnet.management["vnet"].id : join("", [var.virtual_network_id_management, "/subnets/AzureFirewallManagementSubnet"])
      public_ip_address_id = try(data.azurerm_public_ip.management["pip"].id, null)
    }
  }

  firewall_virtual_hub = {
    for k, v in var.virtual_hub : k => {
      virtual_hub_id  = try(data.azurerm_virtual_hub.this["hub"].id, null) != null ? data.azurerm_virtual_hub.this["hub"].id : var.virtual_hub_id
      public_ip_count = v.public_ip_count
    }
  }

  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}


module "avm-res-network-azurefirewall" {
  source                               = "Azure/avm-res-network-azurefirewall/azurerm"
  version                              = "0.2.2"
  location                             = var.location
  name                                 = var.name
  resource_group_name                  = data.azurerm_resource_group.this.name
  firewall_sku_name                    = var.firewall_sku_name
  firewall_sku_tier                    = var.firewall_sku_tier
  diagnostic_settings                  = var.diagnostic_settings
  enable_telemetry                     = var.enable_telemetry
  firewall_ip_configuration            = try(local.ip_configuration, null) != null ? local.ip_configuration : null
  firewall_management_ip_configuration = try(local.management_ip_configuration.pip, null) != null ? local.management_ip_configuration.pip : null
  firewall_policy_id                   = try(data.azurerm_firewall_policy.this.id, null) != null ? data.azurerm_firewall_policy.this.id : null
  firewall_private_ip_ranges           = var.firewall_private_ip_ranges
  firewall_timeouts                    = var.firewall_timeouts
  firewall_virtual_hub                 = try(local.firewall_virtual_hub.hub, null) != null ? local.firewall_virtual_hub.hub : null
  firewall_zones                       = var.firewall_zones
  lock                                 = var.lock
  role_assignments                     = var.role_assignments
  tags                                 = merge(local.mandatory_tags, try(var.tags,{}))
}