
data "azurerm_management_group" "rootmg" {
  name = var.management_groups.root_mg_id
}

resource "azurerm_management_group" "l1" {
  for_each                   = var.management_groups.level1_child_mg
  parent_management_group_id = data.azurerm_management_group.rootmg.id
  name                       = each.value.name
  display_name               = each.value.display_name
  subscription_ids           = lookup(each.value, "subscription_ids", null)
}

resource "azurerm_management_group" "l2" {
  for_each                   = var.management_groups.level2_child_mg == null ? null : var.management_groups.level2_child_mg
  parent_management_group_id = azurerm_management_group.l1[each.value.parent_key].id
  name                       = each.value.name
  display_name               = each.value.display_name
  subscription_ids           = lookup(each.value, "subscription_ids", null)
}

resource "azurerm_management_group" "l3" {
  for_each                   = var.management_groups.level2_child_mg == null ? null : var.management_groups.level3_child_mg
  parent_management_group_id = azurerm_management_group.l2[each.value.parent_key].id
  name                       = each.value.name
  display_name               = each.value.display_name
  subscription_ids           = lookup(each.value, "subscription_ids", null)
}

resource "azurerm_management_group" "l4" {
  for_each                   = var.management_groups.level2_child_mg == null ? null : var.management_groups.level4_child_mg
  parent_management_group_id = azurerm_management_group.l3[each.value.parent_key].id
  name                       = each.value.name
  display_name               = each.value.display_name
  subscription_ids           = lookup(each.value, "subscription_ids", null)
}

resource "azurerm_management_group" "l5" {
  for_each                   = var.management_groups.level2_child_mg == null ? null : var.management_groups.level5_child_mg
  parent_management_group_id = azurerm_management_group.l4[each.value.parent_key].id
  name                       = each.value.name
  display_name               = each.value.display_name
  subscription_ids           = lookup(each.value, "subscription_ids", null)
}
