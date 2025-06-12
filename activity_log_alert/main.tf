locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

resource "azurerm_monitor_activity_log_alert" "activity_log_alert" {
  for_each = var.activity_log_alert

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  scopes              = each.value.scopes
  description         = lookup(each.value, "description", null)
  enabled             = lookup(each.value, "enabled", true)
  location            = each.value.location
  tags                = merge(local.mandatory_tags, lookup(each.value, "tags", {}))

  criteria {
    category = lookup(var.alert_criteria, lower(each.value.category), each.value.category)

    caller                  = lookup(each.value, "caller", null)
    operation_name          = lookup(each.value, "operation_name", null)
    resource_provider       = lookup(each.value, "resource_provider", null)
    resource_providers      = lookup(each.value, "resource_providers", [])
    resource_type           = lookup(each.value, "resource_type", null)
    resource_types          = lookup(each.value, "resource_types", [])
    resource_group          = lookup(each.value, "resource_group", null)
    resource_groups         = lookup(each.value, "resource_groups", [])
    resource_id             = lookup(each.value, "resource_id", null)
    resource_ids            = lookup(each.value, "resource_ids", [])
    level                   = lookup(each.value, "level", null)
    levels                  = lookup(each.value, "levels", [])
    status                  = lookup(each.value, "status", null)
    statuses                = lookup(each.value, "statuses", [])
    sub_status              = lookup(each.value, "sub_status", null)
    sub_statuses            = lookup(each.value, "sub_statuses", [])
    recommendation_type     = lookup(each.value, "recommendation_type", null)
    recommendation_category = lookup(each.value, "recommendation_category", null)
    recommendation_impact   = lookup(each.value, "recommendation_impact", null)

    dynamic "service_health" {
      for_each = lower(each.value.category) == "service_health" ? [1] : []
      content {
        events    = lookup(each.value, "events", [])
        locations = lookup(each.value, "locations", [])
        services  = lookup(each.value, "services", [])
      }
    }

    dynamic "resource_health" {
      for_each = lower(each.value.category) == "resource_health" ? [1] : []
      content {
        current  = lookup(each.value, "current", [])
        previous = lookup(each.value, "previous", [])
        reason   = lookup(each.value, "reason", [])
      }
    }
  }

  dynamic "action" {
    for_each = toset(each.value.action_group_ids)
    content {
      action_group_id    = action.value
      webhook_properties = lookup(each.value, "webhook_properties", {})
    }
  }
}