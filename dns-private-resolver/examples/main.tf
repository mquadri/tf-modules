module "dns_resolver" {
  source        = "../"
  dnsresolver   = var.dnsresolver
  app_id        = var.app_id
  msftmigration = var.msftmigration
  environment   = var.environment
}