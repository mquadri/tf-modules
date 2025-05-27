<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 1.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.89.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | ~> 1.15 |
| <a name="provider_azurerm.main"></a> [azurerm.main](#provider\_azurerm.main) | >=3.89.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.reserved-instances](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | `"01"` | no |
| <a name="input_applied_scope_type"></a> [applied\_scope\_type](#input\_applied\_scope\_type) | The applied scope type for the reservation order. (Single/Shared) | `string` | `"Single"` | no |
| <a name="input_applied_scopes"></a> [applied\_scopes](#input\_applied\_scopes) | List of the scopes that the benefit will be applied. | `list(string)` | `null` | no |
| <a name="input_appname"></a> [appname](#input\_appname) | The name of the application. | `string` | n/a | yes |
| <a name="input_billing_plan"></a> [billing\_plan](#input\_billing\_plan) | The billing plan for the reservation order. (Monthly/Upfront) | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the reservation order. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment (e.g., dev, prod). | `string` | n/a | yes |
| <a name="input_instance_flexibility"></a> [instance\_flexibility](#input\_instance\_flexibility) | Turning this on will apply the reservation discount to other VMs in the same VM size group. Only specify for VirtualMachines reserved resource type.(On/Off) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the reservation order. | `string` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | The ID of the azure resource in which this resource is created. | `string` | `null` | no |
| <a name="input_quantity"></a> [quantity](#input\_quantity) | The quantity for the reservation order. | `number` | n/a | yes |
| <a name="input_renew"></a> [renew](#input\_renew) | Whether to renew the reservation order. | `bool` | n/a | yes |
| <a name="input_reserved_resource_type"></a> [reserved\_resource\_type](#input\_reserved\_resource\_type) | The reserved resource type for the reservation order. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | The type of the resource. | `string` | `"ri"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the reservation order. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The ID of the subscription. | `string` | n/a | yes |
| <a name="input_term"></a> [term](#input\_term) | The term for the reservation order.(P1Y/P3Y/P5Y) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_reservation_order_id"></a> [reservation\_order\_id](#output\_reservation\_order\_id) | The ID of the reservation order. |
| <a name="output_reservation_order_name"></a> [reservation\_order\_name](#output\_reservation\_order\_name) | The name of the reservation order. |
<!-- END_TF_DOCS -->