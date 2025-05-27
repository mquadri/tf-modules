<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (>= 1.0.0)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (>= 2.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.116, < 5.0)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.116, < 5.0)

- <a name="provider_validation"></a> [validation](#provider\_validation) (~> 1.1.1)

## Modules

The following Modules are called:

### <a name="module_avm_res_resources_resourcegroup"></a> [avm\_res\_resources\_resourcegroup](#module\_avm\_res\_resources\_resourcegroup)

Source: ../resource-groups

Version:

### <a name="module_diagnostics-setting-setup"></a> [diagnostics-setting-setup](#module\_diagnostics-setting-setup)

Source: ../diagnostic-setting

Version:

### <a name="module_private-endpoint-setup"></a> [private-endpoint-setup](#module\_private-endpoint-setup)

Source: ../private-endpoint

Version:

### <a name="module_role_assignments"></a> [role\_assignments](#module\_role\_assignments)

Source: Azure/avm-res-authorization-roleassignment/azurerm

Version: 0.2.0

## Resources

The following resources are used by this module:

- [azurerm_backup_policy_file_share.file_share_backup_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_file_share) (resource)
- [azurerm_backup_policy_vm.vm_backup_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm) (resource)
- [azurerm_recovery_services_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) (resource)
- [validation_warning.managed_by](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.role_assignments_for_resources](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.role_definitions](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.system_assigned_managed_identities_by_principal_id](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.user_assigned_managed_identities_by_resource_group_and_name](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) (data source)
- [azurerm_key_vault_key.kv_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_key) (data source)
- [azurerm_resource_group.rgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_user_assigned_identity.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/user_assigned_identity) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_app_id"></a> [app\_id](#input\_app\_id)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_diagnostics_settings_name"></a> [diagnostics\_settings\_name](#input\_diagnostics\_settings\_name)

Description: The diagnostics setting name of the resource on.

Type: `string`

### <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name)

Description: The name of the private dns zone.

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_logs_destinations_ids"></a> [logs\_destinations\_ids](#input\_logs\_destinations\_ids)

Description: List of destination resources IDs for logs diagnostic destination.  
Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.  
If you want to use Azure EventHub as destination, you must provide a formatted string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character.

Type: `list(string)`

### <a name="input_migration"></a> [migration](#input\_migration)

Description: The migration tag used.

Type: `string`

### <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name)

Description: The Subnet name attached to private endpoint

Type: `string`

### <a name="input_recovery_services_vault_name"></a> [recovery\_services\_vault\_name](#input\_recovery\_services\_vault\_name)

Description: Name of the Recovery Services Vault to be created

Type: `string`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The Subscription ID

Type: `string`

### <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name)

Description: The VNET name attached to private endpoint

Type: `string`

### <a name="input_virtual_network_rg"></a> [virtual\_network\_rg](#input\_virtual\_network\_rg)

Description: The VNET RG name attached to private endpoint

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_a_records"></a> [a\_records](#input\_a\_records)

Description: A map of objects where each object contains information to create a A record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records)

Description: A map of objects where each object contains information to create a AAAA record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

Default: `""`

### <a name="input_appFunction"></a> [appFunction](#input\_appFunction)

Description: app function

Type: `string`

Default: `""`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_appname"></a> [appname](#input\_appname)

Description: the app name for the resources.  Used for tagging and naming purposes

Type: `string`

Default: `""`

### <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records)

Description: A map of objects where each object contains information to create a CNAME record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    record              = string
    tags                = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation)

Description: can only be sharedcosts or chargeback

Type: `string`

Default: `""`

### <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager)

Description: The app owner manager responsible for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech)

Description: The app owner responsible for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner)

Description: The budget owner responsible for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter)

Description: The cost center code for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_costDivision"></a> [costDivision](#input\_costDivision)

Description: cost division

Type: `string`

Default: `""`

### <a name="input_costVP"></a> [costVP](#input\_costVP)

