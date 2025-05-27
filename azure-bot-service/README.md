<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~>1.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.74 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.74 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_diagnostics-setting-setup"></a> [diagnostics-setting-setup](#module\_diagnostics-setting-setup) | ../diagnostic-setting | n/a |
| <a name="module_private-endpoint-setup"></a> [private-endpoint-setup](#module\_private-endpoint-setup) | ../private-endpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_bot_service_azure_bot.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bot_service_azure_bot) | resource |
| [azurerm_resource_group.rg_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

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
| <a name="input_diagnostics_settings_name"></a> [diagnostics\_settings\_name](#input\_diagnostics\_settings\_name) | The diagnostics setting name of the resource on. | `string` | `""` | no |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | The ID of the DNS zone if provided by the user | `string` | `""` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The name of the private dns zone. | `string` | n/a | yes |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting) | Choose if Diagnostic setting should be enabled | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | controls whether or not to create private endpoints | `bool` | `true` | no |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | This variable controls whether or not telemetry is enabled for the module.<br>For more information see https://aka.ms/avm/telemetryinfo.<br>If it is set to false, then no telemetry will be collected. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_excluded_log_categories"></a> [excluded\_log\_categories](#input\_excluded\_log\_categories) | List of log categories to exclude. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the Azure Bot Service will be created. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_categories"></a> [log\_categories](#input\_log\_categories) | List of log categories. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_logs_destinations_ids"></a> [logs\_destinations\_ids](#input\_logs\_destinations\_ids) | List of destination resources IDs for logs diagnostic destination.<br>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br>If you want to use Azure EventHub as destination, you must provide a formatted string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>\|</code> character. | `list(string)` | `[]` | no |
| <a name="input_metric_categories"></a> [metric\_categories](#input\_metric\_categories) | List of metric categories. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_microsoft_app_id"></a> [microsoft\_app\_id](#input\_microsoft\_app\_id) | The Microsoft App ID for the Azure Bot Service. | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records) | A map of objects where each object contains information to create a MX record. | <pre>map(object({<br>    name                = optional(string, "@")<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      preference = number<br>      exchange   = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Azure Bot Service. | `string` | `null` | no |
| <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name) | n/a | `string` | `null` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | Private Endpoints for the supported resources | <pre>map(object({<br>    name                           = string<br>    is_manual_connection           = optional(bool)<br>    private_connection_resource_id = optional(string)<br>    subresource_names              = list(string)<br>    request_message                = optional(string)<br>    private_dns_zone_group_name    = optional(string)<br>    private_dns_zone_ids           = optional(list(string))<br>  }))</pre> | `{}` | no |
| <a name="input_ptr_records"></a> [ptr\_records](#input\_ptr\_records) | A map of objects where each object contains information to create a PTR record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records             = list(string)<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Enable or disable public network access. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Azure Bot Service. | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | `"ais"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Azure Bot Service. | `string` | n/a | yes |
| <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record) | optional soa\_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com | <pre>object({<br>    email        = string<br>    expire_time  = optional(number, 2419200)<br>    minimum_ttl  = optional(number, 10)<br>    refresh_time = optional(number, 3600)<br>    retry_time   = optional(number, 300)<br>    ttl          = optional(number, 3600)<br>    tags         = optional(map(string), null)<br>  })</pre> | `null` | no |
| <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records) | A map of objects where each object contains information to create a SRV record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      priority = number<br>      weight   = number<br>      port     = number<br>      target   = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | `null` | no |
| <a name="input_txt_records"></a> [txt\_records](#input\_txt\_records) | A map of objects where each object contains information to create a TXT record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      value = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_network_links"></a> [virtual\_network\_links](#input\_virtual\_network\_links) | A map of objects where each object contains information to create a virtual network link. | <pre>map(object({<br>    vnetlinkname     = string<br>    vnetid           = string<br>    autoregistration = optional(bool, false)<br>    tags             = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | n/a | `string` | `null` | no |
| <a name="input_virtual_network_rg"></a> [virtual\_network\_rg](#input\_virtual\_network\_rg) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bot_service_id"></a> [bot\_service\_id](#output\_bot\_service\_id) | The ID of the Azure Bot Service. |
<!-- END_TF_DOCS -->