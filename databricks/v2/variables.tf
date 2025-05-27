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

#databricks vars
variable "db_sku" {
  description = "The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial."
  type        = string
  default     = "premium"
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

variable "mgmt-public-snet_name" {
  description = "name of the databricks mgmnt subnet"
  type        = string
}

variable "int-private-snet_name" {
  description = "name of the databricks internal subnet"
  type        = string
}

variable "mgmt_address_prefixes" {
  description = "prefix for the public subnet"
  type        = list(string)
}

variable "int_address_prefixes" {
  description = "prefix for the private subnet"
  type        = list(string)
}

variable "pe_subnet_name" {
  description = "subnet name for private endpoint subnet"
  type        = string
}

variable "machine_learning_workspace_id" {
  description = "machine learning workspace ID if applicable"
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

variable "mgmt_sub_id" {
  description = "the mgmt subcription id for where the private dns zones reside"
  default     = "000bdcc8-114c-418a-ad9d-a1ac486ac658"
}

variable "tenant_id" {
  description = "tenant id where the subscription to deploy the aks cluster is"
  default     = "72b17115-9915-42c0-9f1b-4f98e5a4bcd2"
}


