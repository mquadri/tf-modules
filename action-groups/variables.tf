variable "key_vault_name" {
  description = "Name of the vault where you put the PagerDuty key"
  type        = string
  default     = ""
}

variable "key_vault_rg_name" {
  description = "The resource group associated with the vault"
  type        = string
  default     = ""
}


variable "action_groups" {
  type = map(object({
    name                = string
    short_name          = string
    resource_group_name = string
    enabled             = optional(bool)
    location            = optional(string) # Audit: Clarify location default (global if not specified by Azure)
    tags                = optional(map(string))
    webhook_receivers = optional(list(object({
      name                    = string
      service_uri             = optional(string)
      key_vault_secret_id     = optional(string)
      use_common_alert_schema = optional(bool, true)
      aad_auth = optional(object({
        object_id      = string
        identifier_uri = optional(string)
        tenant_id      = optional(string)
      }))
    })))

    email_receivers = optional(list(object({
      name                    = string
      email_address           = string
      use_common_alert_schema = optional(bool, true)
    })))

    sms_receivers = optional(list(object({
      name         = string
      country_code = string
      phone_number = string
    })))

    voice_receivers = optional(list(object({
      name         = string
      country_code = string
      phone_number = string
    })))

    azure_function_receivers = optional(list(object({
      name                     = string
      function_app_resource_id = string
      function_name            = string
      http_trigger_url         = string
      use_common_alert_schema  = optional(bool, true)
    })))

    logic_app_receivers = optional(list(object({
      name                    = string
      resource_id             = string
      callback_url            = string
      use_common_alert_schema = optional(bool, true)
    })))

    event_hub_receivers = optional(list(object({
      name                    = string
      event_hub_namespace     = optional(string)
      event_hub_name          = optional(string)
      subscription_id         = optional(string)
      tenant_id               = optional(string)
      use_common_alert_schema = optional(bool, true)
    })))

    itsm_receivers = optional(list(object({
      name                 = string
      workspace_id         = string
      connection_id        = string
      ticket_configuration = string
      region               = string
    })))

    arm_role_receivers = optional(list(object({
      name                    = string
      role_id                 = string
      use_common_alert_schema = optional(bool, true)
    })))

    automation_runbook_receivers = optional(list(object({
      name                    = string
      automation_account_id   = string
      runbook_name            = string
      webhook_resource_id     = string
      is_global_runbook       = bool
      service_uri             = string
      use_common_alert_schema = optional(bool, true)
    })))

    azure_app_push_receivers = optional(list(object({
      name          = string
      email_address = string
    })))

  }))

  default = {}
  validation {
    condition = alltrue([
      for k, v in var.action_groups : v.name != null && v.short_name != null
    ])
    error_message = "Each action group must have a 'name' and 'short_name' defined."
  }
}

#tag variables

variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD", "QA", "STAGE", "PROD-DR"], upper(var.environment))
    error_message = "The environment must be one of the allowed values: PROD, TEST, DEV, SANDBOX, NON-PROD, QA, STAGE, PROD-DR (case-insensitive)."
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
  default     = null # Allowing null if not always applicable
}

variable "mal_id" {
  description = "The MAL ID for tagging purposes. This is a mandatory tag for Lumen resources."
  type        = string
  # No default to make it effectively required at the root module level.
  # The locals block in main.tf will ensure it's applied.
}

variable "tags" {
  description = "A map of additional custom tags to apply to the Action Group resources."
  type        = map(string)
  default     = {}
}
