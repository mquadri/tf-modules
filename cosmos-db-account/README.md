# tf-modules-azure-cosmos-db-account
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
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
| [azurerm_cosmosdb_account.cosmosdbaccount](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cosmosdb_account_name"></a> [azurerm\_cosmosdb\_account\_name](#input\_azurerm\_cosmosdb\_account\_name) | Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_backup_type"></a> [backup\_type](#input\_backup\_type) | (Required) The type of the backup. Possible values are Continuous and Periodic. Defaults to Periodic. Migration of Periodic to Continuous is one-way, changing Continuous to Periodic forces a new resource to be created. | `string` | `"Periodic"` | no |
| <a name="input_consistency_level"></a> [consistency\_level](#input\_consistency\_level) | The Consistency Level to use for this CosmosDB Account. Possible values are 'BoundedStaleness', 'ConsistentPrefix', 'Eventual', 'Session' and 'Strong'. | `string` | `"Session"` | no |
| <a name="input_enable_automatic_failover"></a> [enable\_automatic\_failover](#input\_enable\_automatic\_failover) | Enable automatic failover for this Cosmos DB account. | `bool` | `false` | no |
| <a name="input_failover_location"></a> [failover\_location](#input\_failover\_location) | The failover, read-only region were the resource will be deployed. | `any` | `null` | no |
| <a name="input_failover_location_zone_redundant"></a> [failover\_location\_zone\_redundant](#input\_failover\_location\_zone\_redundant) | Indicates whether the failover, read-only location is zone redundant. | `bool` | `false` | no |
| <a name="input_interval_in_minutes"></a> [interval\_in\_minutes](#input\_interval\_in\_minutes) | (Optional) The interval in minutes between two backups. This is configurable only when type is Periodic. Possible values are between 60 and 1440. | `any` | `null` | no |
| <a name="input_ip_range_filter"></a> [ip\_range\_filter](#input\_ip\_range\_filter) | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. IP addresses/ranges must be comma separated and must not contain any spaces. | `any` | `null` | no |
| <a name="input_is_virtual_network_filter_enabled"></a> [is\_virtual\_network\_filter\_enabled](#input\_is\_virtual\_network\_filter\_enabled) | Enables virtual network filtering for this Cosmos DB account. | `bool` | `true` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Specifies the Kind of CosmosDB to create. Possible values are 'GlobalDocumentDB' and 'MongoDB'. Changing this forces a new resource to be created. | `string` | `"GlobalDocumentDB"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the CosmosDB Account is created. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_location_zone_redundant"></a> [location\_zone\_redundant](#input\_location\_zone\_redundant) | Indicates whether the main, write location is zone redundant. | `bool` | `false` | no |
| <a name="input_network_acl_bypass_for_azure_services"></a> [network\_acl\_bypass\_for\_azure\_services](#input\_network\_acl\_bypass\_for\_azure\_services) | If azure services can bypass ACLs. | `bool` | `true` | no |
| <a name="input_network_acl_bypass_ids"></a> [network\_acl\_bypass\_ids](#input\_network\_acl\_bypass\_ids) | The list of resource Ids for Network Acl Bypass for this Cosmos DB account. | `any` | `null` | no |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | Specifies the Offer Type to use for this CosmosDB Account. Currently this can only be set to 'Standard'. | `string` | `"Standard"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this CosmosDB account. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_retention_in_hours"></a> [retention\_in\_hours](#input\_retention\_in\_hours) | (Optional) The time in hours that each backup is retained. This is configurable only when type is Periodic. Possible values are between 8 and 720. | `any` | `null` | no |
| <a name="input_storage_redundancy"></a> [storage\_redundancy](#input\_storage\_redundancy) | (Optional) The storage redundancy which is used to indicate type of backup residency. This is configurable only when type is Periodic. Possible values are Geo, Local and Zone. | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The connection string of the resource created. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint of the resource created. |
| <a name="output_id"></a> [id](#output\_id) | The id of the resource created. |
| <a name="output_name"></a> [name](#output\_name) | The name of the resource created. |
| <a name="output_primary_key"></a> [primary\_key](#output\_primary\_key) | The primary key of the resource created. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name for the resource group where the resource was created. |
| <a name="output_secondary_key"></a> [secondary\_key](#output\_secondary\_key) | The secondary key of the resource created. |
<!-- END_TF_DOCS -->