# Function App Module

It is assumed that the resource group is already present

<!-- BEGIN_TF_DOCS -->
Obtained the information from the URLs:
https://learn.microsoft.com/en-us/samples/azure-samples/azure-functions-flex-consumption-samples/terraform-based-deployment/
https://github.com/azure-samples/azure-functions-flex-consumption-samples/tree/main/IaC/terraform

It is assumed that the resource group is already present

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>=1.9)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (>= 1.15.0, < 2.3.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~>3.10)

## Providers

The following providers are used by this module:

- <a name="provider_azapi"></a> [azapi](#provider\_azapi) (>= 1.15.0, < 2.3.0)

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~>3.10)

## Modules

The following Modules are called:

### <a name="module_functionApp_appInsights"></a> [functionApp\_appInsights](#module\_functionApp\_appInsights)

Source: ../app-insight

Version:

### <a name="module_functionApp_logAnalytics"></a> [functionApp\_logAnalytics](#module\_functionApp\_logAnalytics)

Source: ../log-analytics-ws

Version:

### <a name="module_functionApp_resources_rbac_assignment"></a> [functionApp\_resources\_rbac\_assignment](#module\_functionApp\_resources\_rbac\_assignment)

Source: Azure/avm-res-authorization-roleassignment/azurerm

Version: 0.2.0

### <a name="module_functionApp_service_rbac_assignment_system"></a> [functionApp\_service\_rbac\_assignment\_system](#module\_functionApp\_service\_rbac\_assignment\_system)

Source: Azure/avm-res-authorization-roleassignment/azurerm

Version: 0.2.0

### <a name="module_functionApp_service_rbac_assignment_uai"></a> [functionApp\_service\_rbac\_assignment\_uai](#module\_functionApp\_service\_rbac\_assignment\_uai)

Source: Azure/avm-res-authorization-roleassignment/azurerm

Version: 0.2.0

### <a name="module_functionApp_storage"></a> [functionApp\_storage](#module\_functionApp\_storage)

Source: ../storage-account

Version:

### <a name="module_functionApp_storageContainer"></a> [functionApp\_storageContainer](#module\_functionApp\_storageContainer)

Source: ../storage-account-container

Version:

## Resources

The following resources are used by this module:

- [azapi_resource.functionApps](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) (resource)
- [azapi_resource.serverFarm](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) (resource)
- [azurerm_app_service_virtual_network_swift_connection.function_app_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) (resource)
- [azurerm_private_endpoint.function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) (resource)
- [azurerm_user_assigned_identity.function_app_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) (resource)
- [azurerm_linux_function_app.fn_wrapper](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/linux_function_app) (data source)
- [azurerm_resource_group.group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_storage_account.blob_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) (data source)
- [azurerm_user_assigned_identity.function_app_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/user_assigned_identity) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_appnameStorage"></a> [appnameStorage](#input\_appnameStorage)

Description: the app name for the storage.  Used for tagging and naming purposes

Type: `string`

### <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager)

Description: The app owner manager responsible for resources. Used for tagging purposes.

Type: `string`

### <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech)

Description: The app owner responsible for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner)

Description: The budget owner responsible for resources. Used for tagging purposes.

Type: `string`

### <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter)

Description: The cost center code for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_costVP"></a> [costVP](#input\_costVP)

Description: The cost vp for resources. Used for tagging purposes.

Type: `string`

### <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline)

Description: year resource created

Type: `string`

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_functionAppAccessADgroup"></a> [functionAppAccessADgroup](#input\_functionAppAccessADgroup)

Description: Azure Entra group for access to the Function App

Type: `string`

### <a name="input_functionAppRuntime"></a> [functionAppRuntime](#input\_functionAppRuntime)

Description: The runtime for your app. One of the following: 'dotnet-isolated', 'python', 'java', 'node', 'powershell'

Type: `string`

### <a name="input_functionAppRuntimeVersion"></a> [functionAppRuntimeVersion](#input\_functionAppRuntimeVersion)

Description: The runtime and version for your app. One of the following: '3.10', '3.11', '7.4', '8.0', '10', '11', '17', '20'

Type: `number`

### <a name="input_functionAppWorkerRuntime"></a> [functionAppWorkerRuntime](#input\_functionAppWorkerRuntime)

Description: The Worker runtime to use. I.e '~4'

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure Region in which all resources in this example should be created.

Type: `string`

### <a name="input_malName"></a> [malName](#input\_malName)

Description: MAL Name of the application. Should be <= 15 alpha-numeric characters.

Type: `string`

### <a name="input_resourceGroupName"></a> [resourceGroupName](#input\_resourceGroupName)

Description: The Azure Resource Group name in which all resources in this example should be created.

Type: `string`

### <a name="input_storageAccountName"></a> [storageAccountName](#input\_storageAccountName)

Description: Your storage account name.

Type: `string`

### <a name="input_subscriptionId"></a> [subscriptionId](#input\_subscriptionId)

