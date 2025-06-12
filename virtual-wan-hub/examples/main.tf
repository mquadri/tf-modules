module "vwan" {
  source        = "../"
  vwan_vhub     = var.vwan_vhub
  environment   = var.environment
  app_id        = var.app_id
  msftmigration = var.msftmigration
}