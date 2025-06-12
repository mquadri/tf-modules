module "vnet-logs" {
  source = "../"

  flow_logs     = var.flow_logs
  environment   = var.environment
  app_id        = var.app_id
  msftmigration = var.msftmigration
}