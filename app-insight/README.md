<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.7.0, < 4.2.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.7.0, < 4.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_appinsight"></a> [appinsight](#module\_appinsight) | Azure/avm-res-insights-component/azurerm | 0.1.4 |
| <a name="module_diagnostics-setting-setup"></a> [diagnostics-setting-setup](#module\_diagnostics-setting-setup) | ../diagnostic-setting | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_private_link_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_private_link_scope) | resource |
| [azurerm_monitor_private_link_scoped_service.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_private_link_scoped_service) | resource |
| [azurerm_log_analytics_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appinsight_name"></a> [appinsight\_name](#input\_appinsight\_name) | The name of the Application Insights resource. | `string` | n/a | yes |
| <a name="input_diagnostics_settings_name"></a> [diagnostics\_settings\_name](#input\_diagnostics\_settings\_name) | The diagnostics setting name of the resource on. | `string` | `""` | no |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting) | Choose if Diagnostic setting should be enabled | `bool` | `true` | no |
| <a name="input_enable_private_link_scope"></a> [enable\_private\_link\_scope](#input\_enable\_private\_link\_scope) | Choose if private link scope should be enabled | `bool` | `false` | no |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | Enable telemetry | `bool` | `true` | no |
| <a name="input_excluded_log_categories"></a> [excluded\_log\_categories](#input\_excluded\_log\_categories) | List of log categories to exclude. | `list(string)` | `[]` | no |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | Enable internet ingestion for Application Insights | `bool` | `true` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | Enable internet query for Application Insights | `bool` | `false` | no |
| <a name="input_local_authentication_disabled"></a> [local\_authentication\_disabled](#input\_local\_authentication\_disabled) | Disable local authentication for Application Insights | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The resource deployemnt location. | `string` | `""` | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | The name of the resource group in which the resources will be created | `string` | `""` | no |
| <a name="input_log_categories"></a> [log\_categories](#input\_log\_categories) | List of log categories. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_log_rg_name"></a> [log\_rg\_name](#input\_log\_rg\_name) | The name of the resource group for the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_metric_categories"></a> [metric\_categories](#input\_metric\_categories) | List of metric categories. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_monitor_private_link_scope"></a> [monitor\_private\_link\_scope](#input\_monitor\_private\_link\_scope) | The name of the Monitor Private Link Scope. | `string` | `null` | no |
| <a name="input_monitor_private_link_scoped_service_name"></a> [monitor\_private\_link\_scoped\_service\_name](#input\_monitor\_private\_link\_scoped\_service\_name) | The name of the service to connect to the Monitor Private Link Scope. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | n/a |
| <a name="output_resource"></a> [resource](#output\_resource) | The resource details of app insight. |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The resource id of app insight. |
<!-- END_TF_DOCS -->