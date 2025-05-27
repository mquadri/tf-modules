<!-- BEGIN_TF_DOCS -->
# Terraform Azure Cosmos DB Module

This Terraform module is designed to create Azure Cosmos DB accounts, its related resources and APIs.

> [!WARNING]
> Major version Zero (0.y.z) is for initial development. Anything MAY change at any time. A module SHOULD NOT be considered stable till at least it is major version one (1.0.0) or greater. Changes will always be via new versions being published and no changes will be made to existing published versions. For more details please go to <https://semver.org/>

## Features

* Creation of accounts with NoSQL API with its databases and containers.
* EntraID authentication instead of access keys
* Support for customer-managed keys.
* Enable private endpoint, providing secure access over a private network.
* Enable diagnostic settings.
* Creation of role assignments
* Enable locks
* Enable managed identities both system and user assigned ones.

## Limitations

* The module does not support auto rotation of Customer Managed keys (CosmosDB doesn't support it yet)
* The module does not support the Gremlin API yet
* The module does not support the MongoDB API yet
* The module does not support the Table API yet
* The module does not support the Cassandra API yet

## Examples
* [Use only defaults values](examples/default/main.tf)
* [Specifying all possible parameters at account level](examples/max-account/main.tf)
* [Creation of sql api](examples/sql/main.tf)
* [Creation of a serverless account](examples/serverless/main.tf)
* [Customer managed key pinning to a specific key version](examples/cmk-pin-key-version/main.tf)
* [Enable managed identities](examples/managed-identities/main.tf)
* [Enable private endpoints with auto management of dns records](examples/private-endpoints-managed-dns-records/main.tf)
* [Enable private endpoints with auto management of dns records](examples/private-endpoints-unmanaged-dns-records/main.tf)
* [Restrict public network access with access control list and service endpoints](examples/public-restricted-access/main.tf)

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3.71)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.6)

