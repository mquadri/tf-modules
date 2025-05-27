data "azurerm_subnet" "redis_subnet" {
  for_each = {
    for k, v in var.redis_caches : k => v
    if v.subnet_name != null && v.subnet_name != ""
  }
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.subnet_resource_group_name
}

locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "redis_cache" {
  for_each = var.redis_caches

  source  = "Azure/avm-res-cache-redis/azurerm"
  version = "0.2.0" 

  # Mandatory Parameters
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  name                = each.value.name

  # Optional Parameters
  access_keys_authentication_enabled      = each.value.access_keys_authentication_enabled
  cache_access_policies                   = each.value.cache_access_policies
  cache_access_policy_assignments         = each.value.cache_access_policy_assignments
  cache_firewall_rules                    = each.value.cache_firewall_rules
  capacity                                = each.value.capacity
  diagnostic_settings                     = each.value.diagnostic_settings
  enable_non_ssl_port                     = each.value.enable_non_ssl_port
  enable_telemetry                        = each.value.enable_telemetry
  linked_redis_caches                     = each.value.linked_redis_caches
  lock                                    = each.value.lock
  managed_identities                      = each.value.managed_identities
  minimum_tls_version                     = each.value.minimum_tls_version
  patch_schedule                          = each.value.patch_schedule
  private_endpoints                       = each.value.private_endpoints
  private_endpoints_manage_dns_zone_group = each.value.private_endpoints_manage_dns_zone_group
  private_static_ip_address               = each.value.private_static_ip_address
  public_network_access_enabled           = each.value.public_network_access_enabled
  redis_configuration                     = each.value.redis_configuration
  redis_version                           = each.value.redis_version
  replicas_per_master                     = each.value.replicas_per_master
  replicas_per_primary                    = each.value.replicas_per_primary
  role_assignments                        = each.value.role_assignments
  shard_count                             = each.value.shard_count
  sku_name                                = each.value.sku_name
  subnet_resource_id                      = var.redis_caches[each.key].subnet_name != null && var.redis_caches[each.key].subnet_name != "" ? data.azurerm_subnet.redis_subnet[each.key].id : null
  tags                                    = merge(local.mandatory_tags, try(each.value.tags,{})) 
  tenant_settings                         = each.value.tenant_settings
  zones                                   = each.value.zones
}
