locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

resource "azurerm_availability_set" "this" {
  for_each = var.availability_sets

  name                         = each.value.name
  location                     = each.value.location
  resource_group_name          = each.value.resource_group_name
  platform_fault_domain_count  = each.value.platform_fault_domain_count
  platform_update_domain_count = each.value.platform_update_domain_count
  managed                      = each.value.managed
  proximity_placement_group_id = each.value.proximity_placement_group_id != "" ? each.value.proximity_placement_group_id : null
  tags                         = merge(local.mandatory_tags, try(each.value.tags, {}))
}
