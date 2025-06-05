module "avd-management-plane" {
  source           = "../"
  management_plane = var.management_plane
  app_id           = var.app_id
  msftmigration    = var.msftmigration
  environment      = var.environment
}