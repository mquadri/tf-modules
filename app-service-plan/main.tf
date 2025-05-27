module "avm-res-web-serverfarm" {
  source  = "Azure/avm-res-web-serverfarm/azurerm"
  version = "0.2.0"

  location            = var.location
  name                = local.name
  os_type             = var.os_type
  resource_group_name = var.resource_group_name

  app_service_environment_id   = var.app_service_environment_id
  enable_telemetry             = var.enable_telemetry
  lock                         = var.lock
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  per_site_scaling_enabled     = var.per_site_scaling_enabled
  role_assignments             = var.role_assignments
  sku_name                     = var.sku_name
  tags                         = local.tags
  worker_count                 = var.worker_count
  zone_balancing_enabled       = var.zone_balancing_enabled
}
