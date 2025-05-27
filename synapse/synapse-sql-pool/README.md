# tf-modules-azure-synapse-sql-pool
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_synapse_sql_pool.synapsesqlpool0000](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_sql_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_synapse_sql_pool_name"></a> [azurerm\_synapse\_sql\_pool\_name](#input\_azurerm\_synapse\_sql\_pool\_name) | The name which should be used for this Synapse Sql Pool. Changing this forces a new synapse SqlPool to be created. | `any` | n/a | yes |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | Specifies how to create the Sql Pool. Valid values are: Default, Recovery or PointInTimeRestore. Must be Default to create a new database. Defaults to Default. | `string` | `"Default"` | no |
| <a name="input_data_encrypted"></a> [data\_encrypted](#input\_data\_encrypted) | Is transparent data encryption enabled? Defaults to true. | `bool` | `true` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for this Synapse Sql Pool. Possible values are DW100c, DW200c, DW300c, DW400c, DW500c, DW1000c, DW1500c, DW2000c, DW2500c, DW3000c, DW5000c, DW6000c, DW7500c, DW10000c, DW15000c or DW30000c. | `any` | n/a | yes |
| <a name="input_synapse_workspace_id"></a> [synapse\_workspace\_id](#input\_synapse\_workspace\_id) | The ID of Synapse Workspace within which this Sql Pool should be created. Changing this forces a new Synapse Sql Pool to be created. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->