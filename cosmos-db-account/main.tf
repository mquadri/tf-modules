# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_cosmosdb_account" "cosmosdbaccount" {
  name                                  = var.azurerm_cosmosdb_account_name
  resource_group_name                   = var.resource_group_name
  location                              = var.location
  offer_type                            = var.offer_type
  kind                                  = var.kind
  automatic_failover_enabled            = var.enable_automatic_failover
  tags                                  = var.tags
  public_network_access_enabled         = var.public_network_access_enabled
  is_virtual_network_filter_enabled     = var.is_virtual_network_filter_enabled
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = var.network_acl_bypass_ids
  ip_range_filter                       = var.ip_range_filter

  consistency_policy {
    consistency_level = var.consistency_level
  }
  geo_location {
    location          = var.location
    failover_priority = 0
    zone_redundant    = var.location_zone_redundant
  }
  dynamic "geo_location" {
    for_each = var.failover_location == null ? [] : [var.failover_location]
    content {
      location          = var.failover_location
      failover_priority = 1
      zone_redundant    = var.failover_location_zone_redundant
    }
  }
  backup {
    type                = var.backup_type
    interval_in_minutes = var.interval_in_minutes
    retention_in_hours  = var.retention_in_hours
    storage_redundancy  = var.storage_redundancy
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
