#--------------------------------------------------------------
# Creating necessary metric alert(s) 
#--------------------------------------------------------------
locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

resource "azurerm_monitor_metric_alert" "alerts" {
  for_each = var.metric_alerts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  scopes                   = each.value.scopes
  description              = lookup(each.value, "description", null)
  enabled                  = lookup(each.value, "enabled", true)
  auto_mitigate            = lookup(each.value, "auto_mitigate", true)
  frequency                = lookup(each.value, "frequency", "PT1M")
  severity                 = lookup(each.value, "severity", 3)
  target_resource_type     = lookup(each.value, "target_resource_type", null)
  target_resource_location = lookup(each.value, "target_resource_location", null)
  window_size              = lookup(each.value, "window_size", "PT5M")
  tags                     = local.mandatory_tags

  dynamic "criteria" {
    for_each = each.value.criteria != null ? each.value.criteria : {}

    content {
      metric_namespace       = criteria.value.metric_namespace
      metric_name            = criteria.value.metric_name
      aggregation            = criteria.value.aggregation
      operator               = criteria.value.operator
      threshold              = criteria.value.threshold
      skip_metric_validation = lookup(criteria.value, "skip_metric_validation", false)

      dynamic "dimension" {
        for_each = criteria.value.dimension != null ? criteria.value.dimension : {}

        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
    }
  }

  dynamic "dynamic_criteria" {
    for_each = each.value.dynamic_criteria != null ? each.value.dynamic_criteria : {}

    content {
      metric_namespace         = dynamic_criteria.value.metric_namespace
      metric_name              = dynamic_criteria.value.metric_name
      aggregation              = dynamic_criteria.value.aggregation
      operator                 = dynamic_criteria.value.operator
      alert_sensitivity        = dynamic_criteria.value.alert_sensitivity
      evaluation_total_count   = lookup(dynamic_criteria.value, "evaluation_total_count", null)
      evaluation_failure_count = lookup(dynamic_criteria.value, "evaluation_failure_count", null)
      ignore_data_before       = lookup(dynamic_criteria.value, "ignore_data_before", null)
      skip_metric_validation   = lookup(dynamic_criteria.value, "skip_metric_validation", false)


      dynamic "dimension" {
        for_each = dynamic_criteria.value.dimension != null ? dynamic_criteria.value.dimension : {}

        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
    }
  }

  dynamic "application_insights_web_test_location_availability_criteria" {
    for_each = each.value.application_insights_web_test_location_availability_criteria != null ? each.value.application_insights_web_test_location_availability_criteria : []

    content {
      web_test_id           = application_insights_web_test_location_availability_criteria.value.web_test_id
      component_id          = application_insights_web_test_location_availability_criteria.value.web_test_id
      failed_location_count = application_insights_web_test_location_availability_criteria.value.failed_location_count
    }
  }

  dynamic "action" {
    for_each = toset(each.value.actions_group_ids)
    content {
      action_group_id = action.value
    }
  }
}
