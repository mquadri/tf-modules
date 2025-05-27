
variable "subscriptionId" {
  type        = string
  description = "The subscription id under which the resource will be created."
}

variable "resourceGroupName" {
  type        = string
  description = "The Azure Resource Group name in which all resources in this example should be created."
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
}

variable "malName" {
  type        = string
  description = "MAL Name of the application. Should be <= 15 alpha-numeric characters."
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "appnameStorage" {
  description = "the app name for the storage.  Used for tagging and naming purposes"
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

# variable "costDivision" {
#   description = "cost division"
#   type        = string
# }

# variable "costAllocation" {
#   description = "can only be sharedcosts or chargeback"
#   type        = string
# }
#
# variable "appFunction" {
#   description = "app function"
#   type        = string
# }
#
# variable "monthlyBudget" {
#   description = "monthly budget"
#   type        = string
# }

variable "costbaseline" {
  description = "year resource created"
  type        = string
}

variable "storageAccountName" {
  type        = string
  description = "Your storage account name."
}

variable "create_storageAccount" {
  type        = bool
  default     = false
  description = "Set to true if a new storage account is to be created"

}
variable "storageContainerName" {
  type        = string
  default     = null
  description = "Your storage container name."
}

variable "applicationInsightsName" {
  type        = string
  default     = null
  description = "Your Application Insights name."
}

variable "diagnosticsName" {
  type        = string
  default     = null
  description = "The diagnostics setting name of the resource on."
}

variable "functionAppName" {
  type        = string
  default     = null
  description = "Your Flex Consumption application name."
}

variable "functionPlanName" {
  type        = string
  default     = null
  description = "Your Flex Consumption plan name."
}

variable "maximumInstanceCount" {
  type        = number
  default     = 100
  description = "The maximum instance count for the app"
}

variable "instanceMemoryMB" {
  type        = number
  default     = 2048
  description = "The instance memory for the instances of the app: 2048 or 4096"
}

variable "functionAppRuntime" {
  type        = string
  description = "The runtime for your app. One of the following: 'dotnet-isolated', 'python', 'java', 'node', 'powershell'"
}

variable "functionAppRuntimeVersion" {
  type        = number
  description = "The runtime and version for your app. One of the following: '3.10', '3.11', '7.4', '8.0', '10', '11', '17', '20'"
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Custom tags to apply to the resource"
}

variable "functionAppAccessADgroup" {
  type        = string
  description = "Azure Entra group for access to the Function App"
}

variable "functionAppRBAC" {
  type        = string
  default     = "Contributor"
  description = "Azure RBAC role to access Function App"
}

variable "server_farm_body" {
  description = "The body configuration for the server farm."
  type = object({
    kind = string
    sku = object({
      capacity = optional(number, null)
      family   = optional(string, null)
      name     = string
      size     = optional(string, null)
      tier     = string
    })
    properties = object({
      reserved = bool
    })
  })
  default = {
    kind = "functionapp"
    sku = {
      name = "FC1"
      tier = "FlexConsumption"
    }
    properties = {
      reserved = true
    }
  }
}

variable "user_identity_name" {
  description = "Optional user-assigned identity name for the function app."
  type        = string
  default     = null
}

variable "storageAccountPrivateEndpoints" {
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    subresource_name                        = string
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
  default     = {}
  description = <<DESCRIPTION
A map of private endpoints to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` - (Optional) The name of the private endpoint. One will be generated if not set.
- `role_assignments` - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See `var.role_assignments` for more information.
- `lock` - (Optional) The lock level to apply to the private endpoint. Default is `None`. Possible values are `None`, `CanNotDelete`, and `ReadOnly`.
- `tags` - (Optional) A mapping of tags to assign to the private endpoint.
- `subnet_resource_id` - The resource ID of the subnet to deploy the private endpoint in.
- `subresource_name` - The service name of the private endpoint.  Possible value are `blob`, 'dfs', 'file', `queue`, `table`, and `web`.
- `private_dns_zone_group_name` - (Optional) The name of the private DNS zone group. One will be generated if not set.
- `private_dns_zone_resource_ids` - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.
- `application_security_group_resource_ids` - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
- `private_service_connection_name` - (Optional) The name of the private service connection. One will be generated if not set.
- `network_interface_name` - (Optional) The name of the network interface. One will be generated if not set.
- `location` - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.
- `resource_group_name` - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the resource.
- `ip_configurations` - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
  - `name` - The name of the IP configuration.
  - `private_ip_address` - The private IP address of the IP configuration.
DESCRIPTION
  nullable    = false
}

variable "swift_connection_subnet" {
  type        = string
  description = "The subnet ID for the Swift connection to the function app."
  default     = null
}

variable "functionAppWorkerRuntime" {
  type        = string
  description = "The Worker runtime to use. I.e '~4'"
  nullable    = true
}

variable "shared_access_key_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is `false`."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Whether or not public network access is allowed for the storage account. Defaults to `false`."
}

variable "sa_infrastructure_encryption_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to `true`."
}

variable "https_traffic_only_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Allows https traffic only to storage account. Defaults to `true`."
}

variable "cors_allowed_origins" {
  description = "List of allowed origins for CORS. Example: [\"https://portal.azure.com\", \"https://ms.portal.azure.com\"]"
  type        = list(string)
  default     = null
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
  default     = "no"
}

variable "internet_ingestion_enabled" {
  description = "Whether or not logs can be ingested over public endpoints for app insights (required 'true' until AMPLS DNS is setup)"
  type        = bool
  default     = false
}

variable "tables" {
  type = map(object({
    name = string
    signed_identifiers = optional(list(object({
      id = string
      access_policy = optional(object({
        expiry_time = string
        permission  = string
        start_time  = string
      }))
    })))

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})

    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default     = {}
  description = <<-EOT
 - `name` - (Required) The name of the storage table. Only Alphanumeric characters allowed, starting with a letter. Must be unique within the storage account the table is located. Changing this forces a new resource to be created.

 ---
 `acl` block supports the following:
 - `id` - (Required) The ID which should be used for this Shared Identifier.

 ---
 `access_policy` block supports the following:
 - `expiry` - (Required) The ISO8061 UTC time at which this Access Policy should be valid until.
 - `permissions` - (Required) The permissions which should associated with this Shared Identifier.
 - `start` - (Required) The ISO8061 UTC time at which this Access Policy should be valid from.

 ---
 `timeouts` block supports the following:
 - `create` - (Defaults to 30 minutes) Used when creating the Storage Table.
 - `delete` - (Defaults to 30 minutes) Used when deleting the Storage Table.
 - `read` - (Defaults to 5 minutes) Used when retrieving the Storage Table.
 - `update` - (Defaults to 30 minutes) Used when updating the Storage Table.

Supply role assignments in the same way as for `var.role_assignments`.

EOT
  nullable    = false
}

variable "functionAppPrivateEndpoint" {
  description = "Configuration for function app private endpoint"
  type = object({
    name                            = string
    subnet_resource_id              = string
    private_dns_zone_resource_ids   = list(string)
    resource_group_name             = string
    subresource_names               = list(string)
    private_service_connection_name = string
    private_dns_zone_group_name     = optional(string, "default")
  })
  default = null
}