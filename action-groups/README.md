<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.3.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.7.0, < 4.29.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (>= 3.5.0, < 4.0.0)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.7.0, < 4.29.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_monitor_action_group.group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) (resource)
- [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) (data source)
- [azurerm_key_vault_secret.integration_key_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_app_id"></a> [app\_id](#input\_app\_id)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration)

Description: The migration tag used.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_action_groups"></a> [action\_groups](#input\_action\_groups)

Description: n/a

Type:

```hcl
map(object({
    name                = string
    short_name          = string
    resource_group_name = string
    enabled             = optional(bool)
    location            = optional(string)
    tags                = optional(map(string))
    webhook_receivers = optional(list(object({
      name                    = string
      service_uri             = optional(string)
      key_vault_secret_id     = optional(string)
      use_common_alert_schema = optional(bool, true)
      aad_auth = optional(object({
        object_id      = string
        identifier_uri = optional(string)
        tenant_id      = optional(string)
      }))
    })))

    email_receivers = optional(list(object({
      name                    = string
      email_address           = string
      use_common_alert_schema = optional(bool, true)
    })))

    sms_receivers = optional(list(object({
      name         = string
      country_code = string
      phone_number = string
    })))

    voice_receivers = optional(list(object({
      name         = string
      country_code = string
      phone_number = string
    })))

    azure_function_receivers = optional(list(object({
      name                     = string
      function_app_resource_id = string
      function_name            = string
      http_trigger_url         = string
      use_common_alert_schema  = optional(bool, true)
    })))

    logic_app_receivers = optional(list(object({
      name                    = string
      resource_id             = string
      callback_url            = string
      use_common_alert_schema = optional(bool, true)
    })))

    event_hub_receivers = optional(list(object({
      name                    = string
      event_hub_namespace     = optional(string)
      event_hub_name          = optional(string)
      subscription_id         = optional(string)
      tenant_id               = optional(string)
      use_common_alert_schema = optional(bool, true)
    })))

    itsm_receivers = optional(list(object({
      name                 = string
      workspace_id         = string
      connection_id        = string
      ticket_configuration = string
      region               = string
    })))

    arm_role_receivers = optional(list(object({
      name                    = string
      role_id                 = string
      use_common_alert_schema = optional(bool, true)
    })))

    automation_runbook_receivers = optional(list(object({
      name                    = string
      automation_account_id   = string
      runbook_name            = string
      webhook_resource_id     = string
      is_global_runbook       = bool
      service_uri             = string
      use_common_alert_schema = optional(bool, true)
    })))

    azure_app_push_receivers = optional(list(object({
      name          = string
      email_address = string
    })))

  }))
```

Default: `{}`

### <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name)

Description: Name of the vault where you put the PagerDuty key

Type: `string`

Default: `""`

### <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name)

Description: The resource group associated with the vault

Type: `string`

Default: `""`

## Outputs

No outputs.
<!-- END_TF_DOCS -->