module "public_ip" {
  source        = "../"
  public_ip     = var.public_ip
  app_id        = var.app_id
  environment   = var.environment
  msftmigration = var.msftmigration
}