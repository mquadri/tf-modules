resource "azurerm_network_connection_monitor" "this" {
  name                          = var.network_connection_monitor_name
  location                      = var.location
  network_watcher_id            = var.network_watcher_id
  notes                         = var.notes
  output_workspace_resource_ids = var.output_workspace_resource_ids
  tags                          = local.tags


  endpoint {
    name                  = var.source_endpoint_name
    address               = var.source_endpoint_address
    coverage_level        = var.source_endpoint_coverage_level
    excluded_ip_addresses = var.source_endpoint_excluded_ip_addresses
    included_ip_addresses = var.source_endpoint_included_ip_addresses
    target_resource_id    = var.source_endpoint_target_resource_id
    target_resource_type  = var.source_endpoint_target_resource_type
  }

  endpoint {
    name                  = var.destination_endpoint_name
    address               = var.destination_endpoint_address
    coverage_level        = var.destination_endpoint_coverage_level
    excluded_ip_addresses = var.destination_endpoint_excluded_ip_addresses
    included_ip_addresses = var.destination_endpoint_included_ip_addresses
    target_resource_id    = var.destination_endpoint_target_resource_id
    target_resource_type  = var.destination_endpoint_target_resource_type
  }

  dynamic "test_configuration" {
    for_each = var.test_configurations
    content {
      name                      = test_configuration.value.name
      protocol                  = test_configuration.value.protocol
      test_frequency_in_seconds = test_configuration.value.test_frequency_in_seconds
      preferred_ip_version      = test_configuration.value.preferred_ip_version
      success_threshold {
        checks_failed_percent = test_configuration.value.success_threshold_checks_failed_percent
        round_trip_time_ms    = test_configuration.value.success_threshold_round_trip_time_ms
      }

      dynamic "http_configuration" {
        for_each = test_configuration.value.protocol == "Http" ? [1] : []
        content {
          method                   = test_configuration.value.http_configuration_method
          path                     = test_configuration.value.http_configuration_path
          port                     = test_configuration.value.http_configuration_port
          valid_status_code_ranges = test_configuration.value.http_configuration_valid_status_code_ranges
          prefer_https             = test_configuration.value.http_configuration_prefer_https

          dynamic "request_header" {
            for_each = length(test_configuration.value.http_configuration_request_header) > 0 ? [test_configuration.value.http_configuration_request_header] : []
            content {
              name  = request_header.value["name"]
              value = request_header.value["value"]
            }
          }
        }
      }

      dynamic "icmp_configuration" {
        for_each = test_configuration.value.protocol == "Icmp" ? [1] : []
        content {
          trace_route_enabled = test_configuration.value.icmp_configuration_trace_route_enabled
        }
      }

      dynamic "tcp_configuration" {
        for_each = test_configuration.value.protocol == "Tcp" ? [1] : []
        content {
          port                      = test_configuration.value.tcp_configuration_port
          trace_route_enabled       = test_configuration.value.tcp_configuration_trace_route_enabled
          destination_port_behavior = test_configuration.value.tcp_configuration_destination_port_behavior
        }
      }
    }
  }

  dynamic "test_group" {
    for_each = var.test_groups
    content {
      name                     = test_group.value.name
      destination_endpoints    = test_group.value.destination_endpoints
      source_endpoints         = test_group.value.source_endpoints
      test_configuration_names = test_group.value.test_configuration_names
      enabled                  = test_group.value.enabled
    }
  }

}