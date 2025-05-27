module "ai-search" {
  source         = "../"
  search_service = var.search_service
  app_id            = var.app_id
  msftmigration     = var.msftmigration
  environment       = var.environment
}