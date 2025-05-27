output "bot_service_id" {
  description = "The ID of the Azure Bot Service."
  value       = azurerm_bot_service_azure_bot.this.id
}