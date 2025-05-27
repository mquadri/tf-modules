module "shared-image" {
  source          = "../"
  shared_image_config = var.shared_image_config
  app_id              = var.app_id
  environment         = var.environment
  msftmigration       = var.msftmigration
}