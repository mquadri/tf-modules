output "activity_log_alert" {
  description = "The created activity_log_alert."
  value       = { for k, v in azurerm_monitor_activity_log_alert.activity_log_alert : k => v.id }
}