variable "shared_image_config" {
  description = "Configuration for the azurerm_shared_image resource."
  type = map(object({
    name                        = string
    gallery_name                = string
    gallery_resource_group_name = string
    resource_group_name         = string
    location                    = string
    os_type                     = string
    identifier = object({
      offer     = string
      publisher = string
      sku       = string
    })

    purchase_plan = optional(object({
      name      = string
      publisher = optional(string)
      product   = optional(string)
    }), null)

    description                         = optional(string)
    disk_types_not_allowed              = optional(list(string), [])
    end_of_life_date                    = optional(string)
    eula                                = optional(string)
    specialized                         = optional(bool)
    architecture                        = optional(string, "x64")
    hyper_v_generation                  = optional(string, "V1")
    max_recommended_vcpu_count          = optional(number)
    min_recommended_vcpu_count          = optional(number)
    max_recommended_memory_in_gb        = optional(number)
    min_recommended_memory_in_gb        = optional(number)
    privacy_statement_uri               = optional(string)
    release_note_uri                    = optional(string)
    trusted_launch_supported            = optional(bool)
    trusted_launch_enabled              = optional(bool)
    confidential_vm_supported           = optional(bool)
    confidential_vm_enabled             = optional(bool)
    accelerated_network_support_enabled = optional(bool)
    tags                                = optional(map(string), {})
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
