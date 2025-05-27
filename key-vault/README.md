# Key Vault Module

## IMPORTANT INFORMATION

:warning: **This module has been updated to use Azure Verified Modules please take care when updating and consider moving the resources in your tfstate**

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9, < 2.0)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (>= 2.48.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.87)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azuread"></a> [azuread](#provider\_azuread) (>= 2.48.0)

- <a name="provider_validation"></a> [validation](#provider\_validation) (~> 1.1.1)

## Modules

The following Modules are called:

### <a name="module_avm-res-keyvault-vault"></a> [avm-res-keyvault-vault](#module\_avm-res-keyvault-vault)

Source: Azure/avm-res-keyvault-vault/azurerm

Version: 0.9.1

## Resources

The following resources are used by this module:

- [validation_warning.access_policies](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appFunction](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appid](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAllocation](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerManager](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerTech](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costBudgetOwner](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costCostCenter](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costDivision](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costVP](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costbaseline](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.monthlyBudget](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.resourcetype](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.soft_delete_enabled](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [azuread_application.app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application) (data source)
- [azuread_service_principal.spn](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

### <a name="input_app_id"></a> [app\_id](#input\_app\_id)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_appname"></a> [appname](#input\_appname)

Description: the app name for the resources.  Used for tagging and naming purposes

Type: `string`

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where resources will be deployed

Type: `string`

### <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration)

Description: The migration tag used.

Type: `string`

### <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids)

Description: id of the private dns zone

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: Resource group name for where the acr will be deployed

Type: `string`

### <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id)

Description: subnet id to deploy the PE to

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies)

Description: List of access policies for the key vault

Type:

```hcl
list(object({
    tenant_id               = string
    object_id               = string
    secret_permissions      = list(string)
    key_permissions         = list(string)
    certificate_permissions = list(string)
    storage_permissions     = list(string)
  }))
```

Default: `null`

### <a name="input_appFunction"></a> [appFunction](#input\_appFunction)

Description: app function

Type: `string`

Default: `""`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

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

### <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings)

Description: A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.
- `log_categories` - (Optional) A set of log categories to send to the log analytics workspace. Defaults to `[]`.
- `log_groups` - (Optional) A set of log groups to send to the log analytics workspace. Defaults to `["allLogs"]`.
- `metric_categories` - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to `["AllMetrics"]`.
- `log_analytics_destination_type` - (Optional) The destination type for the diagnostic setting. Possible values are `Dedicated` and `AzureDiagnostics`. Defaults to `Dedicated`.
- `workspace_resource_id` - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.
- `storage_account_resource_id` - (Optional) The resource ID of the storage account to send logs and metrics to.
- `event_hub_authorization_rule_resource_id` - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.
- `event_hub_name` - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.
- `marketplace_partner_resource_id` - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.

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

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see https://aka.ms/avm/telemetryinfo.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment)

Description: (Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false

Type: `bool`

Default: `true`

### <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment)

Description: Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false

Type: `bool`

Default: `true`

### <a name="input_endpoint_location"></a> [endpoint\_location](#input\_endpoint\_location)

Description: The Azure region where the private endpoint should be created. Defaults to the resource group location.

Type: `string`

Default: `null`

### <a name="input_existing_name"></a> [existing\_name](#input\_existing\_name)

Description: The name of the existing key vault to use. If not set, a new key vault will be created.

Type: `string`

Default: `null`

### <a name="input_keys"></a> [keys](#input\_keys)

Description: A map of keys to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` - The name of the key.
- `key_type` - The type of the key. Possible values are `EC` and `RSA`.
- `key_opts` - A list of key options. Possible values are `decrypt`, `encrypt`, `sign`, `unwrapKey`, `verify`, and `wrapKey`.
- `key_size` - The size of the key. Required for `RSA` keys.
- `curve` - The curve of the key. Required for `EC` keys.  Possible values are `P-256`, `P-256K`, `P-384`, and `P-521`. The API will default to `P-256` if nothing is specified.
- `not_before_date` - The not before date of the key.
- `expiration_date` - The expiration date of the key.
- `tags` - A mapping of tags to assign to the key.
- `rotation_policy` - The rotation policy of the key.
  - `automatic` - The automatic rotation policy of the key.
    - `time_after_creation` - The time after creation of the key before it is automatically rotated.
    - `time_before_expiry` - The time before expiry of the key before it is automatically rotated.
  - `expire_after` - The time after which the key expires.
  - `notify_before_expiry` - The time before expiry of the key when notification emails will be sent.

Supply role assignments in the same way as for `var.role_assignments`.

Type:

```hcl
map(object({
    name     = string
    key_type = string
    key_opts = optional(list(string), ["sign", "verify"])

    key_size        = optional(number, null)
    curve           = optional(string, null)
    not_before_date = optional(string, null)
    expiration_date = optional(string, null)
    tags            = optional(map(any), null)

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})

    rotation_policy = optional(object({
      automatic = optional(object({
        time_after_creation = optional(string, null)
        time_before_expiry  = optional(string, null)
      }), null)
      expire_after         = optional(string, null)
      notify_before_expiry = optional(string, null)
    }), null)
  }))
```

Default: `{}`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

Default: `""`

### <a name="input_network_interface_name"></a> [network\_interface\_name](#input\_network\_interface\_name)

Description: `network_interface_name` - (Optional) The name of the network interface. One will be generated if not set.

Type: `string`

Default: `null`

### <a name="input_network_role_assignments"></a> [network\_role\_assignments](#input\_network\_role\_assignments)

Description: A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - The condition which will be used to scope the role assignment.
- `condition_version` - The version of the condition syntax. If you are using a condition, valid values are '2.0'.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

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

### <a name="input_rbac_enabled"></a> [rbac\_enabled](#input\_rbac\_enabled)

Description: Boolean flag to specify whether Azure Key Vault is enabled for RBAC. Defaults to false

Type: `bool`

Default: `false`

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: the resource type being deployed see naming standards for example

Type: `string`

Default: `""`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description: A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - The condition which will be used to scope the role assignment.
- `condition_version` - The version of the condition syntax. If you are using a condition, valid values are '2.0'.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

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

### <a name="input_secrets"></a> [secrets](#input\_secrets)

Description: A map of secrets to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` - The name of the secret.
- `content_type` - The content type of the secret.
- `tags` - A mapping of tags to assign to the secret.
- `not_before_date` - The not before date of the secret.
- `expiration_date` - The expiration date of the secret.

Supply role assignments in the same way as for `var.role_assignments`.

> Note: the `value` of the secret is supplied via the `var.secrets_value` variable. Make sure to use the same map key.

Type:

```hcl
map(object({
    name            = string
    content_type    = optional(string, null)
    tags            = optional(map(any), null)
    not_before_date = optional(string, null)
    expiration_date = optional(string, null)

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
  }))
```

Default: `{}`

### <a name="input_secrets_value"></a> [secrets\_value](#input\_secrets\_value)

Description: A map of secret keys to values.  
The map key is the supplied input to `var.secrets`.  
The map value is the secret value.

This is a separate variable to `var.secrets` because it is sensitive and therefore cannot be used in a `for_each` loop.

Type: `map(string)`

Default: `null`

### <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name)

Description: he Name of the SKU used for this Key Vault. Possible values are standard and premium.

Type: `string`

Default: `"standard"`

### <a name="input_soft_delete_enabled"></a> [soft\_delete\_enabled](#input\_soft\_delete\_enabled)

Description: WARNING: Deprecated. v1.0 ignores it and v2.0 will delete this variable

Type: `bool`

Default: `null`

### <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days)

Description: The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90

Type: `number`

Default: `7`

### <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id)

Description: The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault.

Type: `string`

Default: `"72b17115-9915-42c0-9f1b-4f98e5a4bcd2"`

## Outputs

The following outputs are exported:

### <a name="output_id"></a> [id](#output\_id)

Description: The id of the key vault created.

### <a name="output_name"></a> [name](#output\_name)

Description: The name of the key vault created.

### <a name="output_private_endpoints"></a> [private\_endpoints](#output\_private\_endpoints)

Description: A map of private endpoints. The map key is the supplied input to var.private\_endpoints. The map value is the entire azurerm\_private\_endpoint resource.

### <a name="output_url"></a> [url](#output\_url)

Description: The URI of the vault for performing operations on keys and secrets
<!-- END_TF_DOCS -->