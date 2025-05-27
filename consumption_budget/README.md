# Azure Consumption Budget Alert Module

This Terraform module creates a Consumption Budget for an Azure subscription and configures alerts using an Azure Action Group. The budget is monitored for specific thresholds, and when those thresholds are exceeded, the specified action group receives notifications.

## Overview

This module achieves the following:

- **Fetching Action Group**: Uses the specified action group for sending alerts when the budget is exceeded.
- **Creating Consumption Budget**: Sets up a consumption budget with monthly limits and defined thresholds for notifications.
- **Notifications**: Configures notifications to be triggered at specified budget thresholds (e.g., 80% and 100% of the budget).

## Prerequisites

- **Terraform 1.5+**
- **Azure Subscription**: An active Azure subscription where you want to create the budget alert.
- **Existing Action Group**: The action group used for notifications should already exist in your Azure environment.

## Resources Managed

- **Azure Monitor Action Group**: Fetches an existing action group to be used for budget alert notifications.
- **Azure Consumption Budget**: Creates a budget for a specified Azure subscription and configures notification triggers based on the budget thresholds.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.63 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~>1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_subscription.consumption_budget](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription) | resource |
| [azurerm_monitor_action_group.group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_action_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_groups_name"></a> [action\_groups\_name](#input\_action\_groups\_name) | The Action Group name to use for monitoring | `string` | n/a | yes |
| <a name="input_action_groups_resource_group"></a> [action\_groups\_resource\_group](#input\_action\_groups\_resource\_group) | The Action Group resouse group to use for monitoring | `string` | n/a | yes |
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | Monthly budget amount in USD | `number` | n/a | yes |
| <a name="input_budget_name"></a> [budget\_name](#input\_budget\_name) | Name of the budget alert | `string` | n/a | yes |
| <a name="input_budget_notifications"></a> [budget\_notifications](#input\_budget\_notifications) | List of budget notifications | <pre>list(object({<br/>    operator      = string<br/>    threshold     = number<br/>    contact_emails = list(string)<br/><br/>  }))</pre> | n/a | yes |
| <a name="input_start_date"></a> [start\_date](#input\_start\_date) | Start date for the budget | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription ID for the budget alert | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_consumption_budget_id"></a> [consumption\_budget\_id](#output\_consumption\_budget\_id) | The ID of the created consumption budget |
| <a name="output_consumption_budget_name"></a> [consumption\_budget\_name](#output\_consumption\_budget\_name) | The name of the created consumption budget |
