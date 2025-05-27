# Naming and Tags #
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

variable "sql_server_version" {
  description = "This for sql server version"
  type        = string
}

variable "private_dns_zone_ids" {
  description = "id of the private dns zone"
  type        = string
}

variable "subnet_id" {
  description = "subnet id to deploy the PE to"
  type        = string
}

variable "ad_grp_sql_admin_name" {
  description = "The login username of the Azure AD Administrator of this SQL Server."
  type        = string
}

variable "ad_grp_sql_admin_id" {
  description = "The object id of the Azure AD Administrator of this SQL Server."
  type        = string
}

variable "administrator_login" {
  description = "Specifies the name of the local administrator account."
  type        = string
}

variable "key_vault_name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unique. If the vault is in a recoverable state then the vault will need to be purged before reusing the name."
  type        = string
}

variable "key_vault_resource_group_name" {
  description = "The resource group name of the key vault where the customer managed key is stored"
  type        = string
}