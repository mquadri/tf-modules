resource "azurerm_cdn_frontdoor_profile" "cdn" {
  name                     = var.cdn_profile_name
  resource_group_name      = var.resource_group_name
  sku_name                 = var.sku_name
  response_timeout_seconds = var.response_timeout_seconds

  tags = var.tags

  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }
}

resource "azurerm_cdn_frontdoor_custom_domain" "cdn_custom_domain" {
  name                     = var.custom_domain_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.cdn.id
  dns_zone_id              = var.dns_zone_id
  host_name                = var.host_name

  tls {
    certificate_type        = var.certificate_type
    minimum_tls_version     = var.minimum_tls_version
    cdn_frontdoor_secret_id = var.cdn_frontdoor_secret_id
  }
}

resource "azurerm_cdn_frontdoor_origin_group" "cdn_origin_group" {
  name                                                      = var.origin_group_name
  cdn_frontdoor_profile_id                                  = azurerm_cdn_frontdoor_profile.cdn.id
  session_affinity_enabled                                  = var.session_affinity_enabled
  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = var.restore_traffic_time

  health_probe {
    interval_in_seconds = var.health_probe_interval
    path                = var.health_probe_path
    protocol            = var.health_probe_protocol
    request_type        = var.health_probe_request_type
  }

  load_balancing {
    additional_latency_in_milliseconds = var.additional_latency
    sample_size                        = var.sample_size
    successful_samples_required        = var.successful_samples_required
  }
}

resource "azurerm_cdn_frontdoor_origin" "cdn_origin" {
  name                           = var.origin_name
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.cdn_origin_group.id
  enabled                        = var.origin_enabled
  certificate_name_check_enabled = var.certificate_name_check_enabled
  host_name                      = var.host_name
  http_port                      = var.http_port
  https_port                     = var.https_port
  origin_host_header             = var.origin_host_header
  priority                       = var.priority
  weight                         = var.weight

  dynamic "private_link" {
    for_each = var.private_link != null ? [var.private_link] : []
    content {
      request_message        = private_link.value.request_message
      target_type            = private_link.value.target_type
      location               = private_link.value.location
      private_link_target_id = private_link.value.private_link_target_id
    }
  }
}

resource "azurerm_cdn_frontdoor_rule_set" "cdn_rule_set" {
  name                     = var.rule_set_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.cdn.id
}

