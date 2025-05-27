variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
}

variable "appFunction" {
  description = "app function"
  type        = string
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costDivision" {
  description = "cost division"
  type        = string
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = "ais"
}

# AI Studio settigns
variable "resource_group_name" {
  description = "Resource group name for where AI Studio will be deployed"
  type        = string
}

variable "key_vault_name" {
  type        = string
  description = "Name of the keyvault"
}

variable "key_vault_rg_name" {
  type        = string
  description = "Resource group name for key vault"
}

variable "storage_account_id" {
  description = "storage account"
  type        = string
}

variable "sku" {
  type        = string
  description = "The sku name of the Azure Analysis Services server to create. Choose from: B1, B2, D1, S0, S1, S2, S3, S4, S8, S9. Some skus are region specific. See https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-overview#availability-by-region"
  default     = "S0"
}


variable "subscription_id" {
  type    = string
  default = null
}
