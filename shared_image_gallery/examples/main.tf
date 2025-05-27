module "shared-image-gallery" {
  source          = "../"
  shared_image_gallery_config = var.shared_image_gallery_config
  app_id              = var.app_id
  environment         = var.environment
  msftmigration       = var.msftmigration
}