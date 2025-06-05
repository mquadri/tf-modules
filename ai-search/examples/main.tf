module "ai-search" {
  source         = "../"
  search_service = var.search_service

  # Pass mandatory tags directly
  app_id        = var.app_id
  environment   = var.environment
  msftmigration = var.msftmigration
  mal_id        = var.mal_id    # Added mal_id

  # Pass general custom tags
  tags = var.tags # Added general tags
}