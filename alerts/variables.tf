variable "metric_alerts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    scopes                   = list(string)
    description              = string
    enabled                  = optional(bool)
    auto_mitigate            = optional(bool)
    frequency                = optional(string)
    severity                 = optional(number)
    target_resource_type     = optional(string)
    target_resource_location = optional(string)
    window_size              = optional(string)
    actions_group_ids        = list(string)

    criteria = optional(map(object({
      metric_namespace = string
      metric_name      = string
      aggregation      = string
      operator         = string
      threshold        = string

      dimension = optional(map(object({
        name     = string
        operator = string
        values   = list(string)
      })))
    })))

    dynamic_criteria = optional(map(object({
      metric_namespace         = string
      metric_name              = string
      aggregation              = string
      operator                 = string
      alert_sensitivity        = string
      evaluation_total_count   = optional(number)
      evaluation_failure_count = optional(number)
      ignore_data_before       = optional(string)
      skip_metric_validation   = optional(bool)

      dimension = optional(map(object({
        name     = string
        operator = string
        values   = list(string)
      })))
    })))

    application_insights_web_test_location_availability_criteria = optional(list(object({
      web_test_id           = string
      component_id          = string
      failed_location_count = number
    })))

  }))
}

# tags

variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}
