<!-- BEGIN_TF_DOCS -->

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.71.0)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_management_lock.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [azurerm\_name](#input\_name) | The name of the lock. | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope which the lock is to applied | `string` | n/a | yes |
| <a name="input_lock_level"></a> [lock\_level](#input\_lock\_level) | Kind of the lock can be either CanNotDelete or ReadOnly | `string` | CanNotDelete | yes |
| <a name="input_notes"></a> [notes](#input\_notes) | Description for the lock | `string` | `null` | no |



## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |

<!-- END_TF_DOCS -->