variable "name" {
  description = "The name of the cost management export"
  type        = string
}

variable "subscription_id" {
  description = "The ID of the subscription"
  type        = string
}

variable "recurrence_type" {
  description = "How often the requested information will be exported. Valid values include Annually, Daily, Monthly, Weekly"
  type        = string
}

variable "recurrence_period_start_date" {
  description = "The start date of the recurrence period"
  type        = string
}

variable "recurrence_period_end_date" {
  description = "The end date of the recurrence period"
  type        = string
}

variable "container_id" {
  description = "The resource manager ID of the storage container"
  type        = string
}

variable "root_folder_path" {
  description = "The root folder path for the export data"
  type        = string
}

variable "type" {
  description = "The type of the query. Possible values are ActualCost, AmortizedCost and Usage"
  type        = string
}

variable "time_frame" {
  description = "The time frame for pulling data for the query. If custom, then a specific time period must be provided. Possible values include: WeekToDate, MonthToDate, BillingMonthToDate, TheLast7Days, TheLastMonth, TheLastBillingMonth, Custom"
  type        = string
}

variable "active" {
  description = "Whether the cost management export is active"
  type        = bool
  default     = true
}
