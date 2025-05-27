## Naming and Tags ##
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
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

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
}

variable "costDivision" {
  description = "cost division"
  type        = string
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
}

variable "appFunction" {
  description = "app function"
  type        = string
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
}

##Expressroute vars
variable "exprrg" {
  description = "resource group for where the expressroute will be provisioned"
}

variable "ercserviceprovider" {
  description = "service provider for the expressroute"
  type        = string
}

variable "ercskutier" {
  description = "expressroute sku tier"
  type        = string
}

variable "ercskufamily" {
  description = "expressroute sku"
  type        = string
}

variable "iptype" {
  description = "Static or Dynamic for ip type"
  type        = string
}

variable "ipsku" {
  description = "Static or Dynamic for ip type"
  type        = string
  default     = "Standard"
}

variable "ercpeeringlocation" {
  description = "expressroute peering location"
  type        = string
}

variable "ercmbps" {
  description = "expressroute pipe size"
  type        = string
}

variable "zones" {
  description = "zones needed for public ips"
  type        = list(string)
}