Description: The subscription id under which the resource will be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_applicationInsightsName"></a> [applicationInsightsName](#input\_applicationInsightsName)

Description: Your Application Insights name.

Type: `string`

Default: `null`

### <a name="input_cors_allowed_origins"></a> [cors\_allowed\_origins](#input\_cors\_allowed\_origins)

Description: List of allowed origins for CORS. Example: ["https://portal.azure.com", "https://ms.portal.azure.com"]

Type: `list(string)`

Default: `null`

### <a name="input_create_storageAccount"></a> [create\_storageAccount](#input\_create\_storageAccount)

Description: Set to true if a new storage account is to be created

Type: `bool`

Default: `false`

### <a name="input_diagnosticsName"></a> [diagnosticsName](#input\_diagnosticsName)

Description: The diagnostics setting name of the resource on.

Type: `string`

Default: `null`

### <a name="input_functionAppName"></a> [functionAppName](#input\_functionAppName)

Description: Your Flex Consumption application name.

Type: `string`

Default: `null`

### <a name="input_functionAppPrivateEndpoint"></a> [functionAppPrivateEndpoint](#input\_functionAppPrivateEndpoint)

Description: Configuration for function app private endpoint

Type:

```hcl
object({
    name                            = string
    subnet_resource_id              = string
    private_dns_zone_resource_ids   = list(string)
    resource_group_name             = string
    subresource_names               = list(string)
    private_service_connection_name = string
    private_dns_zone_group_name     = optional(string, "default")
  })
```

Default: `null`

### <a name="input_functionAppRBAC"></a> [functionAppRBAC](#input\_functionAppRBAC)

Description: Azure RBAC role to access Function App

Type: `string`

Default: `"Contributor"`

### <a name="input_functionPlanName"></a> [functionPlanName](#input\_functionPlanName)

Description: Your Flex Consumption plan name.

Type: `string`

Default: `null`

### <a name="input_https_traffic_only_enabled"></a> [https\_traffic\_only\_enabled](#input\_https\_traffic\_only\_enabled)

Description: (Optional) Allows https traffic only to storage account. Defaults to `true`.

Type: `bool`

Default: `true`

### <a name="input_instanceMemoryMB"></a> [instanceMemoryMB](#input\_instanceMemoryMB)

Description: The instance memory for the instances of the app: 2048 or 4096

Type: `number`

Default: `2048`

### <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled)

Description: Whether or not logs can be ingested over public endpoints for app insights (required 'true' until AMPLS DNS is setup)

Type: `bool`

Default: `false`

### <a name="input_maximumInstanceCount"></a> [maximumInstanceCount](#input\_maximumInstanceCount)

Description: The maximum instance count for the app

Type: `number`

Default: `100`

### <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration)

Description: The migration tag used.

Type: `string`

Default: `"no"`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: (Optional) Whether or not public network access is allowed for the storage account. Defaults to `false`.

Type: `bool`

Default: `false`

### <a name="input_sa_infrastructure_encryption_enabled"></a> [sa\_infrastructure\_encryption\_enabled](#input\_sa\_infrastructure\_encryption\_enabled)

Description: (Optional) Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to `true`.

Type: `bool`

Default: `true`

### <a name="input_server_farm_body"></a> [server\_farm\_body](#input\_server\_farm\_body)

Description: The body configuration for the server farm.

Type:

```hcl
object({
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
```

Default:

```json
{
  "kind": "functionapp",
  "properties": {
    "reserved": true
  },
  "sku": {
    "name": "FC1",
    "tier": "FlexConsumption"
  }
}
```

### <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled)

Description: (Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is `false`.

Type: `bool`

Default: `false`

### <a name="input_storageAccountPrivateEndpoints"></a> [storageAccountPrivateEndpoints](#input\_storageAccountPrivateEndpoints)

Description: A map of private endpoints to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

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

Type:

```hcl
map(object({
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
```

Default: `{}`

### <a name="input_storageContainerName"></a> [storageContainerName](#input\_storageContainerName)

Description: Your storage container name.

Type: `string`

Default: `null`

### <a name="input_swift_connection_subnet"></a> [swift\_connection\_subnet](#input\_swift\_connection\_subnet)

Description: The subnet ID for the Swift connection to the function app.

Type: `string`

Default: `null`

### <a name="input_tables"></a> [tables](#input\_tables)

Description:  - `name` - (Required) The name of the storage table. Only Alphanumeric characters allowed, starting with a letter. Must be unique within the storage account the table is located. Changing this forces a new resource to be created.

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

Type:

```hcl
map(object({
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
```

Default: `{}`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Custom tags to apply to the resource

Type: `map(string)`

Default: `null`

### <a name="input_user_identity_name"></a> [user\_identity\_name](#input\_user\_identity\_name)

Description: Optional user-assigned identity name for the function app.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_resource"></a> [resource](#output\_resource)

Description: All the specific elements of the resource
<!-- END_TF_DOCS -->