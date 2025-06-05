locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
    mal_id        = var.mal_id # Added mal_id here
  }
}

module "avm-res-search-searchservice" {
  source  = "Azure/avm-res-search-searchservice/azurerm"
  version = "0.1.3" # Consider making this version configurable

  for_each = var.search_service

  location                                 = each.value.location
  name                                     = each.value.name
  resource_group_name                      = each.value.resource_group_name
  allowed_ips                              = each.value.allowed_ips
  authentication_failure_mode              = each.value.authentication_failure_mode
  customer_managed_key                     = each.value.customer_managed_key
  customer_managed_key_enforcement_enabled = each.value.customer_managed_key_enforcement_enabled
  diagnostic_settings                      = each.value.diagnostic_settings
  enable_telemetry                         = each.value.enable_telemetry # This is an AVM module parameter
  hosting_mode                             = each.value.hosting_mode
  local_authentication_enabled             = each.value.local_authentication_enabled
  lock                                     = each.value.lock
  managed_identities                       = each.value.managed_identities
  partition_count                          = each.value.partition_count
  private_endpoints                        = each.value.private_endpoints
  public_network_access_enabled            = each.value.public_network_access_enabled
  replica_count                            = each.value.replica_count
  role_assignments                         = each.value.role_assignments
  semantic_search_sku                      = each.value.semantic_search_sku
  sku                                      = each.value.sku
  # Updated tag merging: mandatory tags > per-service instance tags > general module instance tags
  tags = merge(var.tags, try(each.value.tags, {}), local.mandatory_tags)
}
