## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ce-sub-enhablement-shared-poc-01"></a> [ce-sub-enhablement-shared-poc-01](#module\_ce-sub-enhablement-shared-poc-01) | ../cost-management-export | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the cost management export | `string` | n/a | yes |
| <a name="input_recurrence_period_end_date"></a> [recurrence\_period\_end\_date](#input\_recurrence\_period\_end\_date) | The end date of the recurrence period | `string` | n/a | yes |
| <a name="input_recurrence_period_start_date"></a> [recurrence\_period\_start\_date](#input\_recurrence\_period\_start\_date) | The start date of the recurrence period | `string` | n/a | yes |
| <a name="input_recurrence_type"></a> [recurrence\_type](#input\_recurrence\_type) | How often the requested information will be exported. Valid values include Annually, Daily, Monthly, Weekly | `string` | n/a | yes |
| <a name="input_root_folder_path"></a> [root\_folder\_path](#input\_root\_folder\_path) | The root folder path for the export data | `string` | n/a | yes |
| <a name="input_time_frame"></a> [time\_frame](#input\_time\_frame) | The time frame of the export data | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The type of the query. Possible values are ActualCost, AmortizedCost and Usage | `string` | n/a | yes |

## Outputs

No outputs.
