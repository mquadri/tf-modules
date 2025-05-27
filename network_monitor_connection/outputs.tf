############################
######## Outputs ###########
############################

output "network_connection_monitor_id" {
  description = "The ID of the Network Connection Monitor."
  value       = azurerm_network_connection_monitor.this.id
}