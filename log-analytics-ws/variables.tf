variable "resource_group_name" {
  default = null
  type    = string
}

variable "location" {
  default = null
  type    = string
}

variable "additional_identities" {
  description = "A list of additional identities to assign to the Log Analytics workspace."
  type        = list(string)
  default     = null
}

variable "monitor_private_link_scope" {
  type = map(object({
    name        = optional(string)
    resource_id = string
  }))
  default     = {}
  description = <<DESCRIPTION
  
  DESCRIPTION
  nullable    = false
}

variable "monitor_private_link_scoped_service_name" {
  type        = string
  default     = null
  description = "The name of the service to connect to the Monitor Private Link Scope."
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


variable "private_endpoints" {
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
  description = "Private Endpoints for the supported resources"
  default     = {}
}


#tag variables:

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "resourcetype" {
  condition = var.resourcetype != null
  summary   = "WARNING: Deprecation Notice, resourcetype is not loger used, please remove this variable from your configuration"
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appid" {
  condition = var.appid != null
  summary   = "WARNING: Deprecation Notice, appid is not loger used, please remove this variable from your configuration"
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

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costCostCenter" {
  condition = var.costCostCenter != null
  summary   = "WARNING: Deprecation Notice, costCostCenter is not loger used, please remove this variable from your configuration"
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costVP" {
  condition = var.costVP != null
  summary   = "WARNING: Deprecation Notice, costVP is not loger used, please remove this variable from your configuration"
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerTech" {
  condition = var.costAppOwnerTech != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerTech is not loger used, please remove this variable from your configuration"
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerManager" {
  condition = var.costAppOwnerManager != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerManager is not loger used, please remove this variable from your configuration"
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costBudgetOwner" {
  condition = var.costBudgetOwner != null
  summary   = "WARNING: Deprecation Notice, costBudgetOwner is not loger used, please remove this variable from your configuration"
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costbaseline" {
  condition = var.costbaseline != null
  summary   = "WARNING: Deprecation Notice, costbaseline is not loger used, please remove this variable from your configuration"
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

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costdivision" {
  condition = var.costdivision != null
  summary   = "WARNING: Deprecation Notice, costdivision is not loger used, please remove this variable from your configuration"
}

variable "costallocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costallocation" {
  condition = var.costallocation != null
  summary   = "WARNING: Deprecation Notice, costallocation is not loger used, please remove this variable from your configuration"
}

variable "appfunction" {
  description = "app function"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appfunction" {
  condition = var.appfunction != null
  summary   = "WARNING: Deprecation Notice, appfunction is not loger used, please remove this variable from your configuration"
}

variable "monthlybudget" {
  description = "monthly budget"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "monthlybudget" {
  condition = var.monthlybudget != null
  summary   = "WARNING: Deprecation Notice, monthlybudget is not loger used, please remove this variable from your configuration"
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