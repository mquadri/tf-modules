<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 1.15 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_hdinsight_spark_cluster.spark_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/hdinsight_spark_cluster) | resource |
| [azurerm_key_vault_secret.spark_gateway_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.spark_nodes_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [random_password.spark_gateway_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.spark_nodes_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Specifies the Version of HDInsights which should be used for this Cluster. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_encryption_in_transit_enabled"></a> [encryption\_in\_transit\_enabled](#input\_encryption\_in\_transit\_enabled) | Boolean flag to specify whether encryption in transit is enabled for this Cluster. Changing this forces a new resource to be created. Defaults to false | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_head_node_vm_size"></a> [head\_node\_vm\_size](#input\_head\_node\_vm\_size) | The Size of the Virtual Machine which should be used as the Head Nodes. | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | Specifies the id of the Key Vault resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | allow override of the HDInsight Spark Cluster name | `string` | `null` | no |
| <a name="input_network_connection_direction"></a> [network\_connection\_direction](#input\_network\_connection\_direction) | The direction of the resource provider connection. Possible values include Inbound or Outbound. Defaults to Inbound. | `string` | `"Inbound"` | no |
| <a name="input_network_private_link_enabled"></a> [network\_private\_link\_enabled](#input\_network\_private\_link\_enabled) | Boolean flag to specify whether the private link is enabled. Possible values include true or false. Defaults to false. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name for where HDInsight Spark Cluster will be deployed | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_spark_version"></a> [spark\_version](#input\_spark\_version) | The version of Spark which should be used for this HDInsight Spark Cluster. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | Specifies the Tier which should be used for this HDInsight Spark Cluster. Possible values are Standard or Premium. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_tls_min_version"></a> [tls\_min\_version](#input\_tls\_min\_version) | The minimal supported TLS version. Possible values are 1.0, 1.1 or 1.2. Changing this forces a new resource to be created. | `string` | `"1.2"` | no |
| <a name="input_worker_node_instance_count"></a> [worker\_node\_instance\_count](#input\_worker\_node\_instance\_count) | The number of instances which should be run for the Worker Nodes. | `number` | `1` | no |
| <a name="input_worker_node_vm_size"></a> [worker\_node\_vm\_size](#input\_worker\_node\_vm\_size) | The Size of the Virtual Machine which should be used as the Worker Nodes. | `string` | n/a | yes |
| <a name="input_zookeeper_node_vm_size"></a> [zookeeper\_node\_vm\_size](#input\_zookeeper\_node\_vm\_size) | The Size of the Virtual Machine which should be used as the Zookeeper Nodes. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the HDInsight Spark Cluster. |
| <a name="output_https_endpoint"></a> [https\_endpoint](#output\_https\_endpoint) | The HTTPS Connectivity Endpoint for this HDInsight Spark Cluster. |
| <a name="output_spark_nodes_credentials_secret"></a> [spark\_nodes\_credentials\_secret](#output\_spark\_nodes\_credentials\_secret) | The secret ID for the spark nodes credentials stored in the key vault. |
| <a name="output_ssh_endpoint"></a> [ssh\_endpoint](#output\_ssh\_endpoint) | The SSH Connectivity Endpoint for this HDInsight Spark Cluster. |
| <a name="output_stark_gateway_credentials_secret"></a> [stark\_gateway\_credentials\_secret](#output\_stark\_gateway\_credentials\_secret) | The secret ID for the spark gateway credentials stored in the key vault. |
<!-- END_TF_DOCS -->