variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
  nullable    = false
  default     = "01"
}

variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}
variable "appFunction" {
  description = "app function"
  type        = string
  default     = null
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
  default     = null
}

variable "billing_account_name" {
  type        = string
  description = "The ID of the billing account."
  default     = "78358115"
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = null
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = null
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = null
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = null
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

variable "costDivision" {
  description = "cost division"
  type        = string
  default     = null
}

variable "costRegion" {
  description = "region where the resources are deployed"
  type        = string
  default     = null
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = null
}

variable "enrollment_account_name" {
  type        = string
  description = "The ID of the enrollment account."
  default     = "222349"
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = "nonprod"
  validation {
    condition     = contains(["nonprod", "prod", "sandbox"], var.env)
    error_message = "The environment must be one of the following values: nonprod, prod, sandbox."
  }
}
variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
  validation {
    condition     = (var.environment == null ? true : false || contains(["nonprod", "prod", "sandbox"], var.environment))
    error_message = "The environment must be one of the following values: nonprod, prod, sandbox."
  }
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "NA"
}

variable "management_group_name" {
  type        = string
  description = "The name of the management group to associate the subscription with."
}

variable "migration" {
  description = "Boolean value to know if the application was migrated."
  type        = string
  nullable    = false
  default     = "yes"
  validation {
    condition     = contains(["yes", "no"], var.migration)
    error_message = "The migration must be one of the following values: yes, no."
  }
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
  default     = null
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = "sub"
}

variable "subscription_alias" {
  type        = string
  description = "The alias of the subscription."
  default     = null
}

variable "subscription_id" {
  type        = string
  description = "The ID of the subscription if already exist"
  default     = ""
}

variable "subscription_name" {
  type        = string
  description = "The name of the subscription."
}


variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource."
}

## Naming and Tags ##
#subscription vars



resource "validation_warning" "appFunction" {
  condition = var.appFunction != null
  summary   = "WARNING: Deprecation Notice, appFunction is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "appid_2" {
  condition = var.appid != null
  summary   = "WARNING: Deprecation Notice, appid is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "appid" {
  condition = var.appid != null
  summary   = "WARNING: Deprecation Notice, appid is not longer used and has been moved to app_id as per fin ops requirements, please rename  this variable from your configuration"
}

resource "validation_warning" "costAllocation" {
  condition = var.costAllocation != null
  summary   = "WARNING: Deprecation Notice, costAllocation is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "costAppOwnerManager" {
  condition = var.costAppOwnerManager != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerManager is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "costAppOwnerTech" {
  condition = var.costAppOwnerTech != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerTech is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "costbaseline" {
  condition = var.costbaseline != null
  summary   = "WARNING: Deprecation Notice, costbaseline is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "costBudgetOwner" {
  condition = var.costBudgetOwner != null
  summary   = "WARNING: Deprecation Notice, costBudgetOwner is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "costCostCenter" {
  condition = var.costCostCenter != null
  summary   = "WARNING: Deprecation Notice, costCostCenter is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "costDivision" {
  condition = var.costDivision != null
  summary   = "WARNING: Deprecation Notice, costDivision is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "costVP" {
  condition = var.costVP != null
  summary   = "WARNING: Deprecation Notice, costVP is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "env" {
  condition = var.env != null
  summary   = "WARNING: Deprecation Notice, env is not longer used, please use environment instead"
}

resource "validation_warning" "monthlyBudget" {
  condition = var.monthlyBudget != null
  summary   = "WARNING: Deprecation Notice, monthlyBudget is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "location" {
  condition = var.location != null
  summary   = "WARNING: Deprecation Notice, location is not longer used as part of a subscription creation, please remove this variable from your configuration"

}

resource "validation_warning" "costRegion" {
  condition = var.costRegion != null
  summary   = "WARNING: Deprecation Notice, costRegion is not longer used as part of a subscription creation, please remove this variable from your configuration"
}