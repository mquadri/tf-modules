## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.107 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.107 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subscription_cost_management_export.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription_cost_management_export) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active"></a> [active](#input\_active) | Whether the cost management export is active | `bool` | `true` | no |
| <a name="input_container_id"></a> [container\_id](#input\_container\_id) | The resource manager ID of the storage container | `string` | n/a | yes |
| <a name="input_file_format"></a> [file\_format](#input\_file\_format) | The file format of the export | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the cost management export | `string` | n/a | yes |
| <a name="input_recurrence_period_end_date"></a> [recurrence\_period\_end\_date](#input\_recurrence\_period\_end\_date) | The end date of the recurrence period | `string` | n/a | yes |
| <a name="input_recurrence_period_start_date"></a> [recurrence\_period\_start\_date](#input\_recurrence\_period\_start\_date) | The start date of the recurrence period | `string` | n/a | yes |
| <a name="input_recurrence_type"></a> [recurrence\_type](#input\_recurrence\_type) | How often the requested information will be exported. Valid values include Annually, Daily, Monthly, Weekly. | `string` | n/a | yes |
| <a name="input_root_folder_path"></a> [root\_folder\_path](#input\_root\_folder\_path) | The root folder path for the export data | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The ID of the subscription | `string` | n/a | yes |
| <a name="input_time_frame"></a> [time\_frame](#input\_time\_frame) | The time frame of the export data | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The type of export data | `string` | `"Csv"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the cost management export |
