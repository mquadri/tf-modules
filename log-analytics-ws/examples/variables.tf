
# This is required for most resource modules
variable "resource_group_name" {
  type        = string
  description = "The resource group where the resources will be deployed."
  nullable    = false
}

# variable "name" {
#   default     = null
#   type        = string
#   description = "The name of Log analytics workspace"
# }

variable "location" {
  type        = string
  description = "The Azure region where the resources should be deployed."
  nullable    = false
}

variable "create_resource_group" {
  description = "Set this to true if a new RG is required."
  type        = bool
  default     = false
}

variable "monitor_private_link_scoped_service_name" {
  type        = string
  default     = null
  description = "The name of the service to connect to the Monitor Private Link Scope."
}

variable "monitor_private_link_scope_name" {
  type        = string
  default     = null
  description = "The name of the Monitor Private Link Scope."
}

variable "private_dns_rg" {
  type        = string
  default     = null
  description = "The name of the RG in which the private dns zones are present."
}

variable "private_dns_zones_names" {
  description = "A list of private DNS zone names"
  type        = set(string)
  default     = null
}

variable "subscription_id" {
  type        = string
  description = "The Subscription ID"
}

variable "pe_subnet_name" {
  type        = string
  description = "The Subnet name attached to private endpoint"
}

variable "virtual_network_name" {
  type        = string
  description = "The VNET name attached to private endpoint"
}

variable "virtual_network_rg" {
  type        = string
  description = "The VNET RG name attached to private endpoint"
}

variable "log_analytics_workspace_local_authentication_disabled" {
  type        = bool
  default     = false
  description = "This variable is to enable/disable LAW local authentication"
}

variable "log_analytics_workspace_internet_ingestion_enabled" {
  type        = bool
  default     = false
  description = "This variable is to enable/disable LAW internet ingestion"
}

variable "log_analytics_workspace_internet_query_enabled" {
  type        = bool
  default     = false
  description = "This variable is to enable/disable LAW internet query"
}

variable "log_analytics_workspace_sku" {
  type        = string
  default     = null
  description = "The SKU for Log analytics workspace."
}

variable "log_analytics_workspace_retention_in_days" {
  type        = string
  default     = null
  description = "The Log analytics workspace retention in days"
}

variable "storage_account_name" {
  type        = string
  default     = null
  description = "The Storage account name."
}

variable "storage_account_rg_name" {
  type        = string
  default     = null
  description = "The Storage account RG name"
}

##############################################
# Diagnostics settings for Recovery Services Vault
##############################################

variable "enable_diagnostic_setting" {
  type        = bool
  default     = true
  description = "To define if Diagnostic setting should be enabled or not"
}

variable "diagnostics_settings_name" {
  type        = string
  description = "The diagnostics setting name of the resource on."
}

variable "log_categories" {
  type        = list(string)
  default     = null
  description = "List of log categories. Defaults to all available."
}

variable "excluded_log_categories" {
  type        = list(string)
  default     = []
  description = "List of log categories to exclude."
}

variable "metric_categories" {
  type        = list(string)
  default     = null
  description = "List of metric categories. Defaults to all available."
}

variable "log_analytics_destination_type" {
  type        = string
  default     = "AzureDiagnostics"
  description = "When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
}

variable "log_category_groups" {
  type        = list(string)
  default     = null
  description = "List of log categorie groups. Defaults to all available."
}


variable "excluded_log_category_groups" {
  type        = list(string)
  default     = []
  description = "List of log categorie groups to exclude."
}

# #tag variables


variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = ""
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
  default     = ""
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costcostcenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costvp" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costappownertech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costappownermanager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costbudgetowner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
  default     = ""
}

variable "costdivision" {
  description = "cost division"
  type        = string
  default     = ""
}

variable "costallocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = ""
}

variable "appfunction" {
  description = "app function"
  type        = string
  default     = ""
}

variable "monthlybudget" {
  description = "monthly budget"
  type        = string
  default     = ""
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = ""
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
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX","NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}