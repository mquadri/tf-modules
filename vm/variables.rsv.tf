# ## Backup

variable "recovery_vault_name" {
  type        = string
  description = "(Optional) - The name of the recovery services vault if exist"
  default     = ""
  nullable    = false
}

resource "validation_warning" "recovery_vault_name" {
  condition = var.recovery_vault_name != null
  summary   = "WARNING: Deprecation Notice, recovery_vault_name is not loger used, please remove this variable from your configuration"
}

# module variables
variable "recovery_create_resource_group" {
  description = "Set this to true if a new RG is required."
  type        = bool
  default     = false
}

variable "recovery_resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = null
  type        = string
}

variable "recovery_rg_role_assignments" {
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default     = {}
  description = "The role assignment to be assigned to the resource group"
  nullable    = false

  validation {
    condition = alltrue(
      [for role in var.recovery_rg_role_assignments :
        can(regex("^/providers/Microsoft\\.Authorization/roleDefinitions/[0-9a-fA-F-]+$", role.role_definition_id_or_name))
        ||
        can(regex("^[[:alpha:]]+?", role.role_definition_id_or_name))
      ]
    )
    error_message = <<ERROR_MESSAGE
        role_definition_id_or_name must have the following format: 
         - Using the role definition Id : `/providers/Microsoft.Authorization/roleDefinitions/<role_guid>`
         - Using the role name: Reader | "Storage Blob Data Reader"
      ERROR_MESSAGE 
  }
}

variable "recovery_lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  default     = null
  description = <<DESCRIPTION
  Controls the Resource Lock configuration for this resource. The following properties can be specified:
  
  - `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
  - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.
  DESCRIPTION

  validation {
    condition     = var.recovery_lock != null ? contains(["CanNotDelete", "ReadOnly"], var.recovery_lock.kind) : true
    error_message = "Lock kind must be either `\"CanNotDelete\"` or `\"ReadOnly\"`."
  }
}

variable "recovery_location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = null
  type        = string
}

###############################
# Azure Recovery Vault variables
###############################
variable "recovery_services_vault_name" {
  description = "Name of the Recovery Services Vault to be created"
  type        = string
  default     = null
}

variable "recovery_vault_sku" {
  description = "Azure Recovery Vault SKU. Possible values include: `Standard`, `RS0`. Default to `Standard`."
  type        = string
  default     = "Standard"
}

variable "recovery_vault_storage_mode_type" {
  description = "The storage type of the Recovery Services Vault. Possible values are `GeoRedundant`, `LocallyRedundant` and `ZoneRedundant`. Defaults to `GeoRedundant`."
  type        = string
  default     = "LocallyRedundant"
}

variable "recovery_vault_cross_region_restore_enabled" {
  description = "Is cross region restore enabled for this Vault? Only can be `true`, when `storage_mode_type` is `GeoRedundant`. Defaults to `false`."
  type        = bool
  default     = false
}

variable "recovery_vault_soft_delete_enabled" {
  description = "Is soft delete enable for this Vault? Defaults to `true`."
  type        = bool
  default     = true
}

variable "recovery_vault_immutability" {
  description = "Immutability Settings of vault, possible values include: Locked, Unlocked and Disabled."
  default     = "Disabled"
  type        = string
}

variable "recovery_enable_encryption" {
  type        = bool
  default     = false
  description = "Variable to define if encryption in recovery vault should be enabled or not"
}

variable "recovery_vault_identity_type" {
  description = "Azure Recovery Vault identity type. Possible values include: `null`, `SystemAssigned`. Default to `SystemAssigned`."
  type        = string
  default     = null
}

##############################################
# Private Endpoint for Recovery Services Vault
##############################################
variable "recovery_enable_private_endpoint" {
  type        = bool
  default     = false
  description = "Variable to define if private endpoint should be enabled or not"
}

variable "recovery_subscription_id" {
  type        = string
  description = "The Subscription ID"
  default     = null
}

variable "recovery_pe_subnet_name" {
  type        = string
  description = "The Subnet name attached to private endpoint"
  default     = null
}

variable "recovery_virtual_network_name" {
  type        = string
  description = "The VNET name attached to private endpoint"
  default     = null
}

variable "recovery_virtual_network_rg" {
  type        = string
  description = "The VNET RG name attached to private endpoint"
  default     = null
}

variable "recovery_vm_backup_policies" {
  description = "A list of backup policies for VMs."
  type = map(object({
    name                           = string
    policy_type                    = string
    timezone                       = string
    instant_restore_retention_days = optional(number)
    frequency                      = string
    time                           = string
    hour_interval                  = optional(number)
    hour_duration                  = optional(number)
    weekdays                       = optional(set(string))
    daily = optional(list(object({
      count = number
    })), [])
    weekly = optional(list(object({
      count    = number
      weekdays = optional(set(string))
    })), [])
    monthly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
    yearly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      months            = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
  }))
  default = {}
}

