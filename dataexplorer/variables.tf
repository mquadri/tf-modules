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

variable "resource_group_name" {
  description = "Resource group name for where databrocks will be deployed"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "resource group name where to deploy Databricks"
  type        = string
}

variable "vnet_name" {
  description = "name of the vnet to deploy databricks to"
  type        = string
}

variable "int_address_prefixes" {
  description = "prefix for the private subnet"
  type        = list(string)
}

variable "pe_subnet_name" {
  description = "subnet name for private endpoint subnet"
  type        = string
}

variable "private_dns_zone_name" {
  description = "private dns zone name to add a record to."
  type        = string
  default     = "privatelink.azuredatabricks.net"
}

variable "private_dns_rg" {
  description = "private dns zone resource group"
  type        = string
  default     = "rg-dns_infrastructure"
}

variable "workspace_cname" {
  description = "workspace dns cname"
  type        = string
}

variable "zones" {
  description = "availability zones"
  type        = list(string)
  default     = ["1"]
}

variable "user_identities" {
  description = "user identities"
  type        = list(string)
}

variable "sku_name" {
  description = "sku name"
  type        = string
  default     = "Dev(No SLA)_Standard_E2a_v4"
}

variable "capacity" {
  description = "capacity"
  type        = number
}

variable "optimized_auto_scale" {
  description = "optimized auto scale block "
  type = object({
    minimum = number
    maximum = number
  })
  default = null
}

variable "auto_stop_enabled" {
  description = "auto stop enabled"
  type        = bool
  default     = true
}

variable "streaming_ingestion_enabled" {
  description = "streaming ingestion enabled"
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "public network access enabled"
  type        = bool
  default     = false
}

variable "double_encryption_enabled" {
  description = "double encryption enabled"
  type        = bool
  default     = true
}