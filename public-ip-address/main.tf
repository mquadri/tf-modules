locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "avm-res-network-publicipaddress" {
  source  = "Azure/avm-res-network-publicipaddress/azurerm"
  version = "0.1.2"

  for_each                = var.public_ip
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  name                    = each.value.name
  enable_telemetry        = each.value.enable_telemetry
  zones                   = each.value.zones
  sku                     = each.value.sku
  sku_tier                = each.value.sku_tier
  ip_version              = each.value.ip_version
  allocation_method       = each.value.allocation_method
  domain_name_label       = each.value.domain_name_label
  reverse_fqdn            = each.value.reverse_fqdn
  public_ip_prefix_id     = each.value.public_ip_prefix_id
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  ip_tags                 = merge(local.mandatory_tags,try(each.value.ip_tags,{}))
  ddos_protection_mode    = each.value.ddos_protection_mode
  ddos_protection_plan_id = each.value.ddos_protection_plan_id
  edge_zone               = each.value.edge_zone
  tags                    = merge(local.mandatory_tags,try(each.value.tags,{}))
  lock                    = each.value.lock
  role_assignments        = each.value.role_assignments
  diagnostic_settings     = each.value.diagnostic_settings
}