locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

resource "azurerm_storage_sync" "this" {
  for_each                = var.storage_sync_services
  name                    = each.key
  resource_group_name     = each.value.resource_group_name
  location                = each.value.location
  incoming_traffic_policy = each.value.incoming_traffic_policy
  tags                    = merge(local.mandatory_tags, try(each.value.tags, {}))
}

resource "azurerm_storage_sync_group" "this" {
  for_each        = var.storage_sync_groups
  name            = each.value.name
  storage_sync_id = azurerm_storage_sync.this[each.value.storage_sync_name].id
  depends_on = [
    azurerm_storage_sync.this
  ]
}
