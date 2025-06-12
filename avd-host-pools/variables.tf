variable "avd_host_pools" {
  description = "Map of AVD host pool configurations."
  type = map(object({
    virtual_desktop_host_pool_name                  = string
    virtual_desktop_host_pool_location              = string
    virtual_desktop_host_pool_type                  = string
    virtual_desktop_host_pool_resource_group_name   = string
    virtual_desktop_host_pool_load_balancer_type    = string
    virtual_desktop_host_pool_custom_rdp_properties = optional(string, null)

    virtual_desktop_host_pool_vm_template = object({
      type = string
      custom_image = optional(object({
        resource_id = string
      }), null)
      gallery_image_reference = optional(object({
        offer     = string
        publisher = string
        sku       = string
        version   = string
      }), null)
      osDisktype = string
    })

    virtual_desktop_host_pool_scheduled_agent_updates = optional(object({
      enabled = optional(bool, false)
      schedule = optional(list(object({
        day_of_week = string
        hour_of_day = number
      })), [])
    }), null)

    virtual_desktop_host_pool_description                      = optional(string, null)
    virtual_desktop_host_pool_friendly_name                    = optional(string, null)
    virtual_desktop_host_pool_maximum_sessions_allowed         = optional(number, 0)
    virtual_desktop_host_pool_personal_desktop_assignment_type = optional(string, null)
    virtual_desktop_host_pool_preferred_app_group_type         = optional(string, null)
    virtual_desktop_host_pool_start_vm_on_connect              = optional(bool, false)
    virtual_desktop_host_pool_validate_environment             = optional(bool, false)
    virtual_desktop_host_pool_tags                             = optional(map(string), {})

    virtual_desktop_host_pool_timeouts = optional(object({
      create = optional(string, "60m")
      delete = optional(string, "60m")
      read   = optional(string, "5m")
      update = optional(string, "60m")
    }), null)

    # Nested existing variables inside the map of objects
    resource_group_name = string

    diagnostic_settings = map(object({
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
    }))

    enable_telemetry = bool

    lock = object({
      kind = string
      name = optional(string, null)
    })

    private_endpoints = map(object({
      name = optional(string, null)
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
      lock = optional(object({
        name = optional(string, null)
        kind = string
      }), null)
      tags                                    = optional(map(string), null)
      subnet_resource_id                      = string
      private_dns_zone_group_name             = optional(string, "default")
      private_dns_zone_resource_ids           = optional(set(string), [])
      application_security_group_associations = optional(map(string), {})
      private_service_connection_name         = optional(string, null)
      network_interface_name                  = optional(string, null)
      location                                = optional(string, null)
      resource_group_name                     = optional(string, null)
      ip_configurations = optional(map(object({
        name               = string
        private_ip_address = string
      })), {})
    }))

    registration_expiration_period = string

    role_assignments = map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    }))

    tags = optional(map(string), {})

    tracing_tags_enabled = bool
    tracing_tags_prefix  = string
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