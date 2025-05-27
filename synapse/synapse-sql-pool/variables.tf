# Data Synapse Workspace
# variable "azurerm_synapse_workspace_name" {
#   description = "Specifies the name which should be used for this synapse Workspace. Changing this forces a new resource to be created."
# }

# variable "synapse_resource_group_name" {
#   description = "The resource group where the Synapse Workspace resides."
# }

# Synapse SQL Pool

variable "synapse_workspace_id" {
  description = "The ID of Synapse Workspace within which this Sql Pool should be created. Changing this forces a new Synapse Sql Pool to be created."
}

variable "azurerm_synapse_sql_pool_name" {
  description = "The name which should be used for this Synapse Sql Pool. Changing this forces a new synapse SqlPool to be created."
}

variable "sku_name" {
  description = "Specifies the SKU Name for this Synapse Sql Pool. Possible values are DW100c, DW200c, DW300c, DW400c, DW500c, DW1000c, DW1500c, DW2000c, DW2500c, DW3000c, DW5000c, DW6000c, DW7500c, DW10000c, DW15000c or DW30000c."
}

variable "create_mode" {
  description = "Specifies how to create the Sql Pool. Valid values are: Default, Recovery or PointInTimeRestore. Must be Default to create a new database. Defaults to Default."
  default     = "Default"
}

variable "data_encrypted" {
  description = "Is transparent data encryption enabled? Defaults to true."
  default     = true
}

variable "tags" {
}