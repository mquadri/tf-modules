variable "storage_sync_services" {
  description = "A map of Storage Sync Services to create"
  type = map(object({
    resource_group_name     = string
    location                = string
    incoming_traffic_policy = optional(string, "AllowAllTraffic")
    tags                    = optional(map(string), {})
  }))
}

variable "storage_sync_groups" {
  description = "A map of Storage Sync Groups to create (optional)"
  type = map(object({
    name              = string
    storage_sync_name = string
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