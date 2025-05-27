# tf-modules-azure-synapse-spark-pool
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
| [azurerm_synapse_spark_pool.synapsesparkpool0](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_spark_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delay_in_minutes"></a> [delay\_in\_minutes](#input\_delay\_in\_minutes) | Number of minutes of idle time before the Spark Pool is automatically paused. Must be between 5 and 10080. | `string` | `"15"` | no |
| <a name="input_max_node_count"></a> [max\_node\_count](#input\_max\_node\_count) | The maximum number of nodes the Spark Pool can support. Must be between 3 and 200. | `string` | `"50"` | no |
| <a name="input_min_node_count"></a> [min\_node\_count](#input\_min\_node\_count) | The minimum number of nodes in the Spark Pool. | `string` | `"3"` | no |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | The minimum number of nodes the Spark Pool can support. Must be between 3 and 200. | `string` | `"Small"` | no |
| <a name="input_node_size_family"></a> [node\_size\_family](#input\_node\_size\_family) | The kind of nodes that the Spark Pool provides. Possible value is MemoryOptimized. | `string` | `"MemoryOptimized"` | no |
| <a name="input_synapse_spark_pool_name"></a> [synapse\_spark\_pool\_name](#input\_synapse\_spark\_pool\_name) | The name which should be used for this Synapse Spark Pool. Changing this forces a new Synapse Spark Pool to be created. | `any` | n/a | yes |
| <a name="input_synapse_workspace_id"></a> [synapse\_workspace\_id](#input\_synapse\_workspace\_id) | The ID of the Synapse Workspace where the Synapse Spark Pool should exist. Changing this forces a new Synapse Spark Pool to be created. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->