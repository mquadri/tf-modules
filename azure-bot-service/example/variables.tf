# tflint-ignore: terraform_unused_declarations
variable "name" {
  description = "Name of the bot"
  type        = string
}

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

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = "ais"
}

variable "location" {
  description = "The location where the Azure Bot Service will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The rg where the Azure Bot Service will be created."
  type        = string
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Bot Service."
  type        = string
}

variable "microsoft_app_id" {
  description = "The Microsoft App ID for the Azure Bot Service."
  type        = string
}
# tflint-ignore: terraform_unused_declarations
variable "key_vault_rg_name" {
  description = "The resource group name for the key vault"
  type        = string
}
# tflint-ignore: terraform_unused_declarations
variable "storage_account_id" {
  description = "The ID of the storage account"
  type        = string
}
# tflint-ignore: terraform_unused_declarations
variable "key_vault_name" {
  description = "The name of the key vault"
  type        = string
}