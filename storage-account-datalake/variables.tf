## Naming and Tags ##
variable "name" {
  type        = string
  description = "The name of the resource."
  default     = null
}

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

#storage account vars
variable "resource_group_name" {
  description = "Name of the existing resource group where to place the resources created."
  type        = string
}

variable "account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  type        = string
}

variable "subnet_id" {
  description = "subnet id to deploy the PE to"
  type        = string
}

variable "private_dns_zone_ids" {
  description = "id of the private dns zone"
  type        = string
}

variable "additional_private_endpoints" {
  description = "Additional private endpoints to create -- check https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource"
  type = list(object({
    subresource_name    = string
    private_dns_zone_id = string
  }))
  default = []
}

variable "is_hsn_enabled" {
  description = "value for is_hsn_enable. See: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#is_hns_enabled"
  type        = bool
  default     = true
}

variable "account_tier" {
  description = "The Tier to use for this storage account. Valid options are Standard and Premium. See: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#tier"
  type        = string
  default     = "Premium"
}

variable "sa_infrastructure_encryption_enabled" {
  description = "Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to false"
  type        = string
}

variable "account_kind" {
  description = "Specifies the Kind to use for this storage account"
  type        = string
  default     = "StorageV2"

  validation {
    condition     = can(regex("^(Storage|StorageV2|BlobStorage|BlockBlobStorage|FileStorage)$", var.account_kind))
    error_message = "account_kind must be one of Storage, StorageV2 or BlobStorage"
  }
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Valid options are TLS1_0, TLS1_1, and TLS1_2."
  type        = string
  default     = "TLS1_2"

  validation {
    condition     = can(regex("^(TLS1_0|TLS1_1|TLS1_2)$", var.min_tls_version))
    error_message = "min_tls_version must be one of TLS1_0, TLS1_1, or TLS1_2"
  }
}