variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX","NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD ?"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}


variable "dedicated_host_group_name" {
  description = "The name of the dedicated host group."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the resources."
  type        = string
}

variable "platform_fault_domain_count" {
  description = "The number of fault domains that the host group can span."
  type        = number
}

variable "automatic_placement_enabled" {
  description = "Specifies whether automatic placement is enabled."
  type        = bool
}

variable "zone" {
  description = "The zone of the dedicated host group."
  type        = string
}

variable "enable_telemetry" {
  description = "Specifies whether telemetry is enabled."
  type        = bool
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "dedicated_hosts" {
  description = "A map of dedicated hosts."
  type = map(object({
    name                    = string
    platform_fault_domain   = number
    sku_name                = string
    auto_replace_on_failure = bool
    license_type            = string
    tags                    = optional(map(string))
  }))
}


