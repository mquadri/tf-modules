module "example-alerts" {
  source        = "../"
  metric_alerts = var.metric_alerts
  app_id            = var.app_id
  msftmigration     = var.msftmigration
  environment       = var.environment
}