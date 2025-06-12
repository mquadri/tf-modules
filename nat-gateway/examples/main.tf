module "nat_gateway" {
  source        = "../"
  natgateways   = var.natgateways
  app_id        = var.app_id
  msftmigration = var.msftmigration
  environment   = var.environment
}