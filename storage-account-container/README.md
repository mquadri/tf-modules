<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >= 1.15.0, < 2.3.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_container.newcontainer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private. | `string` | `"private"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the Storage Account where the Container should be created. | `any` | n/a | yes |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | The name of the Container which should be created within the Storage Account. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_has_immutability_policy"></a> [has\_immutability\_policy](#output\_has\_immutability\_policy) | Is there an Immutability Policy configured on this Storage Container? |
| <a name="output_has_legal_hold"></a> [has\_legal\_hold](#output\_has\_legal\_hold) | Is there a Legal Hold configured on this Storage Container? |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Container. |
| <a name="output_name"></a> [name](#output\_name) | The name of the created resource group. |
| <a name="output_resource_manager_id"></a> [resource\_manager\_id](#output\_resource\_manager\_id) | The Resource Manager ID of this Storage Container. |
<!-- END_TF_DOCS -->