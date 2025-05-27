variable "location" {
  type        = string
  description = "Required. The Azure region for deployment of the this resource."
  nullable    = false
}

variable "name" {
  type        = string
  default     = null
  description = "If we don't give the name, it will be created by local naming convention"

}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  default     = null
  description = <<DESCRIPTION
  Controls the Resource Lock configuration for this resource. The following properties can be specified:
  
  - `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
  - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.
  DESCRIPTION

  validation {
    condition     = var.lock != null ? contains(["CanNotDelete", "ReadOnly"], var.lock.kind) : true
    error_message = "Lock kind must be either `\"CanNotDelete\"` or `\"ReadOnly\"`."
  }
}

# tflint-ignore: terraform_heredoc_usage
variable "role_assignments" {
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
  description = <<DESCRIPTION
Optional. A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - (Required) The ID or name of the role definition to assign to the principal.
- `principal_id` - (Required) The ID of the principal to assign the role to.
- `description` - (Optional) The description of the role assignment.
- `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - (Optional) The condition which will be used to scope the role assignment.
- `condition_version` - (Optional) The version of the condition syntax. Valid values are '2.0'.
- `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. NOTE:
this field is only used in cross tenant scenario.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

Example Input:
```hcl
role_assignments = {
  "role_assignment1" = {
    role_definition_id_or_name = "Reader"
    principal_id = "4179302c-702e-4de7-a061-beacd0a1be09"
    
  },
"role_assignment2" = {
  role_definition_id_or_name = "2a2b9908-6ea1-4ae2-8e65-a410df84e7d1" // Storage Blob Data Reader Role Guid 
  principal_id = "4179302c-702e-4de7-a061-beacd0a1be09"
  skip_service_principal_aad_check = false
  condition_version = "2.0"
  condition = <<-EOT
(
  (
    !(ActionMatches{'Microsoft.Authorization/roleAssignments/write'})
  )
OR 
  (
  @Request[Microsoft.Authorization/roleAssignments:RoleDefinitionId]
  ForAnyOfAnyValues:GuidEquals {4179302c-702e-4de7-a061-beacd0a1be09}
  )
)
AND
(
  (
    !(ActionMatches{'Microsoft.Authorization/roleAssignments/delete'})
  )
  OR 
  (
    @Resource[Microsoft.Authorization/roleAssignments:RoleDefinitionId]
    ForAnyOfAnyValues:GuidEquals {dc887ae1-fe50-4307-be53-213ff08f3c0b}
  )
)
EOT  
  }
}
```
DESCRIPTION
  nullable    = false

  validation {
    condition = alltrue(
      [for role in var.role_assignments :
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

# tflint-ignore: terraform_unused_declarations
variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource."
}

variable "appname" {
  description = "the app name for the resources.  Used for naming purposes"
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}
resource "validation_warning" "env" {
  condition = var.env != null
  summary   = "WARNING: Deprecation Notice, env is not longer used, please use environment instead"
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costCostCenter" {
  condition = var.costCostCenter != null
  summary   = "WARNING: Deprecation Notice, costCostCenter is not longer used, please remove this variable from your configuration"
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costVP" {
  condition = var.costVP != null
  summary   = "WARNING: Deprecation Notice, costVP is not longer used, please remove this variable from your configuration"
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerTech" {
  condition = var.costAppOwnerTech != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerTech is not longer used, please remove this variable from your configuration"
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerManager" {
  condition = var.costAppOwnerManager != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerManager is not longer used, please remove this variable from your configuration"
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costBudgetOwner" {
  condition = var.costBudgetOwner != null
  summary   = "WARNING: Deprecation Notice, costBudgetOwner is not longer used, please remove this variable from your configuration"
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costbaseline" {
  condition = var.costbaseline != null
  summary   = "WARNING: Deprecation Notice, costbaseline is not longer used, please remove this variable from your configuration"
}

variable "resourcetype" {
  description = "resource type -- 3 letters"
  type        = string
}

variable "costDivision" {
  description = "cost division"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costDivision" {
  condition = var.costDivision != null
  summary   = "WARNING: Deprecation Notice, costDivision is not longer used, please remove this variable from your configuration"
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAllocation" {
  condition = var.costAllocation != null
  summary   = "WARNING: Deprecation Notice, costAllocation is not longer used, please remove this variable from your configuration"
}

variable "appFunction" {
  description = "app function"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appFunction" {
  condition = var.appFunction != null
  summary   = "WARNING: Deprecation Notice, appFunction is not longer used, please remove this variable from your configuration"
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "monthlyBudget" {
  condition = var.monthlyBudget != null
  summary   = "WARNING: Deprecation Notice, monthlyBudget is not longer used, please remove this variable from your configuration"
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
  nullable    = false
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appid_2" {
  condition = var.appid != null
  summary   = "WARNING: Deprecation Notice, appid is not longer used, please remove this variable from your configuration"
}

resource "validation_warning" "appid" {
  condition = var.appid != null
  summary   = "WARNING: Deprecation Notice, appid is not longer used and has been moved to app_id as per fin ops requirements, please rename  this variable from your configuration"
}

# tags
variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  nullable    = false
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["nonprod", "prod", "sandbox"], var.environment)
    error_message = "The environment must be one of the following values: nonprod, prod, sandbox"
  }
}

variable "msftmigration" {
  description = "The msftmigration tag used."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "msftmigration" {
  condition = var.msftmigration != null
  summary   = "WARNING: Deprecation Notice, msftmigration is not longer used, please remove this variable from your configuration"
}

variable "migration" {
  description = "Boolean value to know if the application was migrated."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["yes", "no"], var.migration)
    error_message = "The migration must be one of the following values: yes, no"
  }
}

variable "os_support" {
  description = "To be used only for VM resources. Provides informatation about OS support group."
  type        = string
  default     = ""
  nullable    = false

  validation {
    condition     = (var.os_support == "" || contains(["na_unix", "na_windows", "sfwapp-eng-ad"], var.os_support))
    error_message = "The environment must be one of the following values: na_unix, na_windows, sfwapp-eng-ad"
  }
}


