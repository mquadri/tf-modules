output "id" {
  description = "The alias ID of the subscription"
  value       = azurerm_subscription.subscription.id
}

output "subscription_id" {
  description = "The subscription ID"
  value       = azurerm_subscription.subscription.subscription_id
}

output "billing_scope_id" {
  description = "The billing scope ID"
  value       = azurerm_subscription.subscription.billing_scope_id
}

output "subscription_name" {
  description = "The subscription name"
  value       = azurerm_subscription.subscription.subscription_name
}

output "subscription" {
  description = "The subscription object"
  value       = azurerm_subscription.subscription
}