variable "file_share_backup_policies" {
  description = "A list of backup policies for file shares."
  type = map(object({
    name      = string
    timezone  = string
    frequency = string
    time      = string
    daily = optional(list(object({
      count = number
    })), [])
    weekly = optional(list(object({
      count    = number
      weekdays = set(string)
    })), [])
    monthly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
    yearly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      months            = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
  }))
  default = {}
}



variable "recovery_key_vault_key_name" {
  default     = null
  type        = string
  description = "Provide Keyvault key name"
}

variable "recovery_key_vault_name" {
  default     = null
  type        = string
  description = "Provide Keyvault name"
}

variable "recovery_key_vault_rg_name" {
  default     = null
  type        = string
  description = "Provide Keyvault RG name"
}

variable "infrastructure_encryption_enabled" {
  default     = false
  type        = bool
  description = "Choose if infra encryption should be enabled"
}

variable "recovery_kv_role_definition" {
  type    = string
  default = "Key Vault Crypto Service Encryption User"
}

variable "user_assigned_identity_rg_name" {
  default     = null
  type        = string
  description = "Provide existing user assigned identity RG name"
}

variable "existing_user_assigned_identity_name" {
  default     = null
  type        = string
  description = "Provide existing user assigned identity name"
}

variable "recovery_vault_public_access_enabled" {
  default     = false
  type        = bool
  description = "Choose if Recovery vault public access should be enabled"
}

variable "recovery_private_endpoints" {
  type = map(object({
    name                           = string
    private_connection_resource_id = string
    is_manual_connection           = optional(bool)
    subresource_names              = list(string)
    request_message                = optional(string)
    private_dns_zone_group_name    = optional(string)
    private_dns_zone_ids           = optional(list(string))
  }))
  description = "Private Endpoints for the supported resources"
  default     = {}
}

variable "recovery_domain_name" {
  type        = string
  description = "The name of the private dns zone."
  default     = null
}

variable "recovery_a_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a A record."
}

variable "recovery_aaaa_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a AAAA record."
}

variable "recovery_cname_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    record              = string
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a CNAME record."
}

variable "recovery_enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see https://aka.ms/avm/telemetryinfo.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "recovery_mx_records" {
  type = map(object({
    name                = optional(string, "@")
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      preference = number
      exchange   = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a MX record."
}

variable "recovery_ptr_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a PTR record."
}

variable "recovery_soa_record" {
  type = object({
    email        = string
    expire_time  = optional(number, 2419200)
    minimum_ttl  = optional(number, 10)
    refresh_time = optional(number, 3600)
    retry_time   = optional(number, 300)
    ttl          = optional(number, 3600)
    tags         = optional(map(string), null)
  })
  default     = null
  description = "optional soa_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com"
}

variable "recovery_srv_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      priority = number
      weight   = number
      port     = number
      target   = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a SRV record."
}

variable "recovery_tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource."
}

variable "recovery_txt_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      value = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a TXT record."
}

variable "recovery_virtual_network_links" {
  type = map(object({
    vnetlinkname     = string
    vnetid           = string
    autoregistration = optional(bool, false)
    tags             = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a virtual network link."
}

variable "recovery_dns_zone_id" {
  description = "The ID of the DNS zone if provided by the user"
  type        = string
  default     = ""
}

variable "recovery_create_dns_zone" {
  description = "choose if DNS zone should be created or not"
  type        = bool
  default     = false
}


##############################################
# Diagnostics settings for Recovery Services Vault
##############################################

variable "recovery_enable_diagnostic_setting" {
  type        = bool
  default     = true
  description = "Choose if Diagnostic setting should be enabled"
}

variable "recovery_diagnostics_settings_name" {
  type        = string
  description = "The diagnostics setting name of the resource on."
  default     = null
}

variable "recovery_log_categories" {
  type        = list(string)
  default     = null
  description = "List of log categories. Defaults to all available."
}

variable "recovery_excluded_log_categories" {
  type        = list(string)
  default     = []
  description = "List of log categories to exclude."
}

variable "recovery_metric_categories" {
  type        = list(string)
  default     = null
  description = "List of metric categories. Defaults to all available."
}

variable "recovery_logs_destinations_ids" {
  type        = list(string)
  nullable    = false
  default     = [""]
  description = <<EOD
List of destination resources IDs for logs diagnostic destination.
Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.
If you want to use Azure EventHub as destination, you must provide a formatted string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character.
EOD
}

variable "recovery_log_analytics_destination_type" {
  type        = string
  default     = "AzureDiagnostics"
  description = "When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
}

variable "create_recovery_vault" {
  description = "Set this to true if a new RG is required."
  type        = bool
  default     = false
}
