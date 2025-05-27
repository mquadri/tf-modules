<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.7.0, < 4.2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.0, < 4.0.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.7.0, < 4.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_data_collection_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_endpoint) | resource |
| [azurerm_monitor_data_collection_rule.dcr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_rule) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_sources"></a> [data\_sources](#input\_data\_sources) | Map containing various data source configurations | <pre>object({<br>    syslog = optional(list(object({<br>      facility_names = list(string),<br>      log_levels     = list(string),<br>      name           = string,<br>      streams        = list(string)<br>    })))<br>    performance_counter = optional(list(object({<br>      streams                       = list(string),<br>      sampling_frequency_in_seconds = number,<br>      counter_specifiers            = list(string),<br>      name                          = optional(string)<br>    })))<br>    windows_event_log = optional(list(object({<br>      streams        = list(string),<br>      x_path_queries = list(string),<br>      name           = optional(string)<br>    })))<br>    extension = optional(list(object({<br>      streams        = list(string),<br>      extension_name = optional(string),<br>      name           = string<br>    })))<br>    iis_log = optional(list(object({<br>      streams         = list(string),<br>      name            = string,<br>      log_directories = list(string)<br>    })))<br>    log_file = optional(list(object({<br>      format        = string,<br>      file_patterns = list(string),<br>      name          = string,<br>      streams       = list(string),<br>      settings = map(object({<br>        text = object({<br>          record_start_timestamp_format = string<br>        })<br>      }))<br>    })))<br>  })</pre> | `{}` | no |
| <a name="input_datacollection_endpoint"></a> [datacollection\_endpoint](#input\_datacollection\_endpoint) | A map of data collection endpoints | <pre>map(object({<br>    monitor_data_collection_endpoint_name        = string<br>    monitor_data_collection_endpoint_kind        = string<br>    monitor_data_collection_endpoint_description = string<br>  }))</pre> | n/a | yes |
| <a name="input_monitor_data_collection_rule"></a> [monitor\_data\_collection\_rule](#input\_monitor\_data\_collection\_rule) | Map containing log analytics data export rules | <pre>map(object({<br>    rule_name                     = string<br>    dcr_rg_name                   = string<br>    description                   = string<br>    log_analytics_name            = string<br>    data_collection_endpoint_name = string // Name of the Azure monitor data collection endpoint<br>    log_analytics_id              = string<br>    kind                          = string<br>    public_network_access_enabled = optional(bool, false)<br>    streams                       = optional(list(string))<br>    destinations                  = list(string)<br>    transform_kql                 = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azuresql_server_name"></a> [azuresql\_server\_name](#output\_azuresql\_server\_name) | The id of the monitor data collection endpoint |
| <a name="output_data_collection_endpoint_name"></a> [data\_collection\_endpoint\_name](#output\_data\_collection\_endpoint\_name) | The name of the monitor data collection endpoint |
<!-- END_TF_DOCS -->