- <a name="requirement_time"></a> [time](#requirement\_time) (~> 0.11)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 3.71)

- <a name="provider_random"></a> [random](#provider\_random) (~> 3.6)

- <a name="provider_time"></a> [time](#provider\_time) (~> 0.11)

## Resources

The following resources are used by this module:

- [azurerm_cosmosdb_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) (resource)
- [azurerm_cosmosdb_mongo_collection.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_collection) (resource)
- [azurerm_cosmosdb_mongo_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_database) (resource)
- [azurerm_cosmosdb_sql_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container) (resource)
- [azurerm_cosmosdb_sql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_database) (resource)
- [azurerm_cosmosdb_sql_dedicated_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_dedicated_gateway) (resource)
- [azurerm_cosmosdb_sql_function.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_function) (resource)
- [azurerm_cosmosdb_sql_stored_procedure.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_stored_procedure) (resource)
- [azurerm_cosmosdb_sql_trigger.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_trigger) (resource)
- [azurerm_management_lock.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) (resource)
- [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) (resource)
- [azurerm_private_endpoint.this_managed_dns_zone_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) (resource)
- [azurerm_private_endpoint.this_unmanaged_dns_zone_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) (resource)
- [azurerm_private_endpoint_application_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint_application_security_group_association) (resource)
- [azurerm_resource_group_template_deployment.telemetry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) (resource)
- [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [random_id.telem](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) (resource)
- [time_sleep.wait_180_seconds_for_destroy](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) (resource)
- [azurerm_cosmosdb_postgresql_cluster] (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_postgresql_cluster#arguments-reference) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description:   Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.  

  Example Inputs: eastus  
  See more in CLI: az account list-locations -o table --query "[].name"

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description:   Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created.  
  The name can contain only lowercase letters, numbers and the '-' character, must be between 3 and 44 characters long, and must not start or end with the character '-'.

  Example Inputs: cosmos-sharepoint-prod-westus-001  
  See more: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftdocumentdb

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description:   The name of the resource group in which to create this resource.   
  Changing this forces a new resource to be created.  
  Name must be less than 90 characters long and must only contain underscores, hyphens, periods, parentheses, letters, or digits.

  Example Inputs: rg-sharepoint-prod-westus-001  
  See more: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftresources

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_access_key_metadata_writes_enabled"></a> [access\_key\_metadata\_writes\_enabled](#input\_access\_key\_metadata\_writes\_enabled)

Description: Defaults to `false`. Is write operations on metadata resources (databases, containers, throughput) via account keys enabled?

Type: `bool`

Default: `false`

### <a name="input_analytical_storage_config"></a> [analytical\_storage\_config](#input\_analytical\_storage\_config)

Description:   Defaults to `null`. Configuration related to the analytical storage of this account

  - `schema_type` - (Required) - The schema type of the Analytical Storage for this Cosmos DB account. Possible values are FullFidelity and WellDefined.

  Example inputs:
  ```hcl
  analytical_storage_config = {
    schema_type = "WellDefined"
  }
```

Type:

```hcl
object({
    schema_type = string
  })
```

Default: `null`

### <a name="input_analytical_storage_enabled"></a> [analytical\_storage\_enabled](#input\_analytical\_storage\_enabled)

Description: Defaults to `false`. Enable Analytical Storage option for this Cosmos DB account. Enabling and then disabling analytical storage forces a new resource to be created.

Type: `bool`

Default: `false`

### <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled)

Description: Defaults to `true`. Enable automatic failover for this Cosmos DB account.

Type: `bool`

Default: `true`

### <a name="input_backup"></a> [backup](#input\_backup)

Description:   Defaults to `{}`. Configures the backup policy for this Cosmos DB account.

  - `type`                - (Optional) - Defaults to `Continuous`. The type of the backup. Possible values are `Continuous` and `Periodic`
  - `tier`                - (Optional) - Defaults to `Continuous30Days`. Used when `type` is set to `Continuous`. The continuous backup tier. Possible values are `Continuous7Days` and `Continuous30Days`.
  - `interval_in_minutes` - (Optional) - Defaults to `240`. Used when `type` is set to `Periodic`. The interval in minutes between two backups. Possible values are between `60` and `1440`
  - `retention_in_hours`  - (Optional) - Defaults to `8`. Used when `type` is set to `Periodic`. The time in hours that each backup is retained. Possible values are between `8` and `720`
  - `storage_redundancy`  - (Optional) - Defaults to `Geo`. Used when `type` is set to `Periodic`. The storage redundancy is used to indicate the type of backup residency. Possible values are `Geo`, `Local` and `Zone`

  Example inputs:
  ```hcl
  # For Continuous Backup
  backup = {
    type = "Continuous"
    tier = "Continuous30Days"
  }

  # For Periodic Backup
  backup = {
    type                = "Periodic"
    storage_redundancy  = "Geo"
    interval_in_minutes = 240
    retention_in_hours  = 8
  }
```

Type:

```hcl
object({
    retention_in_hours  = optional(number, 8)
    interval_in_minutes = optional(number, 240)
    storage_redundancy  = optional(string, "Geo")
    type                = optional(string, "Continuous")
    tier                = optional(string, "Continuous30Days")
  })
```

Default: `{}`

### <a name="input_capabilities"></a> [capabilities](#input\_capabilities)

Description:   Defaults to `[]`. The capabilities which should be enabled for this Cosmos DB account.

  - `name` - (Required) - The capability to enable - Possible values are `AllowSelfServeUpgradeToMongo36`, `DisableRateLimitingResponses`, `EnableAggregationPipeline`, `EnableCassandra`, `EnableGremlin`, `EnableMongo`, `EnableMongo16MBDocumentSupport`, `EnableMongoRetryableWrites`, `EnableMongoRoleBasedAccessControl`, `EnablePartialUniqueIndex`, `EnableServerless`, `EnableTable`, `EnableTtlOnCustomPath`, `EnableUniqueCompoundNestedDocs`, `MongoDBv3.4` and `mongoEnableDocLevelTTL`.

  Example inputs:
  ```hcl
  capabilities = [
    {
      name = "DisableRateLimitingResponses"
    }
  ]
```

Type:

```hcl
set(object({
    name = string
  }))
```

Default: `[]`

### <a name="input_capacity"></a> [capacity](#input\_capacity)

Description:   Defaults to `{}`. Configures the throughput limit for this Cosmos DB account.

  - `total_throughput_limit` - (Optional) - Defaults to `-1`. The total throughput limit imposed on this Cosmos DB account (RU/s). Possible values are at least -1. -1 means no limit.

  Example inputs:
  ```hcl
  capacity = {
    total_throughput_limit = -1
  }
```

Type:

```hcl
object({
    total_throughput_limit = optional(number, -1)
  })
```

Default: `{}`

### <a name="input_consistency_policy"></a> [consistency\_policy](#input\_consistency\_policy)

Description:   Defaults to `{}`. Used to define the consistency policy for this CosmosDB account

  - `consistency_level`       - (Optional) - Defaults to `ConsistentPrefix`. The Consistency Level to use for this CosmosDB Account - can be either `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix`.
  - `max_interval_in_seconds` - (Optional) - Defaults to `5`. Used when `consistency_level` is set to `BoundedStaleness`. When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. The accepted range for this value is `5` - `86400` (1 day).
  - `max_staleness_prefix`    - (Optional) - Defaults to `100`. Used when `consistency_level` is set to `BoundedStaleness`. When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. The accepted range for this value is `10` – `2147483647`

  Example inputs:
  ```hcl
  consistency_policy = {
    consistency_level       = "ConsistentPrefix"
    max_interval_in_seconds = 10
    max_interval_in_seconds = 100
  }
```

Type:

```hcl
object({
    max_interval_in_seconds = optional(number, 5)
    max_staleness_prefix    = optional(number, 100)
    consistency_level       = optional(string, "ConsistentPrefix")
  })
```

Default: `{}`

### <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule)

Description:   Defaults to `null`. Configures the CORS rule for this Cosmos DB account.

  - `allowed_headers`    - (Required) - A list of headers that are allowed to be a part of the cross-origin request.
  - `allowed_methods`    - (Required) - A list of HTTP headers that are allowed to be executed by the origin. Valid options are `DELETE`, `GET`, `HEAD`, `MERGE`, `POST`, `OPTIONS`, `PUT` or `PATCH`.
  - `allowed_origins`    - (Required) - A list of origin domains that will be allowed by CORS.
  - `exposed_headers`    - (Required) - A list of response headers that are exposed to CORS clients.
  - `max_age_in_seconds` - (Optional) - Defaults to `null`. The number of seconds the client should cache a preflight response. Possible values are between `1` and `2147483647`

  Example inputs:
  ```hcl
  cors_rule = {
    allowed_headers = ["Custom-Header"]
    allowed_methods = ["POST"]
    allowed_origins = ["microsoft.com"]
    exposed_headers = ["Custom-Header"]
    max_age_in_seconds = 100
  }
```

Type:

```hcl
object({
    allowed_headers    = set(string)
    allowed_methods    = set(string)
    allowed_origins    = set(string)
    exposed_headers    = set(string)
    max_age_in_seconds = optional(number, null)
  })
```

Default: `null`

### <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key)

Description:   Defaults to `null`. Ignored for Basic and Standard. Defines a customer managed key to use for encryption.

  - `key_name`               - (Required) - The key name for the customer managed key in the key vault.
  - `key_vault_resource_id`  - (Required) - The full Azure Resource ID of the key\_vault where the customer managed key will be referenced from.
  - `key_version`            - (Unsupported)

  - `user_assigned_identity` - (Required) - The user assigned identity to use when access the key vault
    - `resource_id`          - (Required) - The full Azure Resource ID of the user assigned identity.

  > Note: Remember to assign permission to the managed identity to access the key vault key. The Key vault used must have enabled soft delete and purge protection. The minimun required permissions is "Key Vault Crypto Service Encryption User"

  Example Inputs:
  ```hcl
  customer_managed_key = {
    key_name               = "sample-customer-key"
    key_vault_resource_id  = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.KeyVault/vaults/{keyVaultName}"
    
    user_assigned_identity {
      resource_id = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{managedIdentityName}"
    }
  }
```

Type:

```hcl
object({
    key_name              = string
    key_vault_resource_id = string

    key_version = optional(string, null) # Not supported in CosmosDB

    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
```

Default: `null`

### <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings)

Description:   Defaults to `{}`. A map of diagnostic settings to create. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

  - `name`                                     - (Optional) - The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.
  - `log_categories`                           - (Optional) - Defaults to `[]`. A set of log categories to export. Possible values are: `DataPlaneRequests`, `MongoRequests`, `CassandraRequests`,  `GremlinRequests`, `QueryRuntimeStatistics`, `PartitionKeyStatistics`, `PartitionKeyRUConsumption`, `ControlPlaneRequests` or `TableApiRequests`.
  - `log_groups`                               - (Optional) - Defaults to `[]` if log\_categories is set, if not it defaults to `["allLogs", "audit"]`. A set of log groups to send to export. Possible values are `allLogs` and `audit`.
  - `metric_categories`                        - (Optional) - Defaults to `["AllMetrics"]`. A set of metric categories to export.
  - `log_analytics_destination_type`           - (Optional) - Defaults to `Dedicated`. The destination log analytics workspace table for the diagnostic setting. Possible values are `Dedicated` and `AzureDiagnostics`. Defaults to `Dedicated`.
  - `workspace_resource_id`                    - (Optional) - The resource ID of the log analytics workspace to send logs and metrics to.
  - `storage_account_resource_id`              - (Optional) - The resource ID of the storage account to send logs and metrics to.
  - `event_hub_authorization_rule_resource_id` - (Optional) - The resource ID of the event hub authorization rule to send logs and metrics to.
  - `event_hub_name`                           - (Optional) - The name of the event hub. If none is specified, the default event hub will be selected.
  - `marketplace_partner_resource_id`          - (Optional) - The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.

  > Note: See more in CLI: az monitor diagnostic-settings categories list --resource {cosmosAccountResourceId}

  Example Inputs:
  ```hcl
  diagnostic_settings = {
    diagnostic1 = {
      event_hub_name                           = "hub-name"
      log_analytics_destination_type           = "Dedicated"
      name                                     = "diagnostics"
      event_hub_authorization_rule_resource_id = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.EventHub/namespaces/{eventHubNamespaceName}/authorizationRules/{authorizationRuleName}"

      #log_categories = ["DataPlaneRequests", "MongoRequests", "CassandraRequests",  "GremlinRequests", "QueryRuntimeStatistics", "PartitionKeyStatistics", "PartitionKeyRUConsumption", "ControlPlaneRequests",  "TableApiRequests"]

      metric_categories           = ["AllMetrics"]
      log_groups                  = ["allLogs", "audit"]
      workspace_resource_id       = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}"
      storage_account_resource_id = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{storageAccountName}"
    }
  }
```  

Type:

```hcl
map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description:   Defaults to `true`. This variable controls whether or not telemetry is enabled for the module.  
  For more information see https://aka.ms/avm/telemetryinfo.  
  If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_free_tier_enabled"></a> [free\_tier\_enabled](#input\_free\_tier\_enabled)

Description: Defaults to `false`. Enable the Free Tier pricing option for this Cosmos DB account. Defaults to false. Changing this forces a new resource to be created.

Type: `bool`

Default: `false`

### <a name="input_geo_locations"></a> [geo\_locations](#input\_geo\_locations)

Description:   Default to the region where the account was deployed with zone redundant enabled. Specifies a geo\_location resource, used to define where data should be replicated with the failover\_priority 0 specifying the primary location.

  - `location`          - (Required) - The name of the Azure location where the CosmosDB Account is being created.
  - `failover_priority` - (Required) - The failover priority of the region. A failover priority of 0 indicates a write region.
  - `zone_redundant`    - (Optional) - Defaults to `true`. Whether or not the region is zone redundant.  

  Example inputs:
  ```hcl
  geo_locations = [
    {
      location          = "eastus"
      failover_priority = 0
      zone_redundant    = true
    },
    {
      location          = "westus"
      failover_priority = 1
      zone_redundant    = true
    }
  ]
```

Type:

```hcl
set(object({
    location          = string
    failover_priority = number
    zone_redundant    = optional(bool, true)
  }))
```

Default: `null`

### <a name="input_ip_range_filter"></a> [ip\_range\_filter](#input\_ip\_range\_filter)

Description:   Defaults to `[]`. CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IPs for a given database account.

  > Note: To enable the "Allow access from the Azure portal" behavior, you should add the IP addresses provided by the documentation to this list. https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-configure-firewall#allow-requests-from-the-azure-portal
  > Note: To enable the "Accept connections from within public Azure datacenters" behavior, you should add 0.0.0.0 to the list, see the documentation for more details. https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-configure-firewall#allow-requests-from-global-azure-datacenters-or-other-sources-within-azure

Type: `set(string)`

Default: `[]`

### <a name="input_local_authentication_disabled"></a> [local\_authentication\_disabled](#input\_local\_authentication\_disabled)

Description: Defaults to `false`. Ignored for non SQL APIs accounts. Disable local authentication and ensure only MSI and AAD can be used exclusively for authentication. Can be set only when using the SQL API.

Type: `bool`

Default: `false`

### <a name="input_lock"></a> [lock](#input\_lock)

Description:   Defaults to `null`. Controls the Resource Lock configuration for this resource.   
  If specified, it will be inherited by child resources unless overriden when creating those child resources.   
  The following properties can be specified:

  - `kind` - (Required) - The type of lock. Possible values are `CanNotDelete` and `ReadOnly`.
  - `name` - (Optional) - The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.

  > Note: If you use `ReadOnly` kind lock, you must configure Terraform to use EntraId authentication, as the access of the account keys will be blocked thus terraform won't be to do its job.

  Example Inputs:
  ```hcl
  lock = {
    kind = "CanNotDelete"
    name = "This resource cannot be deleted easily"
  }
```

Type:

```hcl
object({
    kind = string
    name = optional(string, null)
  })
```

Default: `null`

### <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities)

Description:   Defaults to `{}`. Controls the Managed Identity configuration on this resource. The following properties can be specified:

  - `system_assigned`            - (Optional) - Defaults to `false`. Specifies if the System Assigned Managed Identity should be enabled.
  - `user_assigned_resource_ids` - (Optional) - Defaults to `[]`. Specifies a set of User Assigned Managed Identity resource IDs to be assigned to this resource.

  Example Inputs:
  ```hcl
  managed_identities = {
    system_assigned            = true
    user_assigned_resource_ids = [
      "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{managedIdentityName}"
    ]
  }
```

Type:

```hcl
object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
```

Default: `{}`

### <a name="input_minimal_tls_version"></a> [minimal\_tls\_version](#input\_minimal\_tls\_version)

Description: Defaults to `Tls12`. Specifies the minimal TLS version for the CosmosDB account. Possible values are: `Tls`, `Tls11`, and `Tls12`

Type: `string`

Default: `"Tls12"`

### <a name="input_mongo_databases"></a> [mongo\_databases](#input\_mongo\_databases)

Description:   Defaults to `{}`. Manages SQL Databases within a Cosmos DB Account.

  - `name`       - (Required) - Specifies the name of the Cosmos DB Mongo Database. Changing this forces a new resource to be created.
  - `throughput` - (Optional) - Defaults to `null`. The throughput of the MongoDB database (RU/s). Must be set in increments of `100`. The minimum value is `400`. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.

  - `autoscale_settings` - (Optional) - Defaults to `null`. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.
    - `max_throughput` - (Required) - The maximum throughput of the SQL database (RU/s). Must be between `1,000` and `1,000,000`. Must be set in increments of `1,000`. Conflicts with `throughput`.

  - `collections` - (Optional) - Defaults to `{}`. Manages a Mongo Collection within a Cosmos DB Account.
    - `name`      - (Required) Specifies the name of the Cosmos DB Mongo Collection. Changing this forces a new resource to be created.

    - `throughput`             - (Optional) - Defaults to `null`. The throughput of the MongoDB collection (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.
    - `default_ttl_seconds`    - (Optional) - Defaults to `null`. The default Time To Live in seconds. If the value is -1, items are not automatically expired.
    - `shard_key             ` - (Optional) - Defaults to `null`. The name of the key to partition on for sharding. There must not be any other unique index keys. Changing this forces a new resource to be created.

    - `autoscale_settings` - (Optional) - Defaults to `null`. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.
      - `max_throughput`   - (Required) - The maximum throughput of the MongoDB collection (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput.

    - `Index` - (Optional) - Defaults to `null`. Improve the efficiency of MongoDB database operations.
      - `keys`    - (Required) Specifies the list of user settable keys for each Cosmos DB Mongo Collection.
      - `unique`  - (Optional) Defaults to `false`. Is the index unique or not?

  Example inputs:
  ```hcl
      database_collection = {
      name       = "database_mongoDb_collections"
      throughput = 400

      collections = {
        "collection" = {
          name                = "MongoDBcollection"
          default_ttl_seconds = "3600"
          shard_key           = "_id"
          throughput          = 400

          index = {
            keys   = ["_id"]
            unique = true
          }
        }
      }
    }
```

Type:

```hcl
map(object({
    name = string

    throughput = optional(number, null)

    autoscale_settings = optional(object({
      max_throughput = number
    }), null)

    collections = optional(map(object({
      name = string

      default_ttl_seconds = optional(string, null)
      shard_key           = optional(string, null)
      throughput          = optional(number, null)

      autoscale_settings = optional(object({
        max_throughput = number
      }), null)

      index = optional(object({
        keys   = list(string)
        unique = optional(bool, false)
      }), null)

    })), {})
  }))
```

Default: `{}`

### <a name="input_mongo_server_version"></a> [mongo\_server\_version](#input\_mongo\_server\_version)

Description: The Server Version of a MongoDB account. Defaults to `3.6` Possible values are `4.2`, `4.0`, `3.6`, and `3.2`

Type: `string`

Default: `"3.6"`

### <a name="input_multiple_write_locations_enabled"></a> [multiple\_write\_locations\_enabled](#input\_multiple\_write\_locations\_enabled)

Description: Defaults to `false`. Ignored when `backup.type` is `Continuous`. Enable multi-region writes for this Cosmos DB account.

Type: `bool`

Default: `false`

### <a name="input_network_acl_bypass_for_azure_services"></a> [network\_acl\_bypass\_for\_azure\_services](#input\_network\_acl\_bypass\_for\_azure\_services)

Description: Defaults to `false`. If Azure services can bypass ACLs.

Type: `bool`

Default: `false`

### <a name="input_network_acl_bypass_ids"></a> [network\_acl\_bypass\_ids](#input\_network\_acl\_bypass\_ids)

Description: Defaults to `[]`. The list of resource Ids for Network Acl Bypass for this Cosmos DB account.

Type: `set(string)`

Default: `[]`

### <a name="input_partition_merge_enabled"></a> [partition\_merge\_enabled](#input\_partition\_merge\_enabled)

Description: Defaults to `false`. Is partition merge on the Cosmos DB account enabled?

Type: `bool`

Default: `false`

### <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints)

Description:   Default to `{}`. A map of private endpoints to create. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

  - `subnet_resource_id`                      - (Required) - The resource ID of the subnet to deploy the private endpoint in.
  - `subresource_name`                        - (Required) - The service name of the private endpoint. Possible value are `SQL`, `SqlDedicated`, `Cassandra`, `MongoDB`, `Gremlin` or `Table`.
  - `name`                                    - (Optional) - The name of the private endpoint. One will be generated if not set.
  - `private_dns_zone_group_name`             - (Optional) - The name of the private DNS zone group. One will be generated if not set.
  - `private_dns_zone_resource_ids`           - (Optional) - A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.
  - `application_security_group_associations` - (Optional) - A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
  - `private_service_connection_name`         - (Optional) - The name of the private service connection. One will be generated if not set.
  - `network_interface_name`                  - (Optional) - The name of the network interface. One will be generated if not set.
  - `location`                                - (Optional) - The Azure location where the resources will be deployed. Defaults to the location of the resource group.
  - `resource_group_name`                     - (Optional) - The resource group where the resources will be deployed. Defaults to the resource group of the resource.

  - `ip_configurations` - (Optional) - A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
    - `name`               - (Required) - The name of the IP configuration.
    - `private_ip_address` - (Required) - The private IP address of the IP configuration.

  - `role_assignments` - (Optional) - A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See `var.role_assignments` for more information.
  - `lock`             - (Optional) - The lock level to apply to the private endpoint. Default is `None`. Possible values are `None`, `CanNotDelete`, and `ReadOnly`.
  - `tags`             - (Optional) - A mapping of tags to assign to the private endpoint.

  > Note: See more related to subresource\_name in: https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource

Type:

```hcl
map(object({
    subnet_resource_id = string
    subresource_name   = string

    name                                    = optional(string, null)
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)

    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})

    tags = optional(map(string), null)

    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)

    role_assignments = optional(map(object({
      role_definition_id_or_name = string
      principal_id               = string

      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      delegated_managed_identity_resource_id = optional(string, null)

      principal_type    = optional(string, null) # forced to be here by lint, not supported
      condition         = optional(string, null) # forced to be here by lint, not supported
      condition_version = optional(string, null) # forced to be here by lint, not supported
    })), {})
  }))
```

Default: `{}`

### <a name="input_private_endpoints_manage_dns_zone_group"></a> [private\_endpoints\_manage\_dns\_zone\_group](#input\_private\_endpoints\_manage\_dns\_zone\_group)

Description: Default to true. Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy.

Type: `bool`

Default: `true`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: Defaults to `true`. Whether or not public network access is allowed for this CosmosDB account.

Type: `bool`

Default: `true`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description:   Defaults to `{}`. A map of role assignments to create. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

  - `role_definition_id_or_name`             - (Required) - The ID or name of the role definition to assign to the principal.
  - `principal_id`                           - (Required) - The ID of the principal to assign the role to.
  - `description`                            - (Optional) - The description of the role assignment.
  - `skip_service_principal_aad_check`       - (Optional) - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
  - `delegated_managed_identity_resource_id` - (Optional) - The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.

  - `principal_type`                         - (Unsupported)
  - `condition`                              - (Unsupported)
  - `condition_version`                      - (Unsupported)

  > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

  Example Inputs:
  ```hcl
  role_assignments = {
    "key" = {
      skip_service_principal_aad_check = false
      role_definition_id_or_name       = "Contributor"
      description                      = "This is a test role assignment"
      principal_id                     = "eb5260bd-41f3-4019-9e03-606a617aec13"
    }
  }
```

Type:

```hcl
map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    delegated_managed_identity_resource_id = optional(string, null)

    principal_type    = optional(string, null) # forced to be here by lint, not supported
    condition         = optional(string, null) # forced to be here by lint, not supported
    condition_version = optional(string, null) # forced to be here by lint, not supported
  }))
