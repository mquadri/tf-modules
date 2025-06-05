<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 1.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.71.0, < 4.0 |
| <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) | ~> 0.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.15.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_private-endpoint-setup"></a> [private-endpoint-setup](#module\_private-endpoint-setup) | ../private-endpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azapi_resource.AIServicesConnection](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource.AIServicesResource](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource.hub](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource.project](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | A map of objects where each object contains information to create a A record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records             = list(string)<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records) | A map of objects where each object contains information to create a AAAA record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records             = list(string)<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | A map of objects where each object contains information to create a CNAME record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    record              = string<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_create_dns_zone"></a> [create\_dns\_zone](#input\_create\_dns\_zone) | n/a | `bool` | `false` | no |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | The ID of the DNS zone if provided by the user | `string` | `""` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The name of the private dns zone. | `string` | `""` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | controls whether or not to create private endpoints | `bool` | `true` | no |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | This variable controls whether or not telemetry is enabled for the module.<br>For more information see https://aka.ms/avm/telemetryinfo.<br>If it is set to false, then no telemetry will be collected. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Name of the keyvault | `string` | n/a | yes |
| <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name) | Resource group name for key vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records) | A map of objects where each object contains information to create a MX record. | <pre>map(object({<br>    name                = optional(string, "@")<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      preference = number<br>      exchange   = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name) | n/a | `string` | `null` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | Private Endpoints for the supported resources | <pre>map(object({<br>    name                           = string<br>    is_manual_connection           = optional(bool)<br>    private_connection_resource_id = optional(string)<br>    subresource_names              = list(string)<br>    request_message                = optional(string)<br>    private_dns_zone_group_name    = optional(string)<br>    private_dns_zone_ids           = optional(list(string))<br>  }))</pre> | `{}` | no |
| <a name="input_ptr_records"></a> [ptr\_records](#input\_ptr\_records) | A map of objects where each object contains information to create a PTR record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records             = list(string)<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Enable or disable public network access. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name for where AI Studio will be deployed | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | `"ais"` | no |
| <a name="input_sku_capacity"></a> [sku\_capacity](#input\_sku\_capacity) | If the SKU supports scale out/in then the capacity integer should be included. If scale out/in is not possible for the resource this may be omitted. | `number` | `null` | no |
| <a name="input_sku_family"></a> [sku\_family](#input\_sku\_family) | If the service has different generations of hardware, for the same SKU, then that can be captured here. | `string` | `null` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The sku name of the Azure Analysis Services server to create. Choose from: B1, B2, D1, S0, S1, S2, S3, S4, S8, S9. Some skus are region specific. See https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-overview#availability-by-region | `string` | `"S0"` | no |
| <a name="input_sku_size"></a> [sku\_size](#input\_sku\_size) | The SKU size. When the name field is the combination of tier and some other value, this would be the standalone code. | `string` | `"S0"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | This field is required to be implemented by the Resource Provider if the service has more than one tier, but is not required on a PUT. Choose from: 'Basic', 'Enterprise', 'Free', 'Premium', 'Standard' | `string` | `"Basic"` | no |
| <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record) | optional soa\_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com | <pre>object({<br>    email        = string<br>    expire_time  = optional(number, 2419200)<br>    minimum_ttl  = optional(number, 10)<br>    refresh_time = optional(number, 3600)<br>    retry_time   = optional(number, 300)<br>    ttl          = optional(number, 3600)<br>    tags         = optional(map(string), null)<br>  })</pre> | `null` | no |
| <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records) | A map of objects where each object contains information to create a SRV record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      priority = number<br>      weight   = number<br>      port     = number<br>      target   = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | storage account | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | `null` | no |
| <a name="input_txt_records"></a> [txt\_records](#input\_txt\_records) | A map of objects where each object contains information to create a TXT record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      value = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_network_links"></a> [virtual\_network\_links](#input\_virtual\_network\_links) | A map of objects where each object contains information to create a virtual network link. | <pre>map(object({<br>    vnetlinkname     = string<br>    vnetid           = string<br>    autoregistration = optional(bool, false)<br>    tags             = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | n/a | `string` | `null` | no |
| <a name="input_virtual_network_rg"></a> [virtual\_network\_rg](#input\_virtual\_network\_rg) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ais_resource"></a> [ais\_resource](#output\_ais\_resource) | Resource of the instance of AIServices. |
| <a name="output_aisc_resource"></a> [aisc\_resource](#output\_aisc\_resource) | Resource of the instance of AzAPI AI Services Connection. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_hub_resource"></a> [hub\_resource](#output\_hub\_resource) | Resource of the instance of Azure AI Hub. |
| <a name="output_project_resource"></a> [project\_resource](#output\_project\_resource) | Resource of the instance of Azure AI Project. |
| <a name="output_workspace_name"></a> [workspace\_name](#output\_workspace\_name) | n/a |
<!-- END_TF_DOCS -->

## Lumen Wrapper Information

This Terraform module provisions Azure AI Studio components (AI Hub, AI Project, AI Services) primarily using `azapi_resource`. It is designed to integrate with Lumen's tagging standards.

## Critical Issues

*   **Local Submodule Dependency**: This module uses `source = "../private-endpoint"` for its private endpoint functionality. This relative path dependency means the module is not self-contained and requires the `private-endpoint` module to be located in the parent directory. This severely impacts portability and standard module usage. This path should be parameterized or the private endpoint module should be sourced from a standard remote location (e.g., Git repository or Terraform Registry).
*   **Deprecated Variables**: The `variables.tf` file contains numerous deprecated individual tag variables (e.g., `appid`, `env`, `costCostCenter`, etc.) and their associated `validation_warning` resources. These should be manually removed in a future refactoring effort. Users should rely on the top-level `app_id`, `environment`, `msftmigration`, `mal_id` variables and the general `tags` map for custom tagging.

## Contributing

Please refer to the main repository's contribution guidelines. For issues or feature requests specific to this module, please open an issue in the repository.
Ensure any contributions align with the Lumen Terraform standards and pass pre-commit checks.
Consider addressing the "Critical Issues" mentioned above as a priority for contributions.