<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9, < 2.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.1.1, < 4.0.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

The following resources are used by this module:

- **azurerm_dedicated_host.this** (resource)
- **azurerm_dedicated_host_group.this** (resource)
- **azurerm_resource_group.this** (resource)
- **modtm_telemetry.telemetry** (resource)
- **random_uuid.telemetry** (resource)
- **azurerm_client_config.telemetry** (data source)
- **modtm_module_source.telemetry** (data source)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dedicated_host_group_name"></a> [dedicated\_host\_group\_name](#input\_dedicated\_host\_group\_name) | The name of the dedicated host group | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the dedicated host group is created | `string` | n/a | yes |
| <a name="input_platform_fault_domain_count"></a> [platform\_fault\_domain\_count](#input\_platform\_fault\_domain\_count) | The number of fault domains that the host group can span | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the dedicated host group | `string` | n/a | yes |
| <a name="input_automatic_placement_enabled"></a> [automatic\_placement\_enabled](#input\_automatic\_placement\_enabled) | Should the virtual machines be placed automatically on the dedicated hosts in the group | `bool` | `false` | no |
| <a name="input_dedicated_hosts"></a> [dedicated\_hosts](#input\_dedicated\_hosts) | Map of dedicated hosts to create within the host group | `map(any)` | n/a | yes |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | Enable telemetry for the module | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources | `map(string)` | `{}` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone in which to create the dedicated host group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dedicated_host_group_id"></a> [dedicated\_host\_group\_id](#output\_dedicated\_host\_group\_id) | The ID of the dedicated host group |
| <a name="output_dedicated_hosts"></a> [dedicated\_hosts](#output\_dedicated\_hosts) | A map of the dedicated hosts created in the host group |
| <a name="output_resource"></a> [output\_resource](#output\_output\_resource) | A map of All atrributes of the Dedicated Host group |

<!-- END_TF_DOCS -->

# terraform-azurerm-avm-res-compute-hostgroup

This Terraform module deploys dedicated host groups in Azure. It wraps the `Azure/avm-res-compute-hostgroup/azurerm` AVM module and applies Lumen-standard mandatory tags (`app_id`, `environment`, `msftmigration`, `mal_id`).

## Prerequisites

*   Azure Subscription.
*   Resource Group (this module can create one or use an existing one).
*   Appropriate permissions to create resources.

## Contributing

Please refer to the main repository's contribution guidelines. For issues or feature requests specific to this module, please open an issue in the repository.
Ensure any contributions align with the Lumen Terraform standards and pass pre-commit checks.

