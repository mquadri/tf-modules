<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_azurerm.management"></a> [azurerm.management](#provider\_azurerm.management) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kusto_cluster.dec-cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster) | resource |
| [azurerm_network_security_group.dec](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_private_dns_cname_record.dec](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_cname_record) | resource |
| [azurerm_private_dns_cname_record.dec-ingestion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_cname_record) | resource |
| [azurerm_private_endpoint.dec](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_route_table.dec](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet.private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_private_dns_zone.db_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_resource_group.dec-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.vnet-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.pe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_auto_stop_enabled"></a> [auto\_stop\_enabled](#input\_auto\_stop\_enabled) | auto stop enabled | `bool` | `true` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | capacity | `number` | n/a | yes |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_double_encryption_enabled"></a> [double\_encryption\_enabled](#input\_double\_encryption\_enabled) | double encryption enabled | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_int_address_prefixes"></a> [int\_address\_prefixes](#input\_int\_address\_prefixes) | prefix for the private subnet | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_optimized_auto_scale"></a> [optimized\_auto\_scale](#input\_optimized\_auto\_scale) | optimized auto scale block | <pre>object({<br>    minimum = number<br>    maximum = number<br>  })</pre> | `null` | no |
| <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name) | subnet name for private endpoint subnet | `string` | n/a | yes |
| <a name="input_private_dns_rg"></a> [private\_dns\_rg](#input\_private\_dns\_rg) | private dns zone resource group | `string` | `"rg-dns_infrastructure"` | no |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | private dns zone name to add a record to. | `string` | `"privatelink.azuredatabricks.net"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | public network access enabled | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name for where databrocks will be deployed | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | sku name | `string` | `"Dev(No SLA)_Standard_E2a_v4"` | no |
| <a name="input_streaming_ingestion_enabled"></a> [streaming\_ingestion\_enabled](#input\_streaming\_ingestion\_enabled) | streaming ingestion enabled | `bool` | `true` | no |
| <a name="input_user_identities"></a> [user\_identities](#input\_user\_identities) | user identities | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | name of the vnet to deploy databricks to | `string` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | resource group name where to deploy Databricks | `string` | n/a | yes |
| <a name="input_workspace_cname"></a> [workspace\_cname](#input\_workspace\_cname) | workspace dns cname | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | availability zones | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_explorer_id"></a> [data\_explorer\_id](#output\_data\_explorer\_id) | ID of the Data Explorer cluster |
| <a name="output_data_explorer_ingestion_uri"></a> [data\_explorer\_ingestion\_uri](#output\_data\_explorer\_ingestion\_uri) | URI of the Data Explorer cluster ingestion |
| <a name="output_data_explorer_uri"></a> [data\_explorer\_uri](#output\_data\_explorer\_uri) | URI of the Data Explorer cluster |
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | ID of the new NSG |
| <a name="output_nsg_name"></a> [nsg\_name](#output\_nsg\_name) | Name of the new NSG |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | ID of the resource group |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Name of the resource group |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | ID of the new route table |
<!-- END_TF_DOCS -->