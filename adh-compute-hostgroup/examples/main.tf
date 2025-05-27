locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "test" {
  source  = "../"
  #version = "0.1.2"

  dedicated_host_group_name   = var.dedicated_host_group_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  platform_fault_domain_count = var.platform_fault_domain_count
  automatic_placement_enabled = var.automatic_placement_enabled
  zone                        = var.zone
  enable_telemetry            = var.enable_telemetry
  tags                        = merge(local.mandatory_tags, var.tags)
  dedicated_hosts = var.dedicated_hosts
  app_id            = var.app_id
  msftmigration     = var.msftmigration
  environment       = var.environment  
  
}