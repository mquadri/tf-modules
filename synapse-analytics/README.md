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
| <a name="provider_azurerm.management"></a> [azurerm.management](#provider\_azurerm.management) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.synw_pwd](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_private_dns_zone_virtual_network_link.zone_dev_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.zone_sql_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.pe_dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.pe_sql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.pe_sqlondemand](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.pe_web](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_synapse_private_link_hub.syn_web](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_private_link_hub) | resource |
| [azurerm_synapse_sql_pool.sql_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_sql_pool) | resource |
| [azurerm_synapse_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.username](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_private_dns_zone.syn_dev_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.syn_sql_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.syn_web_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.vnet-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.pe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | Specifies the name of the local administrator account. | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unique. If the vault is in a recoverable state then the vault will need to be purged before reusing the name. | `string` | n/a | yes |
| <a name="input_key_vault_resource_group_name"></a> [key\_vault\_resource\_group\_name](#input\_key\_vault\_resource\_group\_name) | The resource group name of the key vault where the customer managed key is stored | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name) | subnet name for private endpoint subnet | `string` | n/a | yes |
| <a name="input_private_dns_dev_zone_name"></a> [private\_dns\_dev\_zone\_name](#input\_private\_dns\_dev\_zone\_name) | The name of the private dns zone to link to the synapse private endpoint for dev | `string` | `"privatelink.dev.azuresynapse.net"` | no |
| <a name="input_private_dns_rg"></a> [private\_dns\_rg](#input\_private\_dns\_rg) | The resource group name of the private dns zone to link to the synapse private endpoint | `string` | n/a | yes |
| <a name="input_private_dns_sql_zone_name"></a> [private\_dns\_sql\_zone\_name](#input\_private\_dns\_sql\_zone\_name) | The name of the private dns zone to link to the synapse private endpoint for sql | `string` | `"privatelink.sql.azuresynapse.net"` | no |
| <a name="input_private_dns_web_zone_name"></a> [private\_dns\_web\_zone\_name](#input\_private\_dns\_web\_zone\_name) | The name of the private dns zone to link to the synapse private endpoint for web | `string` | `"privatelink.azuresynapse.net"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name for where databrocks will be deployed | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_syndp_sku_name"></a> [syndp\_sku\_name](#input\_syndp\_sku\_name) | Specifies the SKU Name for this Synapse SQL Pool. Possible values are DW100c, DW200c, DW300c, DW400c, DW500c, DW1000c, DW1500c, DW2000c, DW2500c, DW3000c, DW5000c, DW6000c, DW7500c, DW10000c, DW15000c or DW30000c. | `string` | `"DW100c"` | no |
| <a name="input_syndp_storage_account_type"></a> [syndp\_storage\_account\_type](#input\_syndp\_storage\_account\_type) | The storage account type that will be used to store backups for this Synapse SQL Pool. Possible values are LRS or GRS. | `string` | `"GRS"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | name of the vnet to deploy databricks to | `string` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | resource group name where to deploy Databricks | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The administrator password for the synapse Workspace. |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The administrator username for the synapse Workspace. |
| <a name="output_credentials_secret"></a> [credentials\_secret](#output\_credentials\_secret) | The secret ID for the credentials stored in the key vault. |
| <a name="output_private_link_hub_web_id"></a> [private\_link\_hub\_web\_id](#output\_private\_link\_hub\_web\_id) | ID of the Synapse Private Link Hub for web. |
| <a name="output_sql_pool_id"></a> [sql\_pool\_id](#output\_sql\_pool\_id) | ID of the Synapse SQL Pool. |
| <a name="output_synapse_web_private_endpoint_connection"></a> [synapse\_web\_private\_endpoint\_connection](#output\_synapse\_web\_private\_endpoint\_connection) | n/a |
| <a name="output_workspace_connectivity_endpoints"></a> [workspace\_connectivity\_endpoints](#output\_workspace\_connectivity\_endpoints) | list of Connectivity endpoints for the synapse Workspace. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | ID of the synapse Workspace. |
| <a name="output_workspace_identity"></a> [workspace\_identity](#output\_workspace\_identity) | Service Principal associated with the Managed Service Identity of the synapse Workspace. |
<!-- END_TF_DOCS -->