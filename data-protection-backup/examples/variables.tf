variable "backup_vault_config" {
  type = object({
    vault_name = string
    resource_group_name = string
    location = string
    redundancy = string
    datastore_type = string
    managed_identity_type = string # Only expects "SystemAssigned as of now"
    #cross_region_restore_enabled = optional(bool)
    tags = optional(map(string), {})
  })
}

variable "vault_policies" {
  type = map(object({
    backup_policy_name = string
    operational_default_retention_duration = optional(string)
    vault_default_retention_duration = optional(string)
    default_backup_repeating_time_interval = optional(string)
    retention_rules = optional(list(object({
       name = string
       absolute_criteria = string
       priority = number
       duration = string
       datastore_type = string
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
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX","NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}
