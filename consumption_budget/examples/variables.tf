variable "action_groups_resource_group" {
  description = "The Action Group resouse group to use for monitoring"
  type        = string
}
variable "action_groups_name" {
  description = "The Action Group name to use for monitoring"
  type        = string
}

variable "budget_name" {
  description = "Name of the budget alert"
  type        = string
}

variable "budget_amount" {
  description = "Monthly budget amount in USD"
  type        = number
}

variable "start_date" {
  description = "Start date for the budget"
  type        = string
}

variable "budget_notifications" {
  description = "List of budget notifications"
  type = list(object({
    operator       = string
    threshold      = number
    contact_emails = list(string)
  }))
}