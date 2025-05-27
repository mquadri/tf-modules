<!-- BEGIN_TF_DOCS -->


<!-- markdownlint-disable MD033 -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.2, < 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.25.0, < 5.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_connection_monitor.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_connection_monitor) | resource |

<!-- markdownlint-disable MD013 -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_destination_endpoint_address"></a> [destination\_endpoint\_address](#input\_destination\_endpoint\_address) | The address of the destination endpoint. | `string` | n/a | yes |
| <a name="input_destination_endpoint_coverage_level"></a> [destination\_endpoint\_coverage\_level](#input\_destination\_endpoint\_coverage\_level) | The coverage level of the destination endpoint. | `string` | n/a | yes |
| <a name="input_destination_endpoint_name"></a> [destination\_endpoint\_name](#input\_destination\_endpoint\_name) | The name of the destination endpoint. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Network Connection Monitor should exist. | `string` | n/a | yes |
| <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration) | The migration tag used. | `string` | n/a | yes |
| <a name="input_network_connection_monitor_name"></a> [network\_connection\_monitor\_name](#input\_network\_connection\_monitor\_name) | The name of the Network Connection Monitor. | `string` | n/a | yes |
| <a name="input_network_watcher_id"></a> [network\_watcher\_id](#input\_network\_watcher\_id) | The ID of the Network Watcher. | `string` | n/a | yes |
| <a name="input_source_endpoint_address"></a> [source\_endpoint\_address](#input\_source\_endpoint\_address) | The address of the source endpoint. | `string` | n/a | yes |
| <a name="input_source_endpoint_coverage_level"></a> [source\_endpoint\_coverage\_level](#input\_source\_endpoint\_coverage\_level) | The coverage level of the source endpoint. | `string` | n/a | yes |
| <a name="input_source_endpoint_name"></a> [source\_endpoint\_name](#input\_source\_endpoint\_name) | The name of the source endpoint. | `string` | n/a | yes |
| <a name="input_destination_endpoint_excluded_ip_addresses"></a> [destination\_endpoint\_excluded\_ip\_addresses](#input\_destination\_endpoint\_excluded\_ip\_addresses) | The excluded IP addresses for the destination endpoint. | `list(string)` | `[]` | no |
| <a name="input_destination_endpoint_included_ip_addresses"></a> [destination\_endpoint\_included\_ip\_addresses](#input\_destination\_endpoint\_included\_ip\_addresses) | The included IP addresses for the destination endpoint. | `list(string)` | `[]` | no |
| <a name="input_destination_endpoint_target_resource_id"></a> [destination\_endpoint\_target\_resource\_id](#input\_destination\_endpoint\_target\_resource\_id) | The target resource ID of the destination endpoint. | `string` | `null` | no |
| <a name="input_destination_endpoint_target_resource_type"></a> [destination\_endpoint\_target\_resource\_type](#input\_destination\_endpoint\_target\_resource\_type) | The target resource type of the destination endpoint. | `string` | `null` | no |
| <a name="input_notes"></a> [notes](#input\_notes) | The description of the Network Connection Monitor. | `string` | `null` | no |
| <a name="input_output_workspace_resource_ids"></a> [output\_workspace\_resource\_ids](#input\_output\_workspace\_resource\_ids) | A list of IDs of the Log Analytics Workspace which will accept the output from the Network Connection Monitor. | `list(string)` | `[]` | no |
| <a name="input_source_endpoint_excluded_ip_addresses"></a> [source\_endpoint\_excluded\_ip\_addresses](#input\_source\_endpoint\_excluded\_ip\_addresses) | The excluded IP addresses for the source endpoint. | `list(string)` | `[]` | no |
| <a name="input_source_endpoint_included_ip_addresses"></a> [source\_endpoint\_included\_ip\_addresses](#input\_source\_endpoint\_included\_ip\_addresses) | The included IP addresses for the source endpoint. | `list(string)` | `[]` | no |
| <a name="input_source_endpoint_target_resource_id"></a> [source\_endpoint\_target\_resource\_id](#input\_source\_endpoint\_target\_resource\_id) | The target resource ID of the source endpoint. | `string` | `null` | no |
| <a name="input_source_endpoint_target_resource_type"></a> [source\_endpoint\_target\_resource\_type](#input\_source\_endpoint\_target\_resource\_type) | The target resource type of the source endpoint. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the Network Connection Monitor. | `map(string)` | `{}` | no |
| <a name="input_test_configurations"></a> [test\_configurations](#input\_test\_configurations) | A map of test configuration details | <pre>map(object({<br/>    name                                        = string<br/>    protocol                                    = string<br/>    test_frequency_in_seconds                   = number<br/>    preferred_ip_version                        = string<br/>    success_threshold_checks_failed_percent     = number<br/>    success_threshold_round_trip_time_ms        = number<br/>    http_configuration_method                   = string<br/>    http_configuration_path                     = string<br/>    http_configuration_port                     = number<br/>    http_configuration_valid_status_code_ranges = list(string)<br/>    http_configuration_prefer_https             = bool<br/>    http_configuration_request_header           = map(string)<br/>    icmp_configuration_trace_route_enabled      = bool<br/>    tcp_configuration_port                      = number<br/>    tcp_configuration_trace_route_enabled       = bool<br/>    tcp_configuration_destination_port_behavior = string<br/>  }))</pre> | `{}` | no |
| <a name="input_test_groups"></a> [test\_groups](#input\_test\_groups) | A map of test group configurations | <pre>map(object({<br/>    name                     = string<br/>    destination_endpoints    = list(string)<br/>    source_endpoints         = list(string)<br/>    test_configuration_names = list(string)<br/>    enabled                  = bool<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_connection_monitor_id"></a> [network\_connection\_monitor\_id](#output\_network\_connection\_monitor\_id) | The ID of the Network Connection Monitor. |

## Modules

No modules.

<!-- END_TF_DOCS -->