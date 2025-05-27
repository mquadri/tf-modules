output "consumption_budget_id" {
  description = "The ID of the created consumption budget"
  value       = azurerm_consumption_budget_subscription.consumption_budget.id
}

output "consumption_budget_name" {
  description = "The name of the created consumption budget"
  value       = azurerm_consumption_budget_subscription.consumption_budget.name
}
