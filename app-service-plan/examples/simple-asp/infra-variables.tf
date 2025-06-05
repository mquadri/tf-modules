variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
}

variable "appFunction" {
  description = "app function"
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

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costDivision" {
  description = "cost division"
  type        = string
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = "asp"
}

variable "resource_group_name" {
  description = "Resource group name for where App Service Plan will be deployed"
  type        = string
}

# web server farm (App Service Plan) settings
# variable "name" {
#   type        = string
#   default     = null
#   description = "allow override of the App Service Plan name"
# }

variable "os_type" {
  type        = string
  description = "The operating system type of the service plan. Possible values are `Windows`, `Linux` or `WindowsContainer`."
}

# variable "app_service_environment_id" {
#   type        = string
#   default     = null
#   description = "Optional: The ID of the App Service Environment."
# }

# variable "enable_telemetry" {
#   type        = bool
#   default     = true
#   description = <<DESCRIPTION
# This variable controls whether or not telemetry is enabled for the module.
# For more information see <https://aka.ms/avm/telemetryinfo>.
# If it is set to false, then no telemetry will be collected.
# DESCRIPTION
# }

# variable "lock" {
#   type = object({
#     kind = string
#     name = optional(string, null)
#   })
#   default     = null
#   description = <<DESCRIPTION
#   Controls the Resource Lock configuration for this resource. The following properties can be specified:

#   - `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
#   - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.
#   DESCRIPTION
# }

# variable "maximum_elastic_worker_count" {
#   type        = number
#   default     = null
#   description = "The minimum number of workers to allocate for this App Service Plan."
# }

# variable "per_site_scaling_enabled" {
#   type        = bool
#   default     = false
#   description = "Should per site scaling be enabled for this App Service Plan."
# }

# variable "role_assignments" {
#   type = map(object({
#     role_definition_id_or_name             = string
#     principal_id                           = string
#     description                            = optional(string, null)
#     skip_service_principal_aad_check       = optional(bool, false)
#     condition                              = optional(string, null)
#     condition_version                      = optional(string, null)
#     delegated_managed_identity_resource_id = optional(string, null)
#     principal_type                         = optional(string, null)
#   }))
#   default     = {}
#   description = <<DESCRIPTION
#   A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

#   - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
#   - `principal_id` - The ID of the principal to assign the role to.
#   - `description` - (Optional) The description of the role assignment.
#   - `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
#   - `condition` - (Optional) The condition which will be used to scope the role assignment.
#   - `condition_version` - (Optional) The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are `2.0`.
#   - `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.
#   - `principal_type` - (Optional) The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.

#   > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.
#   DESCRIPTION
#   nullable    = false
# }

variable "sku_name" {
  type        = string
  default     = "P1v2" # P1v2 is the minimum SKU for zone redundancy
  description = "The SKU name of the service plan. Defaults to `P1v2`. Possible values are B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, I4v2, I5v2, I6v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, P1mv3, P2mv3, P3mv3, P4mv3, P5mv3, S1, S2, S3, SHARED, EP1, EP2, EP3, FC1, WS1, WS2, WS3, and Y1."
}

# variable "worker_count" {
#   type        = number
#   default     = 3
#   description = "The number of workers to allocate for this App Service Plan."
# }

# variable "zone_balancing_enabled" {
#   type        = bool
#   default     = true
#   description = "Should zone balancing be enabled for this App Service Plan? Defaults to `true`."
# }


#subscription
variable "subscription_id" {
  description = "The id of the subscription."
  type        = string
}
