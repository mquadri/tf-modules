variable "create_resource_group" {
  description = "Set this to true if a new RG is required."
  type        = bool
  default     = false
}

# This is required for most resource modules
variable "resource_group_name" {
  type        = string
  description = "The resource group where the resources will be deployed."
  nullable    = false
}

variable "location" {
  type        = string
  description = "The Azure region where the resources should be deployed."
  nullable    = false
}

variable "managed_identity" {
  type = map(object({
    user_managed_identity_name           = string
    managed_identity_location            = string
    managed_identity_resource_group_name = string
    tags                                 = optional(map(string))
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))
    enable_telemetry = optional(bool, false)

  }))
  description = "user assigned managed identity block"
  default     = {}
}

variable "rg_role_assignments" {
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default     = {}
  description = "The role assignment to be assigned to the resource group"
  nullable    = false

  validation {
    condition = alltrue(
      [for role in var.rg_role_assignments :
        can(regex("^/providers/Microsoft\\.Authorization/roleDefinitions/[0-9a-fA-F-]+$", role.role_definition_id_or_name))
        ||
        can(regex("^[[:alpha:]]+?", role.role_definition_id_or_name))
      ]
    )
    error_message = <<ERROR_MESSAGE
        role_definition_id_or_name must have the following format: 
         - Using the role definition Id : `/providers/Microsoft.Authorization/roleDefinitions/<role_guid>`
         - Using the role name: Reader | "Storage Blob Data Reader"
      ERROR_MESSAGE 
  }
}

#tag variables

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = ""
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
  default     = ""
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costcostcenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costvp" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costappownertech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costappownermanager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costbudgetowner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
  default     = ""
}

variable "costdivision" {
  description = "cost division"
  type        = string
  default     = ""
}

variable "costallocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = ""
}

variable "appfunction" {
  description = "app function"
  type        = string
  default     = ""
}

variable "monthlybudget" {
  description = "monthly budget"
  type        = string
  default     = ""
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = ""
}

variable "managed_by" {
  description = "resource group is managed by"
  type        = string
  default     = null
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