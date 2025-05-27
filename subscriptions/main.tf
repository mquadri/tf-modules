resource "azurerm_subscription" "subscription" {
  lifecycle {
    precondition {
      condition     = (var.app_id != null && var.app_id != "") || (var.appid != null && var.appid != "")
      error_message = "app_id or appid must be set"
    }
    precondition {
      condition     = (var.env != null && var.env != "") || (var.environment != null && var.environment != "")
      error_message = "env or environment must be set"
    }
  }
  subscription_name = local.subscription_name
  alias             = var.subscription_alias
  billing_scope_id  = var.subscription_id == "" ? data.azurerm_billing_enrollment_account_scope.scope.id : null
  tags              = local.tags
  subscription_id   = var.subscription_id == "" ? null : var.subscription_id
}

resource "azurerm_management_group_subscription_association" "mg_association" {
  management_group_id = data.azurerm_management_group.management_group.id
  subscription_id     = "subscriptions/${azurerm_subscription.subscription.subscription_id}"

  lifecycle {
    ignore_changes = [
      subscription_id
    ]
  }
}
