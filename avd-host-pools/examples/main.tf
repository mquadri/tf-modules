module "avd_host_pool" {
  source         = "../"
  avd_host_pools = var.avd_host_pools
  app_id            = var.app_id
  msftmigration     = var.msftmigration
  environment       = var.environment  
}