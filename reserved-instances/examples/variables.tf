variable "appname" {
  description = "The name of the application."
  type        = string
}

variable "env" {
  description = "The environment (e.g., dev, prod)."
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}

variable "billing_plan" {
  description = "The billing plan for the reservation order."
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
  description = "The instance flexibility for the reservation order."
  type        = string
}

variable "reserved_resource_type" {
  description = "The reserved resource type for the reservation order."
  type        = string
}

variable "term" {
  description = "The term for the reservation order."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the reservation order."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID."
  type        = string
}
