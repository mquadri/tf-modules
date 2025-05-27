#naming and tags
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

variable "pe_subnet_name" {
  description = "subnet name for private endpoint subnet"
  type        = string
}


# Synapse Workspace
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

variable "storage_data_lake_gen2_filesystem_id" {
  description = "The ID of the Data Lake Gen2 Filesystem to use for the Synapse Workspace."
  type        = string
}


# Synapse SQL Dedicated Pool
variable "syndp_sku_name" {
  description = "Specifies the SKU Name for this Synapse SQL Pool. Possible values are DW100c, DW200c, DW300c, DW400c, DW500c, DW1000c, DW1500c, DW2000c, DW2500c, DW3000c, DW5000c, DW6000c, DW7500c, DW10000c, DW15000c or DW30000c."
  type        = string
  default     = "DW100c"
}

# variable "syndp_create_mode" {
#   description = "Specifies how to create the SQL Pool. Valid values are: Default, Recovery or PointInTimeRestore. Must be Default to create a new database."
#   type        = string
#   default     = "Default"
# }

variable "syndp_storage_account_type" {
  description = "The storage account type that will be used to store backups for this Synapse SQL Pool. Possible values are LRS or GRS."
  type        = string
  default     = "GRS"
}



variable "private_dns_dev_zone_name" {
  description = "The name of the private dns zone to link to the synapse private endpoint for dev"
  type        = string
  default     = "privatelink.dev.azuresynapse.net"
}

variable "private_dns_sql_zone_name" {
  description = "The name of the private dns zone to link to the synapse private endpoint for sql"
  type        = string
  default     = "privatelink.sql.azuresynapse.net"
}

variable "private_dns_web_zone_name" {
  description = "The name of the private dns zone to link to the synapse private endpoint for web"
  type        = string
  default     = "privatelink.azuresynapse.net"
}

variable "private_dns_rg" {
  description = "The resource group name of the private dns zone to link to the synapse private endpoint"
  type        = string
}