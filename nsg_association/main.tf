data "azurerm_network_security_group" "this" {
  for_each            = var.nsg_association != null ? var.nsg_association : {}
  name                = each.value.nsg_name
  resource_group_name = each.value.nsg_resource_group
}

data "azurerm_subnet" "this" {
  for_each             = var.nsg_association != null ? var.nsg_association : {}
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.vnet_resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each                  = var.nsg_association != null ? var.nsg_association : {}
  subnet_id                 = data.azurerm_subnet.this[each.key].id
  network_security_group_id = data.azurerm_network_security_group.this[each.key].id
}