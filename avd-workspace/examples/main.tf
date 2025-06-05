module "avd-workspace-example" {
  source        = "../"
  workspaces    = var.workspaces
  app_id        = var.app_id
  msftmigration = var.msftmigration
  environment   = var.environment
}
