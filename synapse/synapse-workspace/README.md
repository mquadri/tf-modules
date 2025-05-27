# tf-modules-azure-synapse-workspace
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_synapse_workspace.synapse0000](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_admin_login"></a> [aad\_admin\_login](#input\_aad\_admin\_login) | The login name of the Azure AD Administrator of this Synapse Workspace. | `any` | n/a | yes |
| <a name="input_aad_admin_object_id"></a> [aad\_admin\_object\_id](#input\_aad\_admin\_object\_id) | The object id of the Azure AD Administrator of this Synapse Workspace. | `any` | n/a | yes |
| <a name="input_azurerm_storage_account_data_lake_name"></a> [azurerm\_storage\_account\_data\_lake\_name](#input\_azurerm\_storage\_account\_data\_lake\_name) | The data lake storage account name. | `any` | n/a | yes |
| <a name="input_azurerm_synapse_workspace_name"></a> [azurerm\_synapse\_workspace\_name](#input\_azurerm\_synapse\_workspace\_name) | Specifies the name which should be used for this synapse Workspace. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the Azure Region where the synapse Workspace should exist. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_managed_virtual_network_enabled"></a> [managed\_virtual\_network\_enabled](#input\_managed\_virtual\_network\_enabled) | Is Virtual Network enabled for all computes in this workspace. Changing this forces a new resource to be created. | `string` | `"true"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the name of the Resource Group where the synapse Workspace should exist. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_sql_administrator_login"></a> [sql\_administrator\_login](#input\_sql\_administrator\_login) | Specifies The Login Name of the SQL administrator. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_sql_administrator_login_password"></a> [sql\_administrator\_login\_password](#input\_sql\_administrator\_login\_password) | The Password associated with the sql\_administrator\_login for the SQL administrator. | `any` | n/a | yes |
| <a name="input_sql_identity_control_enabled"></a> [sql\_identity\_control\_enabled](#input\_sql\_identity\_control\_enabled) | Are pipelines (running as workspace's system assigned identity) allowed to access SQL pools? | `bool` | `true` | no |
| <a name="input_synapse_storage_container_name"></a> [synapse\_storage\_container\_name](#input\_synapse\_storage\_container\_name) | The name of the Data Lake Gen2 File System which should be created within the Storage Account. Must be unique within the storage account the queue is located. Changing this forces a new resource to be created. | `string` | `"synapsecontainer"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Synapse Workspace. |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | The Principal ID for the Service Principal associated with the Managed Service Identity of this App Service. |
<!-- END_TF_DOCS -->