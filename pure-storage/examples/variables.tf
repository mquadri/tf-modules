#VNET variables

variable "cbs_vnet_name" {
  type        = string
  description = "CBS vnet name"
}

variable "cbs_vnet_rg" {
  type        = string
  description = "CBS VNET RG name"
}

#Keyvault variables

variable "keyvault_name" {
  type        = string
  description = "Name of the keyavult to store the private key"
}

variable "keyvault_rg" {
  type        = string
  description = "Keyvault RG name"
}

#User addigned identity variables

variable "user_assigned_identity_name" {
  type        = string
  description = "Name of the User addigned identity to which the custom role will be assigned"
}

variable "user_assigned_identity_rg" {
  type        = string
  description = "User addigned identity RG name"
}

#CBS Role definition

variable "cbs_role_name" {
  type        = string
  description = "cbs role name variable"
}

#Pure storage variables

variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type        = string
  description = "RG location in Azure"
}

variable "tags" {
  type        = map(string)
  description = "Tags used for the deployment"
  default = {
    "Environment" = "SANDBOX"
    "Owner"       = "CBS"
  }
}
variable "array_name" {
  type = string
}

variable "cbs_subnet_mgmt" {
  type = string
}
variable "cbs_subnet_iscsi" {
  type = string
}
variable "cbs_subnet_repl" {
  type = string
}

variable "cbs_subnet_sys" {
  type = string
}

variable "zone" {
  type = number
}
variable "log_sender_domain" {
  type = string
}

variable "alert_recipients" {
  type = list(string)
}

variable "jit_group_ids" {
  type = list(string)
}
variable "array_model" {
  type = string
}

variable "license_key" {
  type = string
}

variable "user_assigned_identity_id" {
  type = string
}

variable "key_file_path" {
  type = string
}

variable "cbs_vnet_id" {
  type = string
}

variable "cbs_key_vault" {
  type = string
}


# tags
variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = "sandbox"

}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
  default     = "No"
}