resource "azurerm_cdn_frontdoor_rule" "cdn_rule" {
  depends_on = [azurerm_cdn_frontdoor_origin_group.cdn_origin_group, azurerm_cdn_frontdoor_origin.cdn_origin]

  name                      = var.rule_name
  cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.cdn_rule_set.id
  order                     = var.order
  behavior_on_match         = var.behavior_on_match

  actions {
    route_configuration_override_action {
      cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.cdn_origin_group.id
      forwarding_protocol           = var.forwarding_protocol
      query_string_caching_behavior = var.query_string_caching_behavior
      query_string_parameters       = var.query_string_parameters
      compression_enabled           = var.compression_enabled
      cache_behavior                = var.cache_behavior
      cache_duration                = var.cache_duration
    }

    dynamic "url_redirect_action" {
      for_each = var.url_redirect_action != null ? [var.url_redirect_action] : []
      content {
        redirect_type        = url_redirect_action.value.redirect_type
        redirect_protocol    = url_redirect_action.value.redirect_protocol
        query_string         = url_redirect_action.value.query_string
        destination_path     = url_redirect_action.value.destination_path
        destination_hostname = url_redirect_action.value.destination_hostname
        destination_fragment = url_redirect_action.value.destination_fragment
      }
    }

    dynamic "url_rewrite_action" {
      for_each = var.url_rewrite_action != null ? [var.url_rewrite_action] : []
      content {
        source_pattern          = url_rewrite_action.value.source_pattern
        destination             = url_rewrite_action.value.destination
        preserve_unmatched_path = url_rewrite_action.value.preserve_unmatched_path
      }
    }

    request_header_action {
      header_action = var.request_header_action_header_action
      header_name   = var.request_header_action_header_name
      value         = var.request_header_action_value
    }
  }

  dynamic "conditions" {
    for_each = var.conditions != null ? [var.conditions] : []
    content {
      dynamic "host_name_condition" {
        for_each = conditions.value.host_name_condition != null ? conditions.value.host_name_condition : []
        content {
          operator         = host_name_condition.value.operator
          negate_condition = host_name_condition.value.negate_condition
          match_values     = host_name_condition.value.match_values
          transforms       = host_name_condition.value.transforms
        }
      }

      dynamic "is_device_condition" {
        for_each = conditions.value.is_device_condition != null ? conditions.value.is_device_condition : []
        content {
          operator         = is_device_condition.value.operator
          negate_condition = is_device_condition.value.negate_condition
          match_values     = is_device_condition.value.match_values
        }
      }

      dynamic "request_method_condition" {
        for_each = conditions.value.request_method_condition != null ? conditions.value.request_method_condition : []
        content {
          operator         = request_method_condition.value.operator
          negate_condition = request_method_condition.value.negate_condition
          match_values     = request_method_condition.value.match_values
        }
      }

      dynamic "url_filename_condition" {
        for_each = conditions.value.url_filename_condition != null ? conditions.value.url_filename_condition : []
        content {
          operator         = url_filename_condition.value.operator
          negate_condition = url_filename_condition.value.negate_condition
          match_values     = url_filename_condition.value.match_values
          transforms       = url_filename_condition.value.transforms
        }
      }

      dynamic "ssl_protocol_condition" {
        for_each = conditions.value.ssl_protocol_condition != null ? conditions.value.ssl_protocol_condition : []
        content {
          operator         = ssl_protocol_condition.value.operator
          match_values     = ssl_protocol_condition.value.match_values
          negate_condition = ssl_protocol_condition.value.negate_condition
        }
      }

      dynamic "server_port_condition" {
        for_each = conditions.value.server_port_condition != null ? conditions.value.server_port_condition : []
        content {
          operator         = server_port_condition.value.operator
          match_values     = server_port_condition.value.match_values
          negate_condition = server_port_condition.value.negate_condition
        }
      }

      dynamic "client_port_condition" {
        for_each = conditions.value.client_port_condition != null ? conditions.value.client_port_condition : []
        content {
          operator         = client_port_condition.value.operator
          match_values     = client_port_condition.value.match_values
          negate_condition = client_port_condition.value.negate_condition
        }
      }

      dynamic "socket_address_condition" {
        for_each = conditions.value.socket_address_condition != null ? conditions.value.socket_address_condition : []
        content {
          operator         = socket_address_condition.value.operator
          match_values     = socket_address_condition.value.match_values
          negate_condition = socket_address_condition.value.negate_condition
        }
      }

      dynamic "remote_address_condition" {
        for_each = conditions.value.remote_address_condition != null ? conditions.value.remote_address_condition : []
        content {
          operator         = remote_address_condition.value.operator
          match_values     = remote_address_condition.value.match_values
          negate_condition = remote_address_condition.value.negate_condition
        }
      }

      dynamic "query_string_condition" {
        for_each = conditions.value.query_string_condition != null ? conditions.value.query_string_condition : []
        content {
          operator         = query_string_condition.value.operator
          match_values     = query_string_condition.value.match_values
          negate_condition = query_string_condition.value.negate_condition
          transforms       = query_string_condition.value.transforms
        }
      }

      dynamic "post_args_condition" {
        for_each = conditions.value.post_args_condition != null ? conditions.value.post_args_condition : []
        content {
          post_args_name   = post_args_condition.value.post_args_name
          operator         = post_args_condition.value.operator
          match_values     = post_args_condition.value.match_values
          transforms       = post_args_condition.value.transforms
          negate_condition = post_args_condition.value.negate_condition
        }
      }

      dynamic "request_header_condition" {
        for_each = conditions.value.request_header_condition != null ? conditions.value.request_header_condition : []
        content {
          header_name      = request_header_condition.value.header_name
          operator         = request_header_condition.value.operator
          match_values     = request_header_condition.value.match_values
          transforms       = request_header_condition.value.transforms
          negate_condition = request_header_condition.value.negate_condition
        }
      }

      dynamic "request_uri_condition" {
        for_each = conditions.value.request_uri_condition != null ? conditions.value.request_uri_condition : []
        content {
          operator         = request_uri_condition.value.operator
          match_values     = request_uri_condition.value.match_values
          transforms       = request_uri_condition.value.transforms
          negate_condition = request_uri_condition.value.negate_condition
        }
      }

      dynamic "request_scheme_condition" {
        for_each = conditions.value.request_scheme_condition != null ? conditions.value.request_scheme_condition : []
        content {
          operator         = request_scheme_condition.value.operator
          match_values     = request_scheme_condition.value.match_values
          negate_condition = request_scheme_condition.value.negate_condition
        }
      }

      dynamic "request_body_condition" {
        for_each = conditions.value.request_body_condition != null ? conditions.value.request_body_condition : []
        content {
          operator         = request_body_condition.value.operator
          match_values     = request_body_condition.value.match_values
          negate_condition = request_body_condition.value.negate_condition
          transforms       = request_body_condition.value.transforms
        }
      }

      dynamic "cookies_condition" {
        for_each = conditions.value.cookies_condition != null ? conditions.value.cookies_condition : []
        content {
          cookie_name      = cookies_condition.value.cookie_name
          operator         = cookies_condition.value.operator
          match_values     = cookies_condition.value.match_values
          transforms       = cookies_condition.value.transforms
          negate_condition = cookies_condition.value.negate_condition
        }
      }

      dynamic "http_version_condition" {
        for_each = conditions.value.http_version_condition != null ? conditions.value.http_version_condition : []
        content {
          match_values     = http_version_condition.value.match_values
          operator         = http_version_condition.value.operator
          negate_condition = http_version_condition.value.negate_condition
        }
      }

      dynamic "url_file_extension_condition" {
        for_each = conditions.value.url_file_extension_condition != null ? conditions.value.url_file_extension_condition : []
        content {
          operator         = url_file_extension_condition.value.operator
          match_values     = url_file_extension_condition.value.match_values
          transforms       = url_file_extension_condition.value.transforms
          negate_condition = url_file_extension_condition.value.negate_condition
        }
      }

      dynamic "url_path_condition" {
        for_each = conditions.value.url_path_condition != null ? conditions.value.url_path_condition : []
        content {
          operator         = url_path_condition.value.operator
          match_values     = url_path_condition.value.match_values
          transforms       = url_path_condition.value.transforms
          negate_condition = url_path_condition.value.negate_condition
        }
      }
    }
  }

}
