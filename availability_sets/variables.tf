variable "availability_sets" {
  description = "Map of Availability Set configurations"
  type = map(object({
    name                         = string
    location                     = string
    resource_group_name          = string
    platform_fault_domain_count  = optional(number, 2)
    platform_update_domain_count = optional(number, 5)
    managed                      = optional(bool, true)
    proximity_placement_group_id = optional(string, "")
    tags                         = optional(map(string), {})
  }))
  default = {}
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
