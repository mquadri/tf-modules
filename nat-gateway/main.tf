locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "avm-res-network-natgateway" {
  source  = "Azure/avm-res-network-natgateway/azurerm"
  version = "0.2.0"

  for_each = var.natgateways

  # required
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # optional
  enable_telemetry        = each.value.enable_telemetry
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  lock                    = each.value.lock
  public_ip_configuration = each.value.public_ip_configuration
  public_ip_prefix_length = each.value.public_ip_prefix_length
  public_ips              = each.value.public_ips
  role_assignments        = each.value.role_assignments
  sku_name                = each.value.sku_name
  subnet_associations     = each.value.subnet_associations
  tags                    = merge(local.mandatory_tags, try(each.value.tags,{}))
  timeouts                = each.value.timeouts
  zones                   = each.value.zones
}
