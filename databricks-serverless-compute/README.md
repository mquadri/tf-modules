
:warning: In order to use this it requires that the Databricks Account have the Serverless enabled.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | n/a |
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |
| <a name="provider_validation"></a> [validation](#provider\_validation) | ~> 1.1.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_update_resource.approval](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/update_resource) | resource |
| [azapi_update_resource.approval_mysql](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/update_resource) | resource |
| [azapi_update_resource.approval_sql_server](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/update_resource) | resource |
| [databricks_mws_ncc_binding.ncc_binding](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/mws_ncc_binding) | resource |
| [databricks_mws_ncc_private_endpoint_rule.mysql](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/mws_ncc_private_endpoint_rule) | resource |
| [databricks_mws_ncc_private_endpoint_rule.sql_server](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/mws_ncc_private_endpoint_rule) | resource |
| [databricks_mws_ncc_private_endpoint_rule.storage](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/mws_ncc_private_endpoint_rule) | resource |
| [time_sleep.wait_10_min_for_ncc_config](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [validation_warning.private_endpoint_rules](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) | resource |
| [azapi_resource_list.private_endpoint_connections](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource_list) | data source |
| [azapi_resource_list.private_endpoint_connections_mysql](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource_list) | data source |
| [azapi_resource_list.private_endpoint_connections_sql](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource_list) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databricks_workspace_id"></a> [databricks\_workspace\_id](#input\_databricks\_workspace\_id) | The Databricks workspace ID | `number` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_private_endpoint_rules_mysql"></a> [private\_endpoint\_rules\_mysql](#input\_private\_endpoint\_rules\_mysql) | A list of the mysql\_ids that will be connected to the Databricks workspace. | `list(string)` | `[]` | no |
| <a name="input_private_endpoint_rules_sql_server"></a> [private\_endpoint\_rules\_sql\_server](#input\_private\_endpoint\_rules\_sql\_server) | A list of the sql\_server\_ids that will be connected to the Databricks workspace. | `list(string)` | `[]` | no |
| <a name="input_private_endpoint_rules_storage"></a> [private\_endpoint\_rules\_storage](#input\_private\_endpoint\_rules\_storage) | A map of the storage\_ids and scopes for the storage accounts that will be connected to the Databricks workspace.<br><br>- `resource_id` - The Azure resource ID of the target storage account<br>- `group_id` - The sub-resource type (group ID) of the target resource. Must be one of blob or dfs. Note that to connect to workspace root storage (root DBFS), you need two endpoints, one for blob and one for dfs. Change forces creation of a new resource. | <pre>map(object({<br>    resource_id = string<br>    group_id    = string<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ncc_data"></a> [ncc\_data](#output\_ncc\_data) | n/a |
| <a name="output_network_connectivity_config_id"></a> [network\_connectivity\_config\_id](#output\_network\_connectivity\_config\_id) | Network Connectivity Config ID |
| <a name="output_private_endpoint_mysql_rules"></a> [private\_endpoint\_mysql\_rules](#output\_private\_endpoint\_mysql\_rules) | n/a |
| <a name="output_private_endpoint_sql_server_rules"></a> [private\_endpoint\_sql\_server\_rules](#output\_private\_endpoint\_sql\_server\_rules) | n/a |
| <a name="output_private_endpoint_storage_rules"></a> [private\_endpoint\_storage\_rules](#output\_private\_endpoint\_storage\_rules) | n/a |
<!-- END_TF_DOCS -->