## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.integration_key_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_groups"></a> [action\_groups](#input\_action\_groups) | n/a | <pre>map(object({<br>    name                = string<br>    short_name          = string<br>    resource_group_name = string<br>    enabled             = optional(bool)<br>    location            = optional(string) # Audit: Clarify location default (global if not specified by Azure)<br>    tags                = optional(map(string))<br>    webhook_receivers = optional(list(object({<br>      name                    = string<br>      service_uri             = optional(string)<br>      key_vault_secret_id     = optional(string)<br>      use_common_alert_schema = optional(bool, true)<br>      aad_auth = optional(object({<br>        object_id      = string<br>        identifier_uri = optional(string)<br>        tenant_id      = optional(string)<br>      }))<br>    })))<br><br>    email_receivers = optional(list(object({<br>      name                    = string<br>      email_address           = string<br>      use_common_alert_schema = optional(bool, true)<br>    })))<br><br>    sms_receivers = optional(list(object({<br>      name         = string<br>      country_code = string<br>      phone_number = string<br>    })))<br><br>    voice_receivers = optional(list(object({<br>      name         = string<br>      country_code = string<br>      phone_number = string<br>    })))<br><br>    azure_function_receivers = optional(list(object({<br>      name                     = string<br>      function_app_resource_id = string<br>      function_name            = string<br>      http_trigger_url         = string<br>      use_common_alert_schema  = optional(bool, true)<br>    })))<br><br>    logic_app_receivers = optional(list(object({<br>      name                    = string<br>      resource_id             = string<br>      callback_url            = string<br>      use_common_alert_schema = optional(bool, true)<br>    })))<br><br>    event_hub_receivers = optional(list(object({<br>      name                    = string<br>      event_hub_namespace     = optional(string)<br>      event_hub_name          = optional(string)<br>      subscription_id         = optional(string)<br>      tenant_id               = optional(string)<br>      use_common_alert_schema = optional(bool, true)<br>    })))<br><br>    itsm_receivers = optional(list(object({<br>      name                 = string<br>      workspace_id         = string<br>      connection_id        = string<br>      ticket_configuration = string<br>      region               = string<br>    })))<br><br>    arm_role_receivers = optional(list(object({<br>      name                    = string<br>      role_id                 = string<br>      use_common_alert_schema = optional(bool, true)<br>    })))<br><br>    automation_runbook_receivers = optional(list(object({<br>      name                    = string<br>      automation_account_id   = string<br>      runbook_name            = string<br>      webhook_resource_id     = string<br>      is_global_runbook       = bool<br>      service_uri             = string<br>      use_common_alert_schema = optional(bool, true)<br>    })))<br><br>    azure_app_push_receivers = optional(list(object({<br>      name          = string<br>      email_address = string<br>    })))<br><br>  }))</pre> | `{}` | no |
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Name of the vault where you put the PagerDuty key | `string` | `""` | no |
| <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name) | The resource group associated with the vault | `string` | `""` | no |
| <a name="input_mal_id"></a> [mal\_id](#input\_mal\_id) | The MAL ID for tagging purposes. This is a mandatory tag for Lumen resources. | `string` | n/a | yes |
| <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration) | The migration tag used. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of additional custom tags to apply to the Action Group resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_action_group_ids"></a> [action\_group\_ids](#output\_action\_group\_ids) | A map of the action group names to their respective resource IDs. |
| <a name="output_action_group_names_map"></a> [action\_group\_names\_map](#output\_action\_group\_names\_map) | A map of the action group keys (from input variable) to their created names. |
| <a name="output_action_group_resources"></a> [action\_group\_resources](#output\_action\_group\_resources) | A map of the full action group resources created, keyed by the input map keys. |
| <a name="output_action_group_short_names_map"></a> [action\_group\_short\_names\_map](#output\_action\_group\_short\_names\_map) | A map of the action group keys (from input variable) to their created short names. |
