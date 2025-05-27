<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.108.0 |
| <a name="provider_azurerm.management"></a> [azurerm.management](#provider\_azurerm.management) | 3.108.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.11.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_policy_vm.backup_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm) | resource |
| [azurerm_backup_protected_vm.protection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_vm) | resource |
| [azurerm_data_factory.adf](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) | resource |
| [azurerm_data_factory_integration_runtime_self_hosted.shir](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_integration_runtime_self_hosted) | resource |
| [azurerm_data_factory_linked_service_azure_sql_database.sql_linked_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_azure_sql_database) | resource |
| [azurerm_data_factory_linked_service_data_lake_storage_gen2.sa_datalake_linked](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_data_lake_storage_gen2) | resource |
| [azurerm_data_factory_linked_service_key_vault.akv_linked](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_key_vault) | resource |
| [azurerm_data_factory_linked_service_sql_server.sql_linked_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_sql_server) | resource |
| [azurerm_key_vault_access_policy.SystemAssigned_Policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.keyvaultpermissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_key.cmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_key_vault_secret.admin_creds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_managed_disk.data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.dynamic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.shir](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_policy_virtual_machine_configuration_assignment.passpolicy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_virtual_machine_configuration_assignment) | resource |
| [azurerm_private_dns_a_record.adf](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_a_record.adf-portal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_endpoint.adf-portal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.datafactory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_proximity_placement_group.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/proximity_placement_group) | resource |
| [azurerm_recovery_services_vault.recovery](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) | resource |
| [azurerm_role_assignment.cmkrole](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.storage_assigment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.cmkid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_virtual_machine_data_disk_attachment.windows](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_machine_extension.shir_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.winconfig](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_windows_virtual_machine.windows](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.username](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.windows_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [time_sleep.wait_1_minutes_akv](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait_1_minutes_id](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait_1_minutes_pass](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault.ssh_akv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_private_dns_zone.adf_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.adf_portal_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.vnet-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.diagstorage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_account.linked_sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subnet.pe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accelerated_networking"></a> [accelerated\_networking](#input\_accelerated\_networking) | Enable accelerated networking? | `bool` | `false` | no |
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_adf_high_availability_port"></a> [adf\_high\_availability\_port](#input\_adf\_high\_availability\_port) | The port for the high availability endpoint | `string` | `"8060"` | no |
| <a name="input_adf_portal_enabled"></a> [adf\_portal\_enabled](#input\_adf\_portal\_enabled) | Enable the Azure Data Factory portal | `bool` | `false` | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The admin password for the virtual machine | `string` | `""` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username for the virtual machine | `string` | `""` | no |
| <a name="input_akv_linked_id"></a> [akv\_linked\_id](#input\_akv\_linked\_id) | The id of key vault to link to the data factory | `string` | `null` | no |
| <a name="input_akv_linked_id_enabled"></a> [akv\_linked\_id\_enabled](#input\_akv\_linked\_id\_enabled) | Enable the key vault linked service, defaults to true | `bool` | `true` | no |
| <a name="input_akv_policies_deploy"></a> [akv\_policies\_deploy](#input\_akv\_policies\_deploy) | Either to deploy the key vault policies or not | `bool` | `false` | no |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The Zone in which this Virtual Machine should be created. Changing this forces a new resource to be created. | `number` | `null` | no |
| <a name="input_connection_string"></a> [connection\_string](#input\_connection\_string) | The connection string to the sql server | `string` | `null` | no |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_data_disk_caching"></a> [data\_disk\_caching](#input\_data\_disk\_caching) | The Caching of the Data Disk. Possible values are None, ReadOnly, ReadWrite. Changing this forces a new resource to be created. | `string` | `"None"` | no |
| <a name="input_data_disk_create_option"></a> [data\_disk\_create\_option](#input\_data\_disk\_create\_option) | the Create Option of the Data Disk, such as Empty or Attach. Defaults to Attach. Changing this forces a new resource to be created. | `string` | `"Empty"` | no |
| <a name="input_data_disk_enabled"></a> [data\_disk\_enabled](#input\_data\_disk\_enabled) | Create and attach a data disk? | `bool` | `false` | no |
| <a name="input_data_disk_machine_lun"></a> [data\_disk\_machine\_lun](#input\_data\_disk\_machine\_lun) | The Logical Unit Number of the Data Disk. Changing this forces a new resource to be created. | `string` | `"0"` | no |
| <a name="input_data_disk_size_gb"></a> [data\_disk\_size\_gb](#input\_data\_disk\_size\_gb) | The data size of disk to be create | `number` | `256` | no |
| <a name="input_data_disk_type"></a> [data\_disk\_type](#input\_data\_disk\_type) | Type of storage account to use with the Data disk - Options: Standard\_LRS, StandardSSD\_LRS or Premium\_LRS | `string` | `"Premium_LRS"` | no |
| <a name="input_download_shir_uri"></a> [download\_shir\_uri](#input\_download\_shir\_uri) | The download link for the self hosted integration runtime | `string` | `"https://download.microsoft.com/download/E/4/7/E4771905-1079-445B-8BF9-8A1A075D8A10/IntegrationRuntime_5.42.8912.1.msi"` | no |
| <a name="input_enable_boot_diagnostics"></a> [enable\_boot\_diagnostics](#input\_enable\_boot\_diagnostics) | Whether to enable boot diagnostics on the virtual machine. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_github_configuration"></a> [github\_configuration](#input\_github\_configuration) | Github configuration for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#github_configuration | <pre>map(<br>    object({<br>      branch_name        = string<br>      repository_name    = string<br>      publishing_enabled = optional(bool, null)<br>      root_folder        = string<br>    })<br>  )</pre> | `null` | no |
| <a name="input_global_parameters"></a> [global\_parameters](#input\_global\_parameters) | Global parameters for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#global_parameter | <pre>list(map(<br>    object({<br>      name  = string<br>      type  = string<br>      value = string<br>    })<br>  ))</pre> | `[]` | no |
| <a name="input_integration_runtime_description"></a> [integration\_runtime\_description](#input\_integration\_runtime\_description) | Description of the integration runtime | `string` | `"Runtime for data factory"` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | The name of the key vault where the customer managed key is stored | `string` | n/a | yes |
| <a name="input_key_vault_resource_group_name"></a> [key\_vault\_resource\_group\_name](#input\_key\_vault\_resource\_group\_name) | The resource group name of the key vault where the customer managed key is stored | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_machine_creds_akv_name"></a> [machine\_creds\_akv\_name](#input\_machine\_creds\_akv\_name) | The name of the key vault where the machine credentials are stored | `string` | `""` | no |
| <a name="input_machine_creds_akv_rg"></a> [machine\_creds\_akv\_rg](#input\_machine\_creds\_akv\_rg) | The resource group name of the key vault where the machine credentials are stored | `string` | `""` | no |
| <a name="input_main_subnet_name"></a> [main\_subnet\_name](#input\_main\_subnet\_name) | value of the main subnet name for the SHIR | `string` | n/a | yes |
| <a name="input_mi_connection_string"></a> [mi\_connection\_string](#input\_mi\_connection\_string) | The managed identity connection string to the sql database | `string` | `null` | no |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_operating_system_disk_cache"></a> [operating\_system\_disk\_cache](#input\_operating\_system\_disk\_cache) | Type of caching to use on the OS disk - Options: None, ReadOnly or ReadWrite | `string` | `"ReadWrite"` | no |
| <a name="input_operating_system_disk_type"></a> [operating\_system\_disk\_type](#input\_operating\_system\_disk\_type) | Type of storage account to use with the OS disk - Options: Standard\_LRS, StandardSSD\_LRS or Premium\_LRS | `string` | `"StandardSSD_LRS"` | no |
| <a name="input_operating_system_disk_write_accelerator"></a> [operating\_system\_disk\_write\_accelerator](#input\_operating\_system\_disk\_write\_accelerator) | Should Write Accelerator be Enabled for this OS Disk? | `bool` | `false` | no |
| <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name) | subnet name for private endpoint subnet | `string` | n/a | yes |
| <a name="input_private_dns_portal_zone_name"></a> [private\_dns\_portal\_zone\_name](#input\_private\_dns\_portal\_zone\_name) | The name of the private dns zone to link to the data factory private endpoint for portal | `string` | `"privatelink.adf.azure.com"` | no |
| <a name="input_private_dns_rg"></a> [private\_dns\_rg](#input\_private\_dns\_rg) | The resource group name of the private dns zone to link to the data factory private endpoint | `string` | n/a | yes |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | The name of the private dns zone to link to the data factory private endpoint | `string` | `"privatelink.datafactory.azure.net"` | no |
| <a name="input_recovery_sku"></a> [recovery\_sku](#input\_recovery\_sku) | The recovery services vault SKU to use | `string` | `"Standard"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name for where databrocks will be deployed | `string` | n/a | yes |
| <a name="input_resource_group_storage_name"></a> [resource\_group\_storage\_name](#input\_resource\_group\_storage\_name) | The Storage Account's resurce name. Defaault to deployment resource group | `string` | `null` | no |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_sa_datalake_linkedNames"></a> [sa\_datalake\_linkedNames](#input\_sa\_datalake\_linkedNames) | The names of the storage accounts to link to the data factory | `list(string)` | `[]` | no |
| <a name="input_source_image_offer"></a> [source\_image\_offer](#input\_source\_image\_offer) | Operating System Name | `string` | `"WindowsServer"` | no |
| <a name="input_source_image_publisher"></a> [source\_image\_publisher](#input\_source\_image\_publisher) | Operating System Publisher | `string` | `"MicrosoftWindowsServer"` | no |
| <a name="input_source_image_sku"></a> [source\_image\_sku](#input\_source\_image\_sku) | Operating System SKU | `string` | `"2019-Datacenter"` | no |
| <a name="input_source_image_version"></a> [source\_image\_version](#input\_source\_image\_version) | Operating System Version | `string` | `"latest"` | no |
| <a name="input_sql_db_name"></a> [sql\_db\_name](#input\_sql\_db\_name) | The name of the sql server database | `string` | `null` | no |
| <a name="input_sql_linked_service"></a> [sql\_linked\_service](#input\_sql\_linked\_service) | either to deploy a linked service to a sql server or not | `bool` | `false` | no |
| <a name="input_sql_mi_linked_service"></a> [sql\_mi\_linked\_service](#input\_sql\_mi\_linked\_service) | either to deploy a linked service to a sql database or not | `bool` | `false` | no |
| <a name="input_sql_secret_name"></a> [sql\_secret\_name](#input\_sql\_secret\_name) | The name of the secret in the key vault to link to the data factory | `string` | n/a | yes |
| <a name="input_sql_server_name"></a> [sql\_server\_name](#input\_sql\_server\_name) | The name of the sql server | `string` | `null` | no |
| <a name="input_sql_server_url"></a> [sql\_server\_url](#input\_sql\_server\_url) | The url for the sql server | `string` | `null` | no |
| <a name="input_sql_server_user"></a> [sql\_server\_user](#input\_sql\_server\_user) | The username for the sql server | `string` | `null` | no |
| <a name="input_storage_analytics_name"></a> [storage\_analytics\_name](#input\_storage\_analytics\_name) | The Storage Account's Blob Name which should hold the virtual machine's diagnostic files. If null it will use managed ones | `string` | `null` | no |
| <a name="input_total_machine_count"></a> [total\_machine\_count](#input\_total\_machine\_count) | Number of VMs to be provisioned | `number` | `1` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine. | `bool` | `false` | no |
| <a name="input_userIdentities"></a> [userIdentities](#input\_userIdentities) | When using managed identity, the user identities that will be assigned to the data factory | `list(string)` | `[]` | no |
| <a name="input_virtual_machine_size"></a> [virtual\_machine\_size](#input\_virtual\_machine\_size) | Instance size to be provisioned | `string` | `"Standard_D4s_v4"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | name of the vnet to deploy databricks to | `string` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | resource group name where to deploy Databricks | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_shir_windows_vm_id"></a> [azure\_shir\_windows\_vm\_id](#output\_azure\_shir\_windows\_vm\_id) | n/a |
| <a name="output_azure_shir_windows_vm_name"></a> [azure\_shir\_windows\_vm\_name](#output\_azure\_shir\_windows\_vm\_name) | n/a |
| <a name="output_azurerm_data_factory_integration_runtime_self_hosted"></a> [azurerm\_data\_factory\_integration\_runtime\_self\_hosted](#output\_azurerm\_data\_factory\_integration\_runtime\_self\_hosted) | n/a |
| <a name="output_datafactory_id"></a> [datafactory\_id](#output\_datafactory\_id) | n/a |
| <a name="output_datafactory_location"></a> [datafactory\_location](#output\_datafactory\_location) | n/a |
| <a name="output_datafactory_name"></a> [datafactory\_name](#output\_datafactory\_name) | n/a |
| <a name="output_datafactory_portal_private_endpoint_connection"></a> [datafactory\_portal\_private\_endpoint\_connection](#output\_datafactory\_portal\_private\_endpoint\_connection) | n/a |
| <a name="output_datafactory_private_dns_a_record"></a> [datafactory\_private\_dns\_a\_record](#output\_datafactory\_private\_dns\_a\_record) | n/a |
| <a name="output_datafactory_private_endpoint_connection"></a> [datafactory\_private\_endpoint\_connection](#output\_datafactory\_private\_endpoint\_connection) | n/a |
| <a name="output_datafactory_resource_group"></a> [datafactory\_resource\_group](#output\_datafactory\_resource\_group) | n/a |
<!-- END_TF_DOCS -->