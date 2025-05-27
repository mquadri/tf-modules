module "panorama-example" {
  source             = "../"
  panorama_instances = var.panorama_instances
  subscription_id    = var.subscription_id
  kv_sub_id          = var.kv_sub_id
  tenant_id          = var.tenant_id
  app_id             = var.app_id
  msftmigration      = var.msftmigration
  environment        = var.environment
}

