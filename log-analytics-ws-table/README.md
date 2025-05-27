<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 1.15 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace_table.table_name](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The name of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_table_name"></a> [log\_analytics\_workspace\_table\_name](#input\_log\_analytics\_workspace\_table\_name) | The name of the Log Analytics Workspace Table. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_table_retention_in_days"></a> [log\_analytics\_workspace\_table\_retention\_in\_days](#input\_log\_analytics\_workspace\_table\_retention\_in\_days) | The retention period for the table. | `number` | n/a | yes |
| <a name="input_log_analytics_workspace_table_total_retention_in_days"></a> [log\_analytics\_workspace\_table\_total\_retention\_in\_days](#input\_log\_analytics\_workspace\_table\_total\_retention\_in\_days) | The total retention period for the table. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_analytics_workspace_table_id"></a> [log\_analytics\_workspace\_table\_id](#output\_log\_analytics\_workspace\_table\_id) | The ID of the Log Analytics Workspace Table. |
<!-- END_TF_DOCS -->