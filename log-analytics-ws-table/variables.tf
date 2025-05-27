variable "log_analytics_workspace_table_name" {
  description = "The name of the Log Analytics Workspace Table."
  type        = string
}

# variable "resource_group_name" {
#   description = "The name of the resource group."
#   type        = string
# }

variable "log_analytics_workspace_id" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "log_analytics_workspace_table_retention_in_days" {
  description = "The retention period for the table."
  type        = number
}

variable "log_analytics_workspace_table_total_retention_in_days" {
  description = "The total retention period for the table."
  type        = number
}