```

Default: `{}`

### <a name="input_sql_databases"></a> [sql\_databases](#input\_sql\_databases)

Description:   Defaults to `{}`. Manages SQL Databases within a Cosmos DB Account.

  - `name`       - (Required) - Specifies the name of the Cosmos DB SQL Container. Changing this forces a new resource to be created.
  - `throughput` - (Optional) - Defaults to `null`. The throughput of SQL database (RU/s). Must be set in increments of `100`. The minimum value is `400`. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.

  - `autoscale_settings` - (Optional) - Defaults to `null`. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.
    - `max_throughput` - (Required) - The maximum throughput of the SQL database (RU/s). Must be between `1,000` and `1,000,000`. Must be set in increments of `1,000`. Conflicts with `throughput`.

  - `containers` - (Optional) - Defaults to `{}`. Manages SQL Containers within a Cosmos DB Account.
    - `partition_key_path`     - (Required) - Define a partition key. Changing this forces a new resource to be created.
    - `name`                   - (Required) - Specifies the name of the Cosmos DB SQL Container. Changing this forces a new resource to be created.
    - `throughput`             - (Optional) - Defaults to `null`. The throughput of SQL container (RU/s). Must be set in increments of `100`. The minimum value is `400`. This must be set upon container creation otherwise it cannot be updated without a manual terraform destroy-apply.
    - `default_ttl`            - (Optional) - Defaults to `null`. The default time to live of SQL container. If missing, items are not expired automatically. If present and the value is set to `-1`, it is equal to infinity, and items don't expire by default. If present and the value is set to some number n - items will expire n seconds after their last modified time.
    - `analytical_storage_ttl` - (Optional) - Defaults to `null`. The default time to live of Analytical Storage for this SQL container. If present and the value is set to `-1`, it is equal to infinity, and items don't expire by default. If present and the value is set to some number n - items will expire n seconds after their last modified time.

    - `unique_keys` - (Optional) - Defaults to `[]`. The unique keys of the container.
      - `paths` - (Required) - A list of paths to use for this unique key. Changing this forces a new resource to be created.

    - `autoscale_settings` - (Optional) - Defaults to `null`. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.
      - `max_throughput` - (Required) - The maximum throughput of the SQL container (RU/s). Must be between `1,000` and `1,000,000`. Must be set in increments of `1,000`. Conflicts with `throughput`.

    - `functions` - (Optional) - Defaults to `{}`. Manages SQL User Defined Functions.
      - `body` - (Required) - Body of the User Defined Function.
      - `name` - (Required) - The name which should be used for this SQL User Defined Function. Changing this forces a new SQL User Defined Function to be created.

    - `stored_procedures` - (Optional) - Defaults to `{}`. Manages SQL Stored Procedures within a Cosmos DB Account SQL Database.
      - `body` - (Required) - The body of the stored procedure.
      - `name` - (Required) - Specifies the name of the Cosmos DB SQL Stored Procedure. Changing this forces a new resource to be created.

    - `triggers` - (Optional) -  Defaults to `{}`. Manages SQL Triggers.
      - `body`      - (Required) - Body of the Trigger.
      - `type`      - (Required) - Type of the Trigger. Possible values are `Pre` and `Post`.
      - `operation` - (Required) - The operation the trigger is associated with. Possible values are `All`, `Create`, `Update`, `Delete` and `Replace`.
      - `name`      - (Required) - The name which should be used for this SQL Trigger. Changing this forces a new SQL Trigger to be created.

    - `conflict_resolution_policy` - (Optional) - Defaults to `null`. The conflict resolution policy of the container. Changing this forces a new resource to be created.
      - `mode`                          - (Required) - Indicates the conflict resolution mode. Possible values include: `LastWriterWins` and `Custom`.
      - `conflict_resolution_path`      - Required if `LastWriterWins` is set as `mode` - The conflict resolution path.
      - `conflict_resolution_procedure` - Required if `Custom` is set as `mode` - The procedure to resolve conflicts .

    - `indexing_policy` - (Optional) - Defaults to `{}`. The indexing policy of the container.
      - `indexing_mode` - (Required) - Indicates the indexing mode. Possible values include: `consistent` and `none`

      - `included_paths` - (Optional) - Defaults to `[]`. Either included\_path or excluded\_path must contain the path `/*`
        - `path` - (Required) - Path for which the indexing behaviour applies to.

      - `excluded_paths` - (Optional) - Defaults to `[]`. Either included\_path or excluded\_path must contain the path `/*`
        - `path` - (Required) - Path that is excluded from indexing.

      - `composite_indexes` - (Optional) - Defaults to `[]`. The composite indexes of the indexing policy.
        - `indexes` - (Required) - The indexes of the composite indexes.
          - `path`  - (Required) - Path for which the indexing behaviour applies to.
          - `order` - (Required) - Order of the index. Possible values are `Ascending` or `Descending`.

      - `spatial_indexes` - (Optional) - Defaults to `[]`. The spatial indexes of the indexing policy.
        - `path` - (Required) -  Path for which the indexing behaviour applies to. According to the service design, all spatial types including LineString, MultiPolygon, Point, and Polygon will be applied to the path.

  > Note: Switching between autoscale and manual throughput is not supported via Terraform and must be completed via the Azure Portal and refreshed.
  > Note: For indexing policy See more in: https://learn.microsoft.com/en-us/azure/cosmos-db/nosql/how-to-manage-indexing-policy?tabs=dotnetv3%2Cpythonv3  

  Example inputs:
  ```hcl
  sql_databases = {
    database1 = {
      name       = "database1"
      throughput = 400

      # autoscale_settings = {
      #   max_throughput = 4000
      # }

      containers = {
        container1 = {
          partition_key_path = "/id"
          name               = "container1"
          throughput         = 400
          default_ttl        = 1000
          analytical_storage_ttl = 1000

          unique_keys = [
            {
              paths = ["/field1", "/field2"]
            }
          ]

          # autoscale_settings = {
          #   max_throughput = 4000
          # }

          functions = {
            function1 = {
              name = "functionName"
              body = "function function1() { }"
            }
          }

          stored_procedures = {
            stored1 = {
              name = "storedName"
              body = "function stored1() { }"
            }
          }

          triggers = {
            trigger1 = {
              name      = "triggerName"
              body      = "function trigger1() { }"
              type      = "Pre"
              operation = "All"
            }
          }

          conflict_resolution_policy = {
            mode                     = "LastWriterWins"
            conflict_resolution_path = "/customProperty"
          }

          indexing_policy = {
            indexing_mode = "consistent"

            included_paths = [
              {
                path = "/*"
              }
            ]

            excluded_paths = [
              {
                path = "/excluded/*"
              }
            ]

            composite_indexes = [
              {
                indexes = [
                  {
                    path  = "/field1"
                    order = "ascending"
                  }
                ]
              }
            ]

            spatial_indexes = [
              {
                path = "/location/*"
              }
            ]
          }
        }
      }
    }
  }
```

Type:

```hcl
map(object({
    name = string

    throughput = optional(number, null)

    autoscale_settings = optional(object({
      max_throughput = number
    }), null)

    containers = optional(map(object({
      partition_key_path = string
      name               = string

      throughput             = optional(number, null)
      default_ttl            = optional(number, null)
      analytical_storage_ttl = optional(number, null)

      unique_keys = optional(list(object({
        paths = set(string)
      })), [])

      autoscale_settings = optional(object({
        max_throughput = number
      }), null)

      functions = optional(map(object({
        body = string
        name = string
      })), {})

      stored_procedures = optional(map(object({
        body = string
        name = string
      })), {})

      triggers = optional(map(object({
        body      = string
        type      = string
        operation = string
        name      = string
      })), {})

      conflict_resolution_policy = optional(object({
        mode                          = string
        conflict_resolution_path      = optional(string, null)
        conflict_resolution_procedure = optional(string, null)
      }), null)

      indexing_policy = optional(object({
        indexing_mode = string

        included_paths = optional(set(object({
          path = string
        })), [])

        excluded_paths = optional(set(object({
          path = string
        })), [])

        composite_indexes = optional(set(object({
          indexes = set(object({
            path  = string
            order = string
          }))
        })), [])

        spatial_indexes = optional(set(object({
          path = string
        })), [])
      }), null)

    })), {})
  }))
```

Default: `{}`

### <a name="input_sql_dedicated_gateway"></a> [sql\_dedicated\_gateway](#input\_sql\_dedicated\_gateway)

Description:   Defaults to `null`. Manages a SQL Dedicated Gateway within a Cosmos DB Account.

  - `instance_size`  - (Optional) - The instance size for the CosmosDB SQL Dedicated Gateway. Changing this forces a new resource to be created. Possible values are `Cosmos.D4s`, `Cosmos.D8s` and `Cosmos.D16s`
  - `instance_count` - (Optional) - The instance count for the CosmosDB SQL Dedicated Gateway. Possible value is between `1` and `5`.

  > Note: To create a dedicated gateway in a zone redundant region you must request Azure to enable it into your account. See more in: https://learn.microsoft.com/en-us/azure/cosmos-db/dedicated-gateway#provisioning-the-dedicated-gateway

  Example inputs:
  ```hcl
  sql_dedicated_gateway = {
    instance_count = 1
    instance_size  = "Cosmos.D4s"
  }
```

Type:

```hcl
object({
    instance_size  = string
    instance_count = optional(number, 1)
  })
```

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description:   Defaults to `{}`. A mapping of tags to assign to the resource. These tags will propagate to any child resource unless overriden when creating the child resource

  Example Inputs:
  ```hcl
  tags = {
    environment = "testing"
  }
```

Type: `map(string)`

Default: `null`

### <a name="input_virtual_network_rules"></a> [virtual\_network\_rules](#input\_virtual\_network\_rules)

Description:   Defaults to `[]`. Used to define which subnets are allowed to access this CosmosDB account.

  - `subnet_id` - (Required) - The ID of the virtual network subnet.

  > Note: Remember to enable Microsoft.AzureCosmosDB service endpoint on the subnet.

  Example inputs:
  ```hcl
  virtual_network_rule = [
    {
      subnet_id = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}/subnets/{subnetName}"
    }
  ]
```

Type:

```hcl
set(object({
    subnet_id = string
  }))
```

Default: `[]`

## Outputs

The following outputs are exported:

### <a name="output_cosmosdb_keys"></a> [cosmosdb\_keys](#output\_cosmosdb\_keys)

Description: The keys for the CosmosDB Account.

### <a name="output_cosmosdb_mongodb_connection_strings"></a> [cosmosdb\_mongodb\_connection\_strings](#output\_cosmosdb\_mongodb\_connection\_strings)

Description: The MongoDB connection strings for the CosmosDB Account.

### <a name="output_cosmosdb_sql_connection_strings"></a> [cosmosdb\_sql\_connection\_strings](#output\_cosmosdb\_sql\_connection\_strings)

Description: The SQL connection strings for the CosmosDB Account.

### <a name="output_mongo_databases"></a> [mongo\_databases](#output\_mongo\_databases)

Description: A map of the MongoDB databases created, with the database name as the key and the database id and collections as the value.

### <a name="output_name"></a> [name](#output\_name)

Description: The name of the cosmos db account created.

### <a name="output_resource_diagnostic_settings"></a> [resource\_diagnostic\_settings](#output\_resource\_diagnostic\_settings)

Description: A map of the diagnostic settings created, with the diagnostic setting name as the key and the diagnostic setting ID as the value.

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: The resource ID of the cosmos db account created.

### <a name="output_resource_locks"></a> [resource\_locks](#output\_resource\_locks)

Description: A map of the management locks created, with the lock name as the key and the lock ID as the value.

### <a name="output_resource_private_endpoints"></a> [resource\_private\_endpoints](#output\_resource\_private\_endpoints)

Description: A map of the management locks created, with the lock name as the key and the lock ID as the value.

### <a name="output_resource_private_endpoints_application_security_group_association"></a> [resource\_private\_endpoints\_application\_security\_group\_association](#output\_resource\_private\_endpoints\_application\_security\_group\_association)

Description: The IDs of the private endpoint application security group associations created.

### <a name="output_resource_role_assignments"></a> [resource\_role\_assignments](#output\_resource\_role\_assignments)

Description: A map of the role assignments created, with the assignment key as the map key and the assignment value as the map value.

### <a name="output_sql_databases"></a> [sql\_databases](#output\_sql\_databases)

Description: A map of the SQL databases created, with the database name as the key and the database ID, containers, functions, stored\_procedures and triggers as the value.

### <a name="output_sql_dedicated_gateway"></a> [sql\_dedicated\_gateway](#output\_sql\_dedicated\_gateway)

Description: The IDs of the SQL dedicated gateways created.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->