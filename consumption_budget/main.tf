# Fetching Action Group
data "azurerm_monitor_action_group" "group" {
  name                = var.action_groups_name
  resource_group_name = var.action_groups_resource_group
}

# Create a Budget Alert for the subscription
resource "azurerm_consumption_budget_subscription" "consumption_budget" {
  name            = var.budget_name
  subscription_id = var.subscription_id
  amount          = var.budget_amount
  time_grain      = "Monthly"

  time_period {
    start_date = var.start_date
  }

  dynamic "notification" {
    for_each = var.budget_notifications
    content {
      enabled        = true
      operator       = notification.value.operator
      threshold      = notification.value.threshold
      contact_groups = [data.azurerm_monitor_action_group.group.id]
    }
  }
}