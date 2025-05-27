variable "location" {
  description = "The location of the reservation order."
  type        = string
}

variable "parent_id" {
  description = "The ID of the azure resource in which this resource is created."
  type        = string
  default     = null
}

variable "applied_scopes" {
  description = "List of the scopes that the benefit will be applied."
  type        = list(string)
  default     = null
}

variable "applied_scope_type" {
  description = "The applied scope type for the reservation order. (Single/Shared)"
  type        = string
  default     = "Single"
}

variable "billing_plan" {
  description = "The billing plan for the reservation order. (Monthly/Upfront)"
  type        = string
}

variable "display_name" {
  description = "The display name for the reservation order."
  type        = string
}

variable "quantity" {
  description = "The quantity for the reservation order."
  type        = number
}

variable "renew" {
  description = "Whether to renew the reservation order."
  type        = bool
}

variable "instance_flexibility" {
  description = "Turning this on will apply the reservation discount to other VMs in the same VM size group. Only specify for VirtualMachines reserved resource type.(On/Off)"
  type        = string
}

variable "reserved_resource_type" {
  description = "The reserved resource type for the reservation order."
  type        = string
}

variable "term" {
  description = "The term for the reservation order.(P1Y/P3Y/P5Y)"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the reservation order."
  type        = string
}

variable "resourcetype" {
  description = "The type of the resource."
  type        = string
  default     = "ri"
}

variable "appname" {
  description = "The name of the application."
  type        = string
}

variable "env" {
  description = "The environment (e.g., dev, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "subscription_id" {
  description = "The ID of the subscription."
  type        = string
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
  default     = "01"
}