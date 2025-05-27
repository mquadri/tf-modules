module "avd-scaling-plan" {
  source       = "../"
  scaling_plan = var.scaling_plan
  app_id            = var.app_id
  msftmigration     = var.msftmigration
  environment       = var.environment 
}