variable "location" {
  type        = string
  description = "The location of the Azure Bastion Host."
  nullable    = false
}

variable "name" {
  type        = string
  description = "The name of the Azure Bastion Host."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the Azure Bastion Host is located."
}

variable "copy_paste_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether copy-paste functionality is enabled for the Azure Bastion Host."
  nullable    = false
}

variable "file_copy_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether file copy functionality is enabled for the Azure Bastion Host."
  nullable    = false
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = "SThis variable controls whether or not telemetry is enabled for the module"
  nullable    = false
}

variable "ip_connect_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether IP connect functionality is enabled for the Azure Bastion Host."
  nullable    = false
}

variable "kerberos_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether Kerberos authentication is enabled for the Azure Bastion Host."
  nullable    = false
}

variable "scale_units" {
  type        = number
  default     = 2
  description = "The number of scale units for the Azure Bastion Host."
  nullable    = false
}

variable "shareable_link_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether shareable link functionality is enabled for the Azure Bastion Host."
  nullable    = false
}

variable "sku" {
  type        = string
  default     = "Basic"
  description = <<DESCRIPTION
The SKU of the Azure Bastion Host.
Valid values are 'Basic', 'Standard', and 'Developer'.
DESCRIPTION
  nullable    = false

  validation {
    condition     = can(regex("^(Basic|Standard|Developer)$", var.sku))
    error_message = "The SKU must be either 'Basic', 'Standard', or 'Developer'."
  }
}

variable "tunneling_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether tunneling functionality is enabled for the Azure Bastion Host."
  nullable    = false
}

variable "virtual_network_id" {
  type        = string
  default     = null
  description = "The ID of the virtual network where the Azure Bastion Host is deployed."
}

variable "virtual_network" {
  type = map(object({
    vnet_name                = string
    vnet_resource_group_name = string
  }))
  default     = {}
  description = "The vnet name and resource group name."
}

variable "public_ip" {
  type = map(object({
    name                          = string
    public_ip_name                = string
    public_ip_resource_group_name = string
  }))
  default     = {}
  description = "The ip configuration name, public ip name and resource group name."
}

# tags

variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}
