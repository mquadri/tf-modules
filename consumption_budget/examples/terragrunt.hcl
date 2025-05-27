input {
    action_groups_resource_group = "rg-budget-alert"
    actions_groups_name = "budget-alert-action-group"
    budget_name = "monthly-budget"
    start_date = "2024-01-01"
    budget_amount = 10000
    budget_notification = [
    {
      operator       = "GreaterThan"
      threshold      = 80
      contact_emails = ["user1@example.com", "user2@example.com"]
    },
    {
      operator       = "GreaterThan"
      threshold      = 100
      contact_emails = ["user3@example.com"]
    }
  ]
}