variable "subscription_id" {
  type        = string
  description = "The Subscription ID"
}

variable "public_ip" {
  description = "Public IP deployment variable"
  type = map(object({
    location                = string
    resource_group_name     = string
    name                    = string
    enable_telemetry        = optional(bool, true)
    zones                   = optional(set(number), [1, 2, 3])
    sku                     = string
    sku_tier                = optional(string, "Regional")
    ip_version              = optional(string, "IPv4")
    allocation_method       = string
    domain_name_label       = optional(string, null)
    reverse_fqdn            = optional(string, null)
    public_ip_prefix_id     = optional(string, null)
    idle_timeout_in_minutes = optional(number, 4)
    ip_tags                 = optional(map(string), {})
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string, null)
    edge_zone               = optional(string, null)
    tags                    = optional(map(any), null)
    lock = optional(object({
      name = optional(string, null)
      kind = optional(string, "None")
    }), {})
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})
    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), ["allLogs"])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
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