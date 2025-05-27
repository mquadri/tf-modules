output "id" {
  value       = azurerm_cognitive_account.this.id
  description = "The ID of the Cognitive Service Account."
}

output "endpoint" {
  value       = azurerm_cognitive_account.this.endpoint
  description = "The endpoint used to connect to the Cognitive Service Account."
}

output "primary_access_key" {
  value       = azurerm_cognitive_account.this.primary_access_key
  description = "A primary access key which can be used to connect to the Cognitive Service Account."
}

output "secondary_access_key" {
  value       = azurerm_cognitive_account.this.secondary_access_key
  description = "The secondary access key which can be used to connect to the Cognitive Service Account."
}

output "resource" {
  value       = azurerm_cognitive_account.this
  description = "Resource configuration output for azure cognitive account"
}
