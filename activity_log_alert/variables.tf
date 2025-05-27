variable "activity_log_alert" {
  description = "A map of activity_log_alert configurations."
  type        = map(object({
    name                = string
    resource_group_name = string
    location            = string
    scopes              = list(string)
    category            = string
    enabled             = optional(bool, true)
    description         = optional(string, null)
    tags                = optional(map(string), {})

    # Criteria Block
    caller                 = optional(string, null)
    operation_name         = optional(string, null)
    resource_provider      = optional(string, null)
    resource_providers     = optional(list(string), [])
    resource_type          = optional(string, null)
    resource_types         = optional(list(string), [])
    resource_group         = optional(string, null)
    resource_groups        = optional(list(string), [])
    resource_id            = optional(string, null)
    resource_ids           = optional(list(string), [])
    level                  = optional(string, null)
    levels                 = optional(list(string), [])
    status                 = optional(string, null)
    statuses               = optional(list(string), [])
    sub_status             = optional(string, null)
    sub_statuses           = optional(list(string), [])
    recommendation_type    = optional(string, null)
    recommendation_category = optional(string, null)
    recommendation_impact  = optional(string, null)

    # Resource Health Block
    current  = optional(list(string), [])
    previous = optional(list(string), [])
    reason   = optional(list(string), [])

    # Service Health Block
    events    = optional(list(string), [])
    locations = optional(list(string), [])
    services  = optional(list(string), [])

    # Action Block
    action_group_ids   = optional(list(string), [])
    webhook_properties = optional(map(string), {})
  }))
}

variable "alert_criteria" {
  description = "Mapping of valid criteria categories for activity log alerts."
  type        = map(string)
  default = {
    administrative   = "Administrative"
    autoscale       = "Autoscale"
    policy          = "Policy"
    recommendation  = "Recommendation"
    resource_health = "ResourceHealth"
    security        = "Security"
    service_health  = "ServiceHealth"
  }
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
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX","NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}