Description: The cost vp for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline)

Description: year resource created

Type: `string`

Default: `""`

### <a name="input_create_dns_zone"></a> [create\_dns\_zone](#input\_create\_dns\_zone)

Description: choose if DNS zone should be created or not

Type: `bool`

Default: `false`

### <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group)

Description: Set this to true if a new RG is required.

Type: `bool`

Default: `false`

### <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id)

Description: The ID of the DNS zone if provided by the user

Type: `string`

Default: `""`

### <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting)

Description: Choose if Diagnostic setting should be enabled

Type: `bool`

Default: `true`

### <a name="input_enable_encryption"></a> [enable\_encryption](#input\_enable\_encryption)

Description: Variable to define if encryption in recovery vault should be enabled or not

Type: `bool`

Default: `false`

### <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint)

Description: Variable to define if private endpoint should be enabled or not

Type: `bool`

Default: `false`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see https://aka.ms/avm/telemetryinfo.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_excluded_log_categories"></a> [excluded\_log\_categories](#input\_excluded\_log\_categories)

Description: List of log categories to exclude.

Type: `list(string)`

Default: `[]`

### <a name="input_existing_user_assigned_identity_name"></a> [existing\_user\_assigned\_identity\_name](#input\_existing\_user\_assigned\_identity\_name)

Description: Provide existing user assigned identity name

Type: `string`

Default: `null`

### <a name="input_file_share_backup_policies"></a> [file\_share\_backup\_policies](#input\_file\_share\_backup\_policies)

Description: A list of backup policies for file shares.

Type:

```hcl
map(object({
    name      = string
    timezone  = string
    frequency = string
    time      = string
    daily = optional(list(object({
      count = number
    })), [])
    weekly = optional(list(object({
      count    = number
      weekdays = set(string)
    })), [])
    monthly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
    yearly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      months            = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
  }))
```

Default: `{}`

### <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled)

Description: Choose if infra encryption should be enabled

Type: `bool`

Default: `false`

### <a name="input_key_vault_key_name"></a> [key\_vault\_key\_name](#input\_key\_vault\_key\_name)

Description: Provide Keyvault key name

Type: `string`

Default: `null`

### <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name)

Description: Provide Keyvault name

Type: `string`

Default: `null`

### <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name)

Description: Provide Keyvault RG name

Type: `string`

Default: `null`

### <a name="input_kv_role_definition"></a> [kv\_role\_definition](#input\_kv\_role\_definition)

Description: n/a

Type: `string`

Default: `"Key Vault Crypto Service Encryption User"`

### <a name="input_location"></a> [location](#input\_location)

Description: The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'

Type: `string`

Default: `null`

### <a name="input_lock"></a> [lock](#input\_lock)

Description:   Controls the Resource Lock configuration for this resource. The following properties can be specified:

  - `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
  - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.

Type:

```hcl
object({
    kind = string
    name = optional(string, null)
  })
```

Default: `null`

### <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type)

Description: When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table.

Type: `string`

Default: `"AzureDiagnostics"`

### <a name="input_log_categories"></a> [log\_categories](#input\_log\_categories)

Description: List of log categories. Defaults to all available.

Type: `list(string)`

Default: `null`

### <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by)

Description: resource group is managed by

Type: `string`

Default: `null`

### <a name="input_metric_categories"></a> [metric\_categories](#input\_metric\_categories)

Description: List of metric categories. Defaults to all available.

Type: `list(string)`

Default: `null`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

Default: `""`

### <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration)

Description: The msftmigration tag used.

Type: `string`

Default: `null`

### <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records)

Description: A map of objects where each object contains information to create a MX record.

Type:

```hcl
map(object({
    name                = optional(string, "@")
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      preference = number
      exchange   = string
    }))
    tags = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints)

Description: Private Endpoints for the supported resources

Type:

