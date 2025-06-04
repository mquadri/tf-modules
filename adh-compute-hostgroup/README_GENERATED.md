## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |
| <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) | ~> 0.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-dedicated_host_group"></a> [avm-dedicated\_host\_group](#module\_avm-dedicated\_host\_group) | Azure/avm-res-compute-hostgroup/azurerm | 0.1.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_automatic_placement_enabled"></a> [automatic\_placement\_enabled](#input\_automatic\_placement\_enabled) | Specifies whether automatic placement is enabled. | `bool` | n/a | yes |
| <a name="input_dedicated_host_group_name"></a> [dedicated\_host\_group\_name](#input\_dedicated\_host\_group\_name) | The name of the dedicated host group. | `string` | n/a | yes |
| <a name="input_dedicated_hosts"></a> [dedicated\_hosts](#input\_dedicated\_hosts) | A map of dedicated hosts. | <pre>map(object({<br>    name                    = string<br>    platform_fault_domain   = number<br>    sku_name                = string<br>    auto_replace_on_failure = bool<br>    license_type            = string<br>    tags                    = optional(map(string))<br>  }))</pre> | n/a | yes |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | Specifies whether telemetry is enabled. | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the resources. | `string` | n/a | yes |
| <a name="input_mal_id"></a> [mal\_id](#input\_mal\_id) | The MAL ID for tagging purposes. | `string` | `""` | no |
| <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration) | The migration tag used. | `string` | n/a | yes |
| <a name="input_platform_fault_domain_count"></a> [platform\_fault\_domain\_count](#input\_platform\_fault\_domain\_count) | The number of fault domains that the host group can span. | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone of the dedicated host group. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the Dedicated Host Group |
| <a name="output_resource"></a> [resource](#output\_resource) | All atrributes of the Dedicated Host group |
