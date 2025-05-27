
# This is required for most resource modules

variable "location" {
  type        = string
  description = "The Azure region where the resources should be deployed."
  nullable    = false
}

variable "subscription_id" {
  type        = string
  description = "The Subscription ID"
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

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
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

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
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


variable "costRegion" {
  description = "region"
  type        = string
  default     = ""
}