```hcl
map(object({
    name                           = string
    private_connection_resource_id = string
    is_manual_connection           = optional(bool)
    subresource_names              = list(string)
    request_message                = optional(string)
    private_dns_zone_group_name    = optional(string)
    private_dns_zone_ids           = optional(list(string))
  }))
```

Default: `{}`

### <a name="input_ptr_records"></a> [ptr\_records](#input\_ptr\_records)

Description: A map of objects where each object contains information to create a PTR record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_vault_cross_region_restore_enabled"></a> [recovery\_vault\_cross\_region\_restore\_enabled](#input\_recovery\_vault\_cross\_region\_restore\_enabled)

Description: Is cross region restore enabled for this Vault? Only can be `true`, when `storage_mode_type` is `GeoRedundant`. Defaults to `false`.

Type: `bool`

Default: `false`

### <a name="input_recovery_vault_identity_type"></a> [recovery\_vault\_identity\_type](#input\_recovery\_vault\_identity\_type)

Description: Azure Recovery Vault identity type. Possible values include: `null`, `SystemAssigned`. Default to `SystemAssigned`.

Type: `string`

Default: `null`

### <a name="input_recovery_vault_immutability"></a> [recovery\_vault\_immutability](#input\_recovery\_vault\_immutability)

Description: Immutability Settings of vault, possible values include: Locked, Unlocked and Disabled.

Type: `string`

Default: `"Disabled"`

### <a name="input_recovery_vault_public_access_enabled"></a> [recovery\_vault\_public\_access\_enabled](#input\_recovery\_vault\_public\_access\_enabled)

Description: Choose if Recovery vault public access should be enabled

Type: `bool`

Default: `false`

### <a name="input_recovery_vault_sku"></a> [recovery\_vault\_sku](#input\_recovery\_vault\_sku)

Description: Azure Recovery Vault SKU. Possible values include: `Standard`, `RS0`. Default to `Standard`.

Type: `string`

Default: `"Standard"`

### <a name="input_recovery_vault_soft_delete_enabled"></a> [recovery\_vault\_soft\_delete\_enabled](#input\_recovery\_vault\_soft\_delete\_enabled)

Description: Is soft delete enable for this Vault? Defaults to `true`.

Type: `bool`

Default: `true`

### <a name="input_recovery_vault_storage_mode_type"></a> [recovery\_vault\_storage\_mode\_type](#input\_recovery\_vault\_storage\_mode\_type)

Description: The storage type of the Recovery Services Vault. Possible values are `GeoRedundant`, `LocallyRedundant` and `ZoneRedundant`. Defaults to `GeoRedundant`.

Type: `string`

Default: `"LocallyRedundant"`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: A container that holds related resources for an Azure solution

Type: `string`

Default: `null`

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: the resource type being deployed see naming standards for example

Type: `string`

Default: `""`

### <a name="input_rg_role_assignments"></a> [rg\_role\_assignments](#input\_rg\_role\_assignments)

Description: The role assignment to be assigned to the resource group

Type:

```hcl
map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_role_assignments_for_resources"></a> [role\_assignments\_for\_resources](#input\_role\_assignments\_for\_resources)

Description: Define necessary role assignments for resources

Type:

```hcl
map(object({
    resource_name       = string
    resource_group_name = string
    role_assignments = map(object({
      role_definition                    = string
      users                              = optional(set(string), [])
      groups                             = optional(set(string), [])
      app_registrations                  = optional(set(string), [])
      system_assigned_managed_identities = optional(set(string), [])
      user_assigned_managed_identities   = optional(set(string), [])
      any_principals                     = optional(set(string), [])
    }))
  }))
```

Default: `{}`

### <a name="input_role_definitions"></a> [role\_definitions](#input\_role\_definitions)

Description: Define the required role definition

Type:

```hcl
map(object({
    id    = optional(string)
    name  = optional(string)
    scope = optional(string)
  }))
```

Default: `{}`

### <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record)

Description: optional soa\_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com

Type:

```hcl
object({
    email        = string
    expire_time  = optional(number, 2419200)
    minimum_ttl  = optional(number, 10)
    refresh_time = optional(number, 3600)
    retry_time   = optional(number, 300)
    ttl          = optional(number, 3600)
    tags         = optional(map(string), null)
  })
```

Default: `null`

### <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records)

Description: A map of objects where each object contains information to create a SRV record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      priority = number
      weight   = number
      port     = number
      target   = string
    }))
    tags = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_system_assigned_managed_identities_by_principal_id"></a> [system\_assigned\_managed\_identities\_by\_principal\_id](#input\_system\_assigned\_managed\_identities\_by\_principal\_id)

Description: Define system assigned managed identity details

Type: `map(string)`

Default: `{}`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: (Optional) Tags of the resource.

Type: `map(string)`

Default: `null`

### <a name="input_txt_records"></a> [txt\_records](#input\_txt\_records)

Description: A map of objects where each object contains information to create a TXT record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      value = string
    }))
    tags = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_user_assigned_identity_rg_name"></a> [user\_assigned\_identity\_rg\_name](#input\_user\_assigned\_identity\_rg\_name)

Description: Provide existing user assigned identity RG name

Type: `string`

Default: `null`

### <a name="input_user_assigned_managed_identities_by_resource_group_and_name"></a> [user\_assigned\_managed\_identities\_by\_resource\_group\_and\_name](#input\_user\_assigned\_managed\_identities\_by\_resource\_group\_and\_name)

Description: Define user assigned managed identity details

Type:

```hcl
map(object({
    resource_group_name = string
    name                = string
  }))
