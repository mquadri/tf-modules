<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6, < 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.6, <= 3.114.0 |
| <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) | ~> 0.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.1, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.6, <= 3.114.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_metric_alert.alerts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_metric_alerts"></a> [metric\_alerts](#input\_metric\_alerts) | n/a | <pre>map(object({<br>    name                     = string<br>    resource_group_name      = string<br>    scopes                   = list(string)<br>    description              = string<br>    enabled                  = optional(bool)<br>    auto_mitigate            = optional(bool)<br>    frequency                = optional(string)<br>    severity                 = optional(number)<br>    target_resource_type     = optional(string)<br>    target_resource_location = optional(string)<br>    window_size              = optional(string)<br>    actions_group_ids        = list(string)<br><br>    criteria = optional(map(object({<br>      metric_namespace = string<br>      metric_name      = string<br>      aggregation      = string<br>      operator         = string<br>      threshold        = string<br><br>      dimension = optional(map(object({<br>        name     = string<br>        operator = string<br>        values   = list(string)<br>      })))<br>    })))<br><br>    dynamic_criteria = optional(map(object({<br>      metric_namespace         = string<br>      metric_name              = string<br>      aggregation              = string<br>      operator                 = string<br>      alert_sensitivity        = string<br>      evaluation_total_count   = optional(number)<br>      evaluation_failure_count = optional(number)<br>      ignore_data_before       = optional(string)<br>      skip_metric_validation   = optional(bool)<br><br>      dimension = optional(map(object({<br>        name     = string<br>        operator = string<br>        values   = list(string)<br>      })))<br>    })))<br><br>    application_insights_web_test_location_availability_criteria = optional(list(object({<br>      web_test_id           = string<br>      component_id          = string<br>      failed_location_count = number<br>    })))<br><br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->