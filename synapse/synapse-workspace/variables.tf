# Data Lake Variables


variable "azurerm_storage_account_data_lake_name" {
  description = "The data lake storage account name."
}

# Existing Continer in Data Lake that will host Synapse

variable "synapse_storage_container_name" {
  description = "The name of the Data Lake Gen2 File System which should be created within the Storage Account. Must be unique within the storage account the queue is located. Changing this forces a new resource to be created."
  default     = "synapsecontainer"
}

# Synapse Variables

variable "azurerm_synapse_workspace_name" {
  description = "Specifies the name which should be used for this synapse Workspace. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group where the synapse Workspace should exist. Changing this forces a new resource to be created."
}

variable "location" {
  description = "Specifies the Azure Region where the synapse Workspace should exist. Changing this forces a new resource to be created."
}
variable "managed_virtual_network_enabled" {
  description = "Is Virtual Network enabled for all computes in this workspace. Changing this forces a new resource to be created."
  default     = "true"
}
variable "sql_administrator_login" {
  description = "Specifies The Login Name of the SQL administrator. Changing this forces a new resource to be created."
}

variable "sql_administrator_login_password" {
  description = "The Password associated with the sql_administrator_login for the SQL administrator."
}

variable "sql_identity_control_enabled" {
  description = "Are pipelines (running as workspace's system assigned identity) allowed to access SQL pools?"
  default     = true
}

variable "aad_admin_login" {
  description = "The login name of the Azure AD Administrator of this Synapse Workspace."
}

variable "aad_admin_object_id" {
  description = "The object id of the Azure AD Administrator of this Synapse Workspace."
}

variable "tags" {
}