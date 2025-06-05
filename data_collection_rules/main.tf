data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

resource "azurerm_monitor_data_collection_endpoint" "this" {
  for_each                      = var.datacollection_endpoint
  name                          = each.value.monitor_data_collection_endpoint_name
  resource_group_name           = data.azurerm_resource_group.this.name
  location                      = data.azurerm_resource_group.this.location
  kind                          = each.value.monitor_data_collection_endpoint_kind
  public_network_access_enabled = false
  description                   = each.value.monitor_data_collection_endpoint_description
  tags                          = merge(local.mandatory_tags, try(var.tags, {}))
}

resource "azurerm_monitor_data_collection_rule" "dcr" {
  for_each                    = var.monitor_data_collection_rule
  name                        = each.value.rule_name
  resource_group_name         = each.value.dcr_rg_name
  description                 = each.value.description
  kind                        = each.value.kind
  location                    = data.azurerm_resource_group.this.location
  data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.this[each.value.data_collection_endpoint_name].id

  destinations {
    dynamic "log_analytics" {
      for_each = var.monitor_data_collection_rule
      content {
        workspace_resource_id = each.value.log_analytics_id
        name                  = each.value.log_analytics_name
      }
    }

  }

  dynamic "data_flow" {
    for_each = var.monitor_data_collection_rule[each.key].kind == "Windows" ? [var.monitor_data_collection_rule] : []
    content {
      streams       = each.value.streams
      destinations  = each.value.destinations
      transform_kql = each.value.transform_kql
    }
  }

  dynamic "data_flow" {
    for_each = var.monitor_data_collection_rule[each.key].kind == "Linux" ? [var.monitor_data_collection_rule] : []
    content {
      streams      = each.value.streams
      destinations = each.value.destinations
    }
  }


  data_sources {
    dynamic "syslog" {
      for_each = var.monitor_data_collection_rule[each.key].kind == "Linux" && var.data_sources.syslog != null ? var.data_sources.syslog : []
      content {
        facility_names = syslog.value.facility_names
        log_levels     = syslog.value.log_levels
        name           = syslog.value.name
        streams        = syslog.value.streams
      }
    }

    dynamic "performance_counter" {
      for_each = var.data_sources.performance_counter != null ? var.data_sources.performance_counter : []
      content {
        streams                       = performance_counter.value.streams
        sampling_frequency_in_seconds = performance_counter.value.sampling_frequency_in_seconds
        counter_specifiers            = performance_counter.value.counter_specifiers
        name                          = performance_counter.value.name
      }
    }

    dynamic "windows_event_log" {
      for_each = var.monitor_data_collection_rule[each.key].kind == "Windows" && var.data_sources.windows_event_log != null ? var.data_sources.windows_event_log : []
      content {
        streams        = windows_event_log.value.streams
        x_path_queries = windows_event_log.value.x_path_queries
        name           = windows_event_log.value.name
      }
    }

    dynamic "extension" {
      for_each = var.data_sources.extension != null ? var.data_sources.extension : []
      content {
        streams        = extension.value.streams
        extension_name = extension.value.extension_name
        name           = extension.value.name
      }
    }

    dynamic "iis_log" {
      for_each = var.monitor_data_collection_rule[each.key].kind == "Windows" && var.data_sources.iis_log != null ? var.data_sources.iis_log : []
      content {
        streams         = iis_log.value.streams
        name            = iis_log.value.name
        log_directories = iis_log.value.log_directories
      }
    }

    dynamic "log_file" {
      for_each = var.data_sources.log_file != null ? var.data_sources.log_file : []
      content {
        format        = log_file.value.format
        file_patterns = log_file.value.file_patterns
        name          = log_file.value.name
        streams       = log_file.value.streams
        settings {
          text {
            record_start_timestamp_format = log_file.value.settings.text.record_start_timestamp_format
          }
        }
      }
    }
  }
  tags = merge(local.mandatory_tags, try(var.tags, {}))
}

resource "azurerm_monitor_data_collection_rule_association" "dcrassoc1" {
  for_each                = var.dcr_association
  name                    = each.value.name
  target_resource_id      = each.value.target_resource_id
  data_collection_rule_id = each.value.data_collection_rule_id
  description             = "Data Collection Rule Association"
}