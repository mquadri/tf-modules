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
  default     = ""
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
variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
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
