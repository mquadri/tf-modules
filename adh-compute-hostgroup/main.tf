locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}


module "avm-dedicated_host_group" {
  source                      = "Azure/avm-res-compute-hostgroup/azurerm"
  version                     = "0.1.2"
  dedicated_host_group_name   = var.dedicated_host_group_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  platform_fault_domain_count = var.platform_fault_domain_count
  automatic_placement_enabled = var.automatic_placement_enabled
  zone                        = var.zone
  dedicated_hosts             = var.dedicated_hosts
  enable_telemetry            = var.enable_telemetry
  tags                        = merge(local.mandatory_tags, try(var.tags, {}))
}
