variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}


variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
}

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

variable "nsg_config" {
  description = "The configuration for the Network Security Group module"
  type = object({
    name                = string
    resource_group_name = string
    diagnostic_settings = optional(object({
      enabled           = bool
      categories        = list(string)
      retention_in_days = optional(number)
      workspace_id      = optional(string)
    }))
    enable_telemetry = optional(bool)
    lock             = optional(bool)
    role_assignments = optional(list(object({
      principal_id         = string
      role_definition_name = string
    })))
    tags = optional(map(string))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  })
}


variable "law_config" {
  description = "The configuration for the Log Analytics Workspace module"
  type = object({
    resource_group_name                      = string
    additional_identities                    = optional(list(string))
    monitor_private_link_scope               = optional(string)
    monitor_private_link_scoped_service_name = optional(string)
    local_authentication_disabled            = optional(bool)
    internet_ingestion_enabled               = optional(bool)
    internet_query_enabled                   = optional(bool)
    sku                                      = string
    retention_in_days                        = optional(number)
    private_endpoints = optional(list(object({
      name                        = string
      subnet_id                   = string
      private_dns_zone_ids        = list(string)
      private_dns_zone_group_name = string
      private_dns_zone_group_id   = string
    })))
    additionalcontext = optional(string)
  })


}

variable "key_vault_config" {
  description = "Configurations for the Application Key Vault"
  type = object({
    additionalcontext               = optional(string)
    resource_group_name             = string
    enabled_for_template_deployment = optional(bool)
    enabled_for_deployment          = optional(bool)
    sku_name                        = string
    soft_delete_enabled             = optional(bool)
    soft_delete_retention_days      = optional(number)
    pe_subnet_id                    = optional(string)
    private_dns_zone_ids            = optional(list(string))
    pe_location                     = optional(string)
    network_interface_name          = optional(string)
    rbac_enabled                    = optional(bool)
    access_policies = optional(list(object({
      tenant_id = string
      object_id = string
      permissions = object({
        keys         = list(string)
        secrets      = list(string)
        certificates = list(string)
        storage      = list(string)
      })
    })))
    existing_name = optional(string)
    diagnostic_settings = optional(object({
      enabled           = bool
      categories        = list(string)
      retention_in_days = optional(number)
      workspace_id      = optional(string)
    }))
    enable_telemetry = optional(bool)
    keys = optional(list(object({
      name       = string
      key_type   = string
      key_size   = optional(string)
      exportable = optional(bool)
      reuse_key  = optional(bool)
      key_ops    = optional(list(string))
      tags       = optional(map(string))
    })))
    network_role_assignments = optional(list(object({
      principal_id         = string
      role_definition_name = string
    })))
    role_assignments = optional(list(object({
      principal_id         = string
      role_definition_name = string
    })))
    secrets = optional(list(object({
      name         = string
      content_type = optional(string)
      value        = optional(string)
      tags         = optional(map(string))
      enabled      = optional(bool)
      not_before   = optional(string)
      expires      = optional(string)
      secret_attributes = optional(object({
        enabled    = optional(bool)
        not_before = optional(string)
        expires    = optional(string)
      }))
    })))
    secrets_value = optional(list(object({
      name       = string
      value      = string
      tags       = optional(map(string))
      enabled    = optional(bool)
      not_before = optional(string)
      expires    = optional(string)
      secret_attributes = optional(object({
        enabled    = optional(bool)
        not_before = optional(string)
        expires    = optional(string)
      }))
    })))
  })
}