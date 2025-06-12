module "availability_sets" {
  source = "../"

  availability_sets = var.availability_sets
  app_id            = var.app_id
  msftmigration     = var.msftmigration
  environment       = var.environment
}
