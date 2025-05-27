module "storage_sync" {
  source = "../"

  storage_sync_services = var.storage_sync_services
  storage_sync_groups   = var.storage_sync_groups
  environment           = var.environment
  app_id                = var.app_id
  msftmigration         = var.msftmigration
}