```

Default: `{}`

### <a name="input_virtual_network_links"></a> [virtual\_network\_links](#input\_virtual\_network\_links)

Description: A map of objects where each object contains information to create a virtual network link.

Type:

```hcl
map(object({
    vnetlinkname     = string
    vnetid           = string
    autoregistration = optional(bool, false)
    tags             = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_vm_backup_policies"></a> [vm\_backup\_policies](#input\_vm\_backup\_policies)

Description: A list of backup policies for VMs.

Type:

```hcl
map(object({
    name                           = string
    policy_type                    = string
    timezone                       = string
    instant_restore_retention_days = optional(number)
    frequency                      = string
    time                           = string
    hour_interval                  = optional(number)
    hour_duration                  = optional(number)
    weekdays                       = optional(set(string))
    daily = optional(list(object({
      count = number
    })), [])
    weekly = optional(list(object({
      count    = number
      weekdays = optional(set(string))
    })), [])
    monthly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
    yearly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      months            = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
  }))
```

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_recovery_vault_id"></a> [recovery\_vault\_id](#output\_recovery\_vault\_id)

Description: Azure Recovery Services Vault ID

### <a name="output_recovery_vault_name"></a> [recovery\_vault\_name](#output\_recovery\_vault\_name)

Description: Azure Recovery Services Vault name

### <a name="output_vm_backup_policy"></a> [vm\_backup\_policy](#output\_vm\_backup\_policy)

Description: The IDs of the VM Backup Policies

### <a name="output_vm_backup_policy_instant_restore_retention_days"></a> [vm\_backup\_policy\_instant\_restore\_retention\_days](#output\_vm\_backup\_policy\_instant\_restore\_retention\_days)

Description: The instant restore retention days of the VM Backup Policies

### <a name="output_vm_backup_policy_names"></a> [vm\_backup\_policy\_names](#output\_vm\_backup\_policy\_names)

Description: The names of the VM Backup Policies

### <a name="output_vm_backup_policy_policy_types"></a> [vm\_backup\_policy\_policy\_types](#output\_vm\_backup\_policy\_policy\_types)

Description: The policy types of the VM Backup Policies

### <a name="output_vm_backup_policy_recovery_vault_names"></a> [vm\_backup\_policy\_recovery\_vault\_names](#output\_vm\_backup\_policy\_recovery\_vault\_names)

Description: The recovery vault names of the VM Backup Policies

### <a name="output_vm_backup_policy_resource_group_names"></a> [vm\_backup\_policy\_resource\_group\_names](#output\_vm\_backup\_policy\_resource\_group\_names)

Description: The resource group names of the VM Backup Policies

### <a name="output_vm_backup_policy_timezones"></a> [vm\_backup\_policy\_timezones](#output\_vm\_backup\_policy\_timezones)

Description: The timezones of the VM Backup Policies
<!-- END_TF_DOCS -->

## Example Usage

```hcl
module "example_private_dns" {
  source              = "path/to/module"

  # Required Inputs
  name         = "example.com"
  resource_group_name = "example-resource-group"
  location     = "EastUS"
  sku          = "Standard"

  # Optional Inputs
  tags             = var.tags
  immutability     = var.immutability
  .
  .
}
```


## Example Tfvars

```hcl
create_resource_group                = true
enable_telemetry                     = true
resource_group_name                  = "avmModuleTesting2"
location                             = "EastUS"
recovery_services_vault_name         = "testrecoveryvaulteus"
key_vault_name                       = "testkvLu110"
key_vault_rg_name                    = "test-rg18"
key_vault_key_name                   = "test-key"
kv_role_definition                   = "Key Vault Crypto Officer"
recovery_vault_public_access_enabled = false
enable_encryption                    = true
enable_private_endpoint              = true
recovery_vault_identity_type         = "SystemAssigned"
# user_assigned_identity_rg_name       = "test-rg18" ##Should be provided if the recovery_vault_identity_type = "UserAssigned"
# existing_user_assigned_identity_name = "testuseridentity046" ##Should be provided if the recovery_vault_identity_type = "UserAssigned"
vm_backup_policies = {
  "test-whg-db-bkp-01" = {
    name                           = "test-whg-db-bkp-01"
    policy_type                    = "V2"
    timezone                       = "Eastern Standard Time"
    instant_restore_retention_days = 5
    frequency                      = "Daily"
    time                           = "02:00"
    daily = [{
      count = 30
    }]
    weekly = [{
      count    = 4
      weekdays = ["Sunday"]
    }]
    monthly = [{
      count    = 6
      weekdays = ["Sunday"]
      weeks    = ["First"]
    }]
    yearly = [{
      count    = 1
      months   = ["January"]
      weekdays = ["Sunday"]
      weeks    = ["First"]
    }]
  }
}

private_endpoints = {
  "pe1" = {
    name                 = "private-endpoint-23"
    subresource_names    = ["AzureSiteRecovery"]
    is_manual_connection = false
  }
}
# Azure Subscription ID
subscription_id = ""

# Virtual Network Details
virtual_network_rg   = "test-rg18"
virtual_network_name = "testvnet58"
pe_subnet_name       = "default"
dns_zone_id          = ""
create_dns_zone      = true
tags = {
  Environment = "Development"
  Department  = "IT"
}
diagnostics_settings_name = "test-diag1"
domain_name               = "test.project.com"
logs_destinations_ids     = [""]
enable_diagnostic_setting = true
virtual_network_links = {
  "test-vnet-link" = {
    vnetlinkname = "test-vnet-link5"
    vnetid       = ""
  }
}

# Tag variable values
resourcetype        = "rsv"
appid               = "ap01"
appname             = "infra"
env                 = "dev"
costcostcenter      = "test"
costvp              = "VP"
costappownertech    = "owner"
costappownermanager = "Manager"
costbudgetowner     = "budget owner"
costdivision        = "IT"
appfunction         = "exmaple general Prod Subscription"
costbaseline        = "2024"
costallocation      = "sharedcost"
monthlybudget       = "1000"
managed_by          = "own"
additionalcontext   = "01"
```