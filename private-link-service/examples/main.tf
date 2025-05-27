module "private_link_services_example" {
  source                     = "../"
  resource_group_name        = var.resource_group_name
  private_link_services      = var.private_link_services
  private_link_services_tags = var.private_link_services_tags
  app_id                     = var.app_id
  environment                = var.environment
  msftmigration              = var.msftmigration
}