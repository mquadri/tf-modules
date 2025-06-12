module "redis_cache_example" {
  source = "../"

  redis_caches  = var.redis_caches
  app_id        = var.app_id
  msftmigration = var.msftmigration
  environment   = var.environment
}
