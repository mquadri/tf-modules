variable "log_analytics_workspace_name" {
  description = "The name of the resource group in which the resources will be created"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  default = ""
  type    = string
}

variable "appinsight_name" {
  description = "The name of the Application Insights resource."
  type        = string
}

variable "enable_telemetry" {
  description = "Enable telemetry"
  type        = bool
  default     = true
}
##############################################
# Diagnostics settings for AppInsights
##############################################

variable "enable_diagnostic_setting" {
  type        = bool
  default     = true
  description = "Choose if Diagnostic setting should be enabled"
}

variable "enable_private_link_scope" {
  type        = bool
  default     = false
  description = "Choose if private link scope should be enabled"
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

variable "monitor_private_link_scoped_service_name" {
  type        = string
  default     = null
  description = "The name of the service to connect to the Monitor Private Link Scope."
}
variable "monitor_private_link_scope" {
  type        = string
  default     = null
  description = "The name of the Monitor Private Link Scope."
}
variable "internet_ingestion_enabled" {
  description = "Enable internet ingestion for Application Insights"
  type        = bool
  default     = true
}
variable "local_authentication_disabled" {
  description = "Disable local authentication for Application Insights"
  type        = bool
  default     = false
}
variable "internet_query_enabled" {
  description = "Enable internet query for Application Insights"
  type        = bool
  default     = false
}
variable "location" {
  description = "The resource deployemnt location."
  type        = string
  default     = ""
}
variable "log_rg_name" {
  description = "The name of the resource group for the Log Analytics Workspace."
  type        = string
}
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

# tflint-ignore: terraform_required_providers
resource "validation_warning" "env" {
  condition = var.env != null
  summary   = "WARNING: Deprecation Notice, env is not loger used, please remove this variable from your configuration"
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costDivision" {
  description = "cost division"
  type        = string
  default     = ""
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = ""
}

variable "appFunction" {
  description = "app function"
  type        = string
  default     = ""
}

variable "monthlyBudget" {
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
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}
