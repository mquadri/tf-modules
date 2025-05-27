locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

# Fetch Network Watcher Location
data "azurerm_network_watcher" "this" {
  for_each            = var.flow_logs
  name                = each.value.network_watcher_name
  resource_group_name = each.value.resource_group_name
}

# Fetch Storage Account ID
data "azurerm_storage_account" "this" {
  for_each            = var.flow_logs
  name                = each.value.storage_account_name
  resource_group_name = each.value.storage_account_rg
}

# Fetch Virtual Network ID (Target Resource)
data "azurerm_virtual_network" "this" {
  for_each            = var.flow_logs
  name                = each.value.vnet_name
  resource_group_name = each.value.vnet_rg
}

module "avm-res-network-networkwatcher" {
  source  = "Azure/avm-res-network-networkwatcher/azurerm"
  version = "0.2.1"

  for_each = var.flow_logs

  # Required
  location             = coalesce(each.value.location, data.azurerm_network_watcher.this[each.key].location)
  network_watcher_id   = data.azurerm_network_watcher.this[each.key].id
  network_watcher_name = each.value.network_watcher_name
  resource_group_name  = each.value.resource_group_name
  flow_logs = {
    (each.key) = {
      enabled            = true
      name               = each.value.name
      storage_account_id = data.azurerm_storage_account.this[each.key].id
      target_resource_id = data.azurerm_virtual_network.this[each.key].id
      version            = each.value.version
      retention_policy   = each.value.retention_policy
      traffic_analytics  = each.value.traffic_analytics
    }
  }

  # Optional
  enable_telemetry  = each.value.enable_telemetry
  role_assignments  = each.value.role_assignments
  lock              = each.value.lock
  condition_monitor = each.value.condition_monitor
  tags              = merge(local.mandatory_tags,try(each.value.tags,{}))
}