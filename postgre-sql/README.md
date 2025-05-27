<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
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
| [azurerm_key_vault_secret.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_postgresql_flexible_server.posgresflexible](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.postgresql_flexible_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |
| [random_password.posgresql_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_auth_enabled"></a> [ad\_auth\_enabled](#input\_ad\_auth\_enabled) | to enable ad authorization | `bool` | `false` | no |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | `""` | no |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | `""` | no |
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | Enable auto-grow for storage. | `bool` | `false` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Number of days to retain backups. | `number` | `31` | no |
| <a name="input_charset"></a> [charset](#input\_charset) | Specifies the Charset for the Azure PostgreSQL Flexible Server Database | `string` | `"UTF8"` | no |
| <a name="input_collation"></a> [collation](#input\_collation) | Specifies the Collation for the Azure PostgreSQL Flexible Server Database | `string` | `"en_US.utf8"` | no |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | `""` | no |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | `""` | no |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | `""` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | Map of customer managed key configurations | <pre>map(object({<br>    key_vault_key_id                     = string<br>    primary_user_assigned_identity_id    = optional(string, null)<br>    geo_backup_key_vault_key_id          = optional(string, null)<br>    geo_backup_user_assigned_identity_id = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_delegated_subnet_id"></a> [delegated\_subnet\_id](#input\_delegated\_subnet\_id) | The subnet where you want the database created. The subnet must be delegated to Microsoft.DBforPostgreSQL/flexibleServers. | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Is Geo-Redundant backup enabled on the PostgreSQL Flexible Server. | `bool` | `false` | no |
| <a name="input_high_availability"></a> [high\_availability](#input\_high\_availability) | Map of high availability configurations | <pre>map(object({<br>    high_availability_mode    = string<br>    standby_availability_zone = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | n/a | `string` | `null` | no |
| <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name) | n/a | `string` | `null` | no |
| <a name="input_kv_secret_content_type"></a> [kv\_secret\_content\_type](#input\_kv\_secret\_content\_type) | (Optional) Specifies the content type for the Key Vault Secret. | `string` | `null` | no |
| <a name="input_kv_secret_expiration_date"></a> [kv\_secret\_expiration\_date](#input\_kv\_secret\_expiration\_date) | (Optional) Expiration UTC datetime (Y-m-d'T'H:M:S'Z'). | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | `""` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Map of maintenance window configuration | <pre>map(object({<br>    day_of_week  = string<br>    start_hour   = string<br>    start_minute = string<br>  }))</pre> | `{}` | no |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | `""` | no |
| <a name="input_password_auth_enabled"></a> [password\_auth\_enabled](#input\_password\_auth\_enabled) | Enable password authentication. | `bool` | `true` | no |
| <a name="input_point_in_time_restore_time_in_utc"></a> [point\_in\_time\_restore\_time\_in\_utc](#input\_point\_in\_time\_restore\_time\_in\_utc) | Point in time to restore the server. | `string` | `null` | no |
| <a name="input_posgresql_create_mode"></a> [posgresql\_create\_mode](#input\_posgresql\_create\_mode) | The mode to create the PostgreSQL server. | `string` | `null` | no |
| <a name="input_posgresql_server_name"></a> [posgresql\_server\_name](#input\_posgresql\_server\_name) | n/a | `string` | n/a | yes |
| <a name="input_posgresql_sku_name"></a> [posgresql\_sku\_name](#input\_posgresql\_sku\_name) | (Optional) The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B\_Standard\_B1ms, GP\_Standard\_D2s\_v3, MO\_Standard\_E4s\_v3). | `string` | `null` | no |
| <a name="input_posgresql_source_server_id"></a> [posgresql\_source\_server\_id](#input\_posgresql\_source\_server\_id) | The source server ID for replication. | `string` | `null` | no |
| <a name="input_posgresql_storage_mb"></a> [posgresql\_storage\_mb](#input\_posgresql\_storage\_mb) | Specifies the version of PostgreSQL to use. | `number` | `262144` | no |
| <a name="input_posgresql_storage_tier"></a> [posgresql\_storage\_tier](#input\_posgresql\_storage\_tier) | The storage tier for the server. | `string` | `null` | no |
| <a name="input_posgresql_version"></a> [posgresql\_version](#input\_posgresql\_version) | (Optional) The version of PostgreSQL Flexible Server to use. Possible values are 11,12, 13, 14, 15 and 16. Required when create\_mode is Default. | `number` | `14` | no |
| <a name="input_posgresql_zone"></a> [posgresql\_zone](#input\_posgresql\_zone) | n/a | `string` | `"1"` | no |
| <a name="input_postgres_admin"></a> [postgres\_admin](#input\_postgres\_admin) | PostgreSQL default admin. | `string` | `null` | no |
| <a name="input_postgres_db"></a> [postgres\_db](#input\_postgres\_db) | Name of the PostgreSQL database | `string` | n/a | yes |
| <a name="input_postgresql_configurations"></a> [postgresql\_configurations](#input\_postgresql\_configurations) | PostgreSQL configurations to enable. | `map(string)` | `{}` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | The ID of the private DNS zone to create the PostgreSQL Flexible Server. The private DNS zone must end with the suffix .postgres.database.azure.com. | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Enable public network access. | `bool` | `false` | no |
| <a name="input_replication_role"></a> [replication\_role](#input\_replication\_role) | The replication role for the server. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Map that holds the timeout configuration | <pre>object({<br>    create = optional(string, "1h")<br>    update = optional(string, "1h")<br>    read   = optional(string, "5m")<br>    delete = optional(string, "1h")<br>  })</pre> | <pre>{<br>  "create": "1h",<br>  "delete": "1h",<br>  "read": "5m",<br>  "update": "1h"<br>}</pre> | no |
| <a name="input_user_assigned_identity_ids"></a> [user\_assigned\_identity\_ids](#input\_user\_assigned\_identity\_ids) | User Identities | <pre>map(object({<br>    identity_id = string<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgre_server_fqdn"></a> [postgre\_server\_fqdn](#output\_postgre\_server\_fqdn) | n/a |
| <a name="output_postgre_server_id"></a> [postgre\_server\_id](#output\_postgre\_server\_id) | n/a |
<!-- END_TF_DOCS -->
