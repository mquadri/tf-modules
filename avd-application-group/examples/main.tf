module "avd-app-group" {
  source             = "../"
  application_groups = var.application_groups
  app_id            = var.app_id
  msftmigration     = var.msftmigration
  environment       = var.environment 
}