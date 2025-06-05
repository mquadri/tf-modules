variable "natgateways" {
  description = <<DESCRIPTION
Map of NAT Gateway configurations. Each key represents a unique NAT Gateway identifier, and the value contains the configuration details for the NAT Gateway.
DESCRIPTION
  type = map(object({
    location                = string
    name                    = string
    resource_group_name     = string
    enable_telemetry        = optional(bool, true)
    idle_timeout_in_minutes = optional(number, null)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    public_ip_configuration = optional(object({
      allocation_method       = optional(string, "Static")
      ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
      ddos_protection_plan_id = optional(string)
      domain_name_label       = optional(string)
      idle_timeout_in_minutes = optional(number, 30)
      inherit_tags            = optional(bool, false)
      ip_version              = optional(string, "IPv4")
      lock_level              = optional(string, null)
      sku                     = optional(string, "Standard")
      sku_tier                = optional(string, "Regional")
      tags                    = optional(map(string), null)
      zones                   = optional(list(string), ["1", "2", "3"])
      }), {
      allocation_method       = "Static"
      ddos_protection_mode    = "VirtualNetworkInherited"
      idle_timeout_in_minutes = 30
      ip_version              = "IPv4"
      sku                     = "Standard"
      sku_tier                = "Regional"
      zones                   = ["1", "2", "3"]
    })
    public_ip_prefix_length = optional(number, 0)
    public_ips = optional(map(object({
      name = string
    })), {})
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    sku_name = optional(string, null)
    subnet_associations = optional(map(object({
      resource_id = string
    })), {})
    tags = optional(map(string), null)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), null)
    zones = optional(set(string), null)
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
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}
