variable "resource_group_name" {
  description = "Name of the resource group where Azure Container Registry will be deployed. If `create_resource_group` is false, this resource group must already exist."
  type        = string
}

variable "location" {
  description = "The Azure region where the Azure Container Registry and associated resources will be deployed. Also used in the naming convention if `acr_name_override` is not set."
  type        = string
}

variable "acr_name_override" {
  description = "Optional. Specifies the name of the container registry. If not set, a name will be generated using resourcetype, appname, environment, location, and additionalcontext."
  type        = string
  default     = null
}

variable "create_resource_group" {
  description = "When set to true, a new resource group will be created. If false, `resource_group_name` must refer to an existing resource group."
  type        = bool
  default     = false
}

variable "sku" {
  description = "The SKU of the Azure Container Registry. Valid values are `Basic`, `Standard`, and `Premium`."
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "Valid values for SKU are Basic, Standard, and Premium."
  }
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled for the ACR. Defaults to `false`."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the ACR. Defaults to `false`."
  type        = bool
  default     = false
}

variable "anonymous_pull_enabled" {
  description = "Specifies whether anonymous pull is enabled. Only applicable to Premium SKU. Defaults to `false`."
  type        = bool
  default     = false
}

variable "export_policy_enabled" {
  description = "Specifies whether export policy is enabled. Defaults to `true`."
  type        = bool
  default     = true
}

variable "private_endpoints" {
  description = "A map of private endpoint configurations to create for the Azure Container Registry. See README for structure."
  type = map(object({
    private_dns_zone_resource_ids   = optional(list(string))
    name                            = string
    private_service_connection_name = string
    tags                            = optional(map(string), null)
    private_dns_zone_group_name     = string
    location                        = string
    resource_group_name             = string
    subnet_resource_id              = string
  }))
  default = {}
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create for the Azure Container Registry. See README for structure."
  type = map(object({
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
  default = {}
}

# Variables for naming convention if acr_name_override is not provided
variable "resourcetype" {
  description = "Resource type abbreviation for naming ACR if `acr_name_override` is not specified (e.g., 'acr')."
  type        = string
  default     = "acr"
}

variable "appname" {
  description = "Application name for naming ACR if `acr_name_override` is not specified."
  type        = string
  default     = "defaultapp"
}

variable "additionalcontext" {
  description = "Additional context for naming ACR if `acr_name_override` is not specified (e.g., '01', 'shared')."
  type        = string
  default     = "01"
}

# Mandatory Tagging Variables
variable "app_id" {
  description = "The Application ID (e.g., APP0001) for tagging purposes. This is a mandatory tag."
  type        = string
}

variable "environment" {
  description = "The environment (e.g., PROD, TEST, DEV) for tagging purposes. This is a mandatory tag. Also used in the naming convention if `acr_name_override` is not set."
  type        = string
  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of: PROD, TEST, DEV, SANDBOX, NON-PROD."
  }
}

variable "msftmigration" {
  description = "The Microsoft migration tag value. This is a mandatory tag."
  type        = string
}

variable "mal_id" {
  description = "The MAL ID for tagging purposes. This is a mandatory tag."
  type        = string
}

# Optional Additional Tags
variable "tags" {
  description = "A map of additional, user-defined tags to assign to resources. These are merged with mandatory tags."
  type        = map(string)
  default     = {}
}

# Geo-replications
variable "georeplications" {
  description = "A list of geo-replication configurations for the Container Registry (Premium SKU only)."
  type = list(object({
    location                  = string
    regional_endpoint_enabled = optional(bool, true)
    zone_redundancy_enabled   = optional(bool, true)
    tags                      = optional(map(any), null)
  }))
  default = []
}

# Feature flag variables
variable "enable_encryption" {
  description = "Enables encryption at rest for the container registry."
  type        = bool
  default     = false
}

variable "enable_retention_policy" {
  description = "Enables retention policy for the container registry."
  type        = bool
  default     = false
}

variable "enable_content_trust" {
  description = "Enables content trust for the container registry."
  type        = bool
  default     = false
}

variable "enable_network_rules" {
  description = "Enables network rules for the container registry."
  type        = bool
  default     = false
}

variable "enable_quarantine_policy" {
  description = "Enables quarantine policy for the container registry."
  type        = bool
  default     = false
}

variable "enable_encryption_with_key_vault" {
  description = "Enables encryption with Key Vault for the container registry."
  type        = bool
  default     = false
}

# Encryption configuration
variable "encryption_key_vault_key_id" {
  description = "The ID of the Key Vault key used for encryption."
  type        = string
  default     = null
}

variable "encryption_identity_client_id" {
  description = "The client ID of the identity used for encryption."
  type        = string
  default     = null
}

# Network rule set configuration
variable "network_rule_default_action" {
  description = "The default action when no network rule matches. Valid values are 'Allow' or 'Deny'."
  type        = string
  default     = "Deny"
  validation {
    condition     = contains(["Allow", "Deny"], var.network_rule_default_action)
    error_message = "Valid values for network_rule_default_action are 'Allow' or 'Deny'."
  }
}

variable "network_rule_ip_rules" {
  description = "List of IP CIDR blocks allowed to access the Container Registry."
  type = list(object({
    action   = string
    ip_range = string
  }))
  default = []
}

variable "network_rule_virtual_network_rules" {
  description = "List of virtual network subnet IDs allowed to access the Container Registry."
  type = list(object({
    action    = string
    subnet_id = string
  }))
  default = []
}

# Retention policy configuration
variable "retention_policy_days" {
  description = "The number of days to retain images for."
  type        = number
  default     = 7
  validation {
    condition     = var.retention_policy_days >= 0 && var.retention_policy_days <= 365
    error_message = "Retention policy days must be between 0 and 365."
  }
}

variable "mal_id" {
  description = "The MAL ID to be used by the ACR module."
  type        = string
  default     = ""
}