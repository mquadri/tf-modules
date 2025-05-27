## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~>1.14 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.10 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_function_app"></a> [create\_function\_app](#module\_create\_function\_app) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appnameStorage"></a> [appnameStorage](#input\_appnameStorage) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_functionAppAccessADgroup"></a> [functionAppAccessADgroup](#input\_functionAppAccessADgroup) | Azure Entra group for access to the Function App | `string` | n/a | yes |
| <a name="input_functionAppRuntime"></a> [functionAppRuntime](#input\_functionAppRuntime) | The runtime for your app. One of the following: 'dotnet-isolated', 'python', 'java', 'node', 'powershell' | `string` | n/a | yes |
| <a name="input_functionAppRuntimeVersion"></a> [functionAppRuntimeVersion](#input\_functionAppRuntimeVersion) | The runtime and version for your app. One of the following: '3.10', '3.11', '7.4', '8.0', '10', '11', '17', '20' | `number` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which all resources in this example should be created. | `string` | n/a | yes |
| <a name="input_malName"></a> [malName](#input\_malName) | MAL Name of the application. Should be <= 15 alpha-numeric characters. | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_resourceGroupName"></a> [resourceGroupName](#input\_resourceGroupName) | The Azure Resource Group name in which all resources in this example should be created. | `string` | n/a | yes |
| <a name="input_storageAccountName"></a> [storageAccountName](#input\_storageAccountName) | Your storage account name. | `string` | n/a | yes |
| <a name="input_subscriptionId"></a> [subscriptionId](#input\_subscriptionId) | The subscription id under which the resource will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_insight_name"></a> [app\_insight\_name](#output\_app\_insight\_name) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_log_analytics_name"></a> [log\_analytics\_name](#output\_log\_analytics\_name) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_storage_container_name"></a> [storage\_container\_name](#output\_storage\_container\_name) | n/a |
| <a name="output_storage_name"></a> [storage\_name](#output\_storage\_name) | n/a |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >= 1.15.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.10 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_function_app"></a> [create\_function\_app](#module\_create\_function\_app) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appnameStorage"></a> [appnameStorage](#input\_appnameStorage) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_functionAppAccessADgroup"></a> [functionAppAccessADgroup](#input\_functionAppAccessADgroup) | Azure Entra group for access to the Function App | `string` | n/a | yes |
| <a name="input_functionAppRuntime"></a> [functionAppRuntime](#input\_functionAppRuntime) | The runtime for your app. One of the following: 'dotnet-isolated', 'python', 'java', 'node', 'powershell' | `string` | n/a | yes |
| <a name="input_functionAppRuntimeVersion"></a> [functionAppRuntimeVersion](#input\_functionAppRuntimeVersion) | The runtime and version for your app. One of the following: '3.10', '3.11', '7.4', '8.0', '10', '11', '17', '20' | `number` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which all resources in this example should be created. | `string` | n/a | yes |
| <a name="input_malName"></a> [malName](#input\_malName) | MAL Name of the application. Should be <= 15 alpha-numeric characters. | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration) | The migration tag used. | `string` | n/a | yes |
| <a name="input_resourceGroupName"></a> [resourceGroupName](#input\_resourceGroupName) | The Azure Resource Group name in which all resources in this example should be created. | `string` | n/a | yes |
| <a name="input_server_farm_body"></a> [server\_farm\_body](#input\_server\_farm\_body) | The body configuration for the server farm. | <pre>object({<br>    kind = string<br>    sku = object({<br>      capacity = optional(number, null)<br>      family   = optional(string, null)<br>      name     = string<br>      size     = optional(string, null)<br>      tier     = string<br>    })<br>    properties = object({<br>      reserved = bool<br>    })<br>  })</pre> | <pre>{<br>  "kind": "functionapp",<br>  "properties": {<br>    "reserved": true<br>  },<br>  "sku": {<br>    "name": "FC1",<br>    "tier": "FlexConsumption"<br>  }<br>}</pre> | no |
| <a name="input_storageAccountName"></a> [storageAccountName](#input\_storageAccountName) | Your storage account name. | `string` | n/a | yes |
| <a name="input_subscriptionId"></a> [subscriptionId](#input\_subscriptionId) | The subscription id under which the resource will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_insight_name"></a> [app\_insight\_name](#output\_app\_insight\_name) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_log_analytics_name"></a> [log\_analytics\_name](#output\_log\_analytics\_name) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_storage_container_name"></a> [storage\_container\_name](#output\_storage\_container\_name) | n/a |
| <a name="output_storage_name"></a> [storage\_name](#output\_storage\_name) | n/a |
<!-- END_TF_DOCS -->