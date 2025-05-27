module "activity_log_alert" {
    source = ".."
    activity_log_alert     = var.activity_log_alert
    alert_criteria         = var.alert_criteria
    app_id            = var.app_id
    msftmigration     = var.msftmigration
    environment       = var.environment
}