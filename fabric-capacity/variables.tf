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
  default     = "fabc"
}

# Fabric capacity settigns
variable "resource_group_name" {
  description = "Resource group name for where Fabric capacity will be deployed"
  type        = string
}

variable "name" {
  type        = string
  default     = null
  description = "allow override of the Fabric capacity name"
  validation {
    condition     = var.name != null ? can(regex("^[a-z][a-z0-9]{3,63}$", var.name)) : true
    error_message = "The name must be between 3 and 63 characters long and can only contain lowercase letters and numbers."
  }
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Fabric capacity. Possible values are `F2`, `F4`, `F8`, `F16`, `F32`, `F64`, `F128`, `F256`, `F512`, `F1024`, `F2048`"
  default     = "F2"
}

variable "administration_members" {
  type        = list(string)
  description = "Microsoft Fabric capacity administration members that will manage the capacity. The capacity administrator must be a member user or a service principal in your AAD tenant."
}
