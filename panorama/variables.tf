variable "panorama_instances" {
  description = "Map of Panorama instances, each with unique configurations."
  type = map(object({
    name                = string
    resource_group_name = string
    region              = string
    tags                = optional(map(any))
    authentication = object({
      username                        = optional(string, "panadmin")
      disable_password_authentication = optional(bool, true)
      ssh_keys                        = optional(list(string), [])
    })
    image = object({
      version                 = optional(string)
      publisher               = optional(string, "paloaltonetworks")
      offer                   = optional(string, "panorama")
      sku                     = optional(string, "byol")
      enable_marketplace_plan = optional(bool, true)
      custom_id               = optional(string)
    })
    virtual_machine = object({
      size                          = optional(string, "Standard_D5_v2")
      zone                          = string
      disk_type                     = optional(string, "StandardSSD_LRS")
      disk_name                     = string
      avset_id                      = optional(string)
      capacity_reservation_group_id = optional(string)
      allow_extension_operations    = optional(bool, false)
      encryption_at_host_enabled    = optional(bool, false)
      disk_encryption_set_id        = optional(string)
      enable_boot_diagnostics       = optional(bool, false)
      boot_diagnostics_storage_uri  = optional(string)
      identity_type                 = optional(string, "SystemAssigned")
      identity_ids                  = optional(list(string), [])
    })
    interfaces = list(object({
      name                          = string
      subnet_id                     = string
      private_ip_address            = optional(string)
      create_public_ip              = optional(bool, false)
      public_ip_name                = optional(string)
      public_ip_resource_group_name = optional(string)
      public_ip_id                  = optional(string)
    }))
    logging_disks = optional(map(object({
      name      = string
      size      = optional(string, "2048")
      lun       = string
      disk_type = optional(string, "StandardSSD_LRS")
    })))
    key_vault_name           = string
    key_vault_resource_group = string
  }))
}

variable "subscription_id" {
  description = "subcription id for panorama"
  type        = string
}

variable "kv_sub_id" {
  description = "subcription id for kv"
  type        = string
}

variable "tenant_id" {
  description = "tenant id for kv"
  type        = string
}

# Secret Content Type (optional)
variable "secret_content_type" {
  description = "A description of the content type of the secret, such as a password, connection string, etc."
  type        = string
  default     = null
}

# Tags for the secret (optional)
variable "secret_tags" {
  description = "A map of tags to assign to the secret."
  type        = map(string)
  default     = {}
}

# Expiration Date (optional)
variable "secret_expiration_date" {
  description = "The expiration date of the secret in ISO 8601 format (e.g., 2025-12-31T23:59:59Z)."
  type        = string
  default     = null
}

# Not Before Date (optional)
variable "secret_not_before_date" {
  description = "The date before which the secret will not be active, in ISO 8601 format."
  type        = string
  default     = null
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


