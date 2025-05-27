locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "avm-res-network-networksecuritygroup" {
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.3.0"
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  diagnostic_settings = var.diagnostic_settings
  enable_telemetry    = var.enable_telemetry
  lock                = var.lock
  role_assignments    = var.role_assignments
  security_rules      = var.security_rules
  tags                = merge(local.mandatory_tags,try(var.tags,{}))
  timeouts            = var.timeouts
}