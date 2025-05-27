module "azure_budget_alert" {
  source = "../../consumption_budget"

  action_groups_name           = var.action_groups_name
  action_groups_resource_group = var.action_groups_resource_group
  budget_name                  = var.budget_name
  subscription_id              = "/subscriptions/xxxx-xxxx"
  budget_amount                = var.budget_amount
  start_date                   = var.start_date

  budget_notifications = var.budget_notifications
}