# Azure Monitor Action Groups Terraform Module (Lumen Audit Compliant)

## Description

This Terraform module creates and manages Azure Monitor Action Groups. Action Groups are a collection of notification preferences and actions that can be triggered by an Azure alert. This module allows for a flexible configuration of various receiver types (email, SMS, webhook, ITSM, Logic App, Azure Function, Event Hub, etc.) through a map input variable.

The module supports:
- Defining multiple action groups, each with its own set of receivers.
- Integrating with Azure Key Vault to securely retrieve sensitive webhook URIs.
- Applying Lumen standard tags, including a mandatory `mal_id`.
- Custom tags per action group and general tags for all action groups created by an instance of this module.

## Prerequisites

- Azure Subscription and Resource Group where the Action Groups will be deployed.
- Terraform v1.0.0 or later.
- Azure Provider (azurerm) configured with appropriate permissions to create Action Groups and read from Key Vault if that feature is used.
- **For specific receiver types, ensure the target resources exist and are accessible:**
    -   `webhook_receivers`: If using Key Vault for service URIs, the Key Vault and secret must exist.
    -   `email_receivers`: Valid email addresses.
    -   `sms_receivers`: Valid phone numbers and country codes.
    -   `voice_receivers`: Valid phone numbers and country codes.
    -   `azure_function_receivers`: The Azure Function App and the specific function must exist.
    -   `logic_app_receivers`: The Azure Logic App must exist and its callback URL and resource ID must be provided.
    -   `event_hub_receivers`: The Event Hub Namespace and Event Hub must exist.
    -   `itsm_receivers`: The ITSM workspace and connection details must be valid.
    -   `arm_role_receivers`: The specified ARM role ID must be valid.
    -   `automation_runbook_receivers`: The Automation Account, Runbook, and Webhook must exist.

## Usage

```terraform
module "action_groups_example" {
  source = "<path_to_this_module>" // Or your module source

  # Standard Lumen Tags (Applied to all action groups)
  app_id        = "APP001"
  environment   = "DEV"
  msftmigration = "NA" # Or relevant value
  mal_id        = "MAL00123"

  # Optional: General custom tags for all action groups
  tags = {
    Project = "CentralMonitoring"
  }

  # Optional: Key Vault details if using KV for webhook secrets
  # key_vault_name    = "my-kv-for-secrets"
  # key_vault_rg_name = "my-kv-rg"

  action_groups = {
    "critical_alerts_team_a" = {
      name                = "ag-team-a-critical"
      short_name          = "TeamACrit"
      resource_group_name = "my-monitoring-rg"
      location            = "Global" # Optional, defaults to "Global"
      tags = {
        Severity = "Critical"
        Team     = "TeamA"
      }
      email_receivers = [
        {
          name          = "team-a-email"
          email_address = "team.a@example.com"
        }
      ]
      sms_receivers = [
        {
          name         = "team-a-sms"
          country_code = "1"
          phone_number = "5551234567"
        }
      ]
      webhook_receivers = [
        {
          name        = "my-pagerduty-webhook"
          service_uri = "https://events.pagerduty.com/integration/xxxx/enqueue" 
          # Alternatively, using Key Vault:
          # key_vault_secret_id = "pagerduty-webhook-uri" # Name of the secret in the KV specified by var.key_vault_name
        }
      ]
    },
    "warning_alerts_team_b" = {
      name                = "ag-team-b-warning"
      short_name          = "TeamBWarn"
      resource_group_name = "my-monitoring-rg"
      email_receivers = [
        {
          name          = "team-b-email-alias"
          email_address = "team.b.alerts@example.com"
        }
      ]
    }
  }
}

output "action_group_ids_example" {
  description = "IDs of the created action groups."
  value       = module.action_groups_example.action_group_ids
}

output "action_group_names_map_example" {
  description = "Map of created action group names."
  value       = module.action_groups_example.action_group_names_map
}
```

## Variables

| Name                       | Description                                                                                                | Type        | Default | Required   |
|----------------------------|------------------------------------------------------------------------------------------------------------|-------------|---------|:----------:|
| `action_groups`            | A map of action group definitions. See module's `variables.tf` for the detailed object structure.          | `map(object(...))` | `{}`    | no         |
| `app_id`                   | The related application for resources. Used for tagging.                                                   | `string`    | n/a     | yes        |
| `environment`              | The environment code for resources. Used for tagging. (e.g., PROD, TEST, DEV)                            | `string`    | n/a     | yes        |
| `key_vault_name`           | Name of the Key Vault if using Key Vault for webhook secrets.                                              | `string`    | `""`    | no         |
| `key_vault_rg_name`        | Resource group of the Key Vault if using Key Vault for webhook secrets.                                    | `string`    | `""`    | no         |
| `mal_id`                   | The MAL ID for tagging purposes. This is a mandatory tag for Lumen resources.                              | `string`    | n/a     | yes        |
| `msftmigration`            | The Microsoft migration tag.                                                                               | `string`    | `null`  | no         |
| `tags`                     | A map of additional custom tags to apply to all Action Group resources.                                    | `map(string)` | `{}`    | no         |

*For the detailed structure of the `action_groups` variable, please refer to the `variables.tf` file within the module.*

## Outputs

| Name                           | Description                                                                          |
|--------------------------------|--------------------------------------------------------------------------------------|
| `action_group_ids`             | A map of the action group names to their respective resource IDs.                    |
| `action_group_names_map`       | A map of the action group keys (from input variable) to their created names.       |
| `action_group_short_names_map` | A map of the action group keys (from input variable) to their created short names. |
| `action_group_resources`       | A map of the full action group resources created, keyed by the input map keys.       |

## Examples

See the `examples/` directory provided with this module for a runnable example (`examples/main.tf`, `examples/deploy.tfvars`, etc.). The example demonstrates how to configure various receiver types and integrate with Key Vault.

## Contributing

Contributions to this module are welcome. Please follow these general guidelines:
- Open an issue to discuss any significant changes or new features.
- Ensure that your code adheres to the existing style and conventions.
- Include updates to documentation (this README, examples) with your changes.
- Test your changes thoroughly using provided examples or by adding new ones.
- Write clear and descriptive commit messages.

For more details, refer to the main repository's contribution guidelines if available.

## Support Model

This module is community-supported. For issues, questions, or feature requests, please use the GitHub issue tracker associated with this repository. There is no official Service Level Agreement (SLA), but the maintainers will make a best effort to address concerns. When reporting an issue, please provide:
- A clear description of the problem or request.
- Steps to reproduce the issue.
- Relevant Terraform configuration snippets.
- Any error messages encountered.
- Your Terraform version and relevant provider versions.

---
*This README is generated and maintained following Lumen standards.*
