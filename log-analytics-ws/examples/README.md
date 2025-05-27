<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >= 1.4.0, < 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.7.0, < 4.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.7.0, < 4.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_diagnostics_setting_setup"></a> [diagnostics\_setting\_setup](#module\_diagnostics\_setting\_setup) | ../../diagnostic-setting | n/a |
| <a name="module_law"></a> [law](#module\_law) | ../ | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_private_dns_zone.ampls](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_resource_group.rgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.analytics_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | `""` | no |
| <a name="input_appfunction"></a> [appfunction](#input\_appfunction) | app function | `string` | `""` | no |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | `""` | no |
| <a name="input_costallocation"></a> [costallocation](#input\_costallocation) | can only be sharedcosts or chargeback | `string` | `""` | no |
| <a name="input_costappownermanager"></a> [costappownermanager](#input\_costappownermanager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costappownertech"></a> [costappownertech](#input\_costappownertech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | `""` | no |
| <a name="input_costbudgetowner"></a> [costbudgetowner](#input\_costbudgetowner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costcostcenter"></a> [costcostcenter](#input\_costcostcenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_costdivision"></a> [costdivision](#input\_costdivision) | cost division | `string` | `""` | no |
| <a name="input_costvp"></a> [costvp](#input\_costvp) | The cost vp for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Set this to true if a new RG is required. | `bool` | `false` | no |
| <a name="input_diagnostics_settings_name"></a> [diagnostics\_settings\_name](#input\_diagnostics\_settings\_name) | The diagnostics setting name of the resource on. | `string` | n/a | yes |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting) | To define if Diagnostic setting should be enabled or not | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_excluded_log_categories"></a> [excluded\_log\_categories](#input\_excluded\_log\_categories) | List of log categories to exclude. | `list(string)` | `[]` | no |
| <a name="input_excluded_log_category_groups"></a> [excluded\_log\_category\_groups](#input\_excluded\_log\_category\_groups) | List of log categorie groups to exclude. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the resources should be deployed. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_analytics_workspace_internet_ingestion_enabled"></a> [log\_analytics\_workspace\_internet\_ingestion\_enabled](#input\_log\_analytics\_workspace\_internet\_ingestion\_enabled) | This variable is to enable/disable LAW internet ingestion | `bool` | `false` | no |
| <a name="input_log_analytics_workspace_internet_query_enabled"></a> [log\_analytics\_workspace\_internet\_query\_enabled](#input\_log\_analytics\_workspace\_internet\_query\_enabled) | This variable is to enable/disable LAW internet query | `bool` | `false` | no |
| <a name="input_log_analytics_workspace_local_authentication_disabled"></a> [log\_analytics\_workspace\_local\_authentication\_disabled](#input\_log\_analytics\_workspace\_local\_authentication\_disabled) | This variable is to enable/disable LAW local authentication | `bool` | `false` | no |
| <a name="input_log_analytics_workspace_retention_in_days"></a> [log\_analytics\_workspace\_retention\_in\_days](#input\_log\_analytics\_workspace\_retention\_in\_days) | The Log analytics workspace retention in days | `string` | `null` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | The SKU for Log analytics workspace. | `string` | `null` | no |
| <a name="input_log_categories"></a> [log\_categories](#input\_log\_categories) | List of log categories. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_log_category_groups"></a> [log\_category\_groups](#input\_log\_category\_groups) | List of log categorie groups. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_metric_categories"></a> [metric\_categories](#input\_metric\_categories) | List of metric categories. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_monitor_private_link_scope_name"></a> [monitor\_private\_link\_scope\_name](#input\_monitor\_private\_link\_scope\_name) | The name of the Monitor Private Link Scope. | `string` | `null` | no |
| <a name="input_monitor_private_link_scoped_service_name"></a> [monitor\_private\_link\_scoped\_service\_name](#input\_monitor\_private\_link\_scoped\_service\_name) | The name of the service to connect to the Monitor Private Link Scope. | `string` | `null` | no |
| <a name="input_monthlybudget"></a> [monthlybudget](#input\_monthlybudget) | monthly budget | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of Log analytics workspace | `string` | `null` | no |
| <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name) | The Subnet name attached to private endpoint | `string` | n/a | yes |
| <a name="input_private_dns_rg"></a> [private\_dns\_rg](#input\_private\_dns\_rg) | The name of the RG in which the private dns zones are present. | `string` | `null` | no |
| <a name="input_private_dns_zones_names"></a> [private\_dns\_zones\_names](#input\_private\_dns\_zones\_names) | A list of private DNS zone names | `set(string)` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group where the resources will be deployed. | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | `""` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The Storage account name. | `string` | `null` | no |
| <a name="input_storage_account_rg_name"></a> [storage\_account\_rg\_name](#input\_storage\_account\_rg\_name) | The Storage account RG name | `string` | `null` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Subscription ID | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The VNET name attached to private endpoint | `string` | n/a | yes |
| <a name="input_virtual_network_rg"></a> [virtual\_network\_rg](#input\_virtual\_network\_rg) | The VNET RG name attached to private endpoint | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_endpoints"></a> [private\_endpoints](#output\_private\_endpoints) | private\_endpoints |
| <a name="output_resource"></a> [resource](#output\_resource) | Resource list of Log analytics workspace |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | Id of Log Analytics resource in Azure. |
<!-- END_TF_DOCS -->