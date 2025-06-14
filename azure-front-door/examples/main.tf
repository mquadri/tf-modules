module "cdn_frontdoor" {
  source = "../"
  cdn_profile_name                    = var.cdn_profile_name
  resource_group_name                 = var.resource_group_name
  sku_name                            = var.sku_name
  response_timeout_seconds            = var.response_timeout_seconds
  tags                                = var.tags
  identity_type                       = var.identity_type
  identity_ids                        = var.identity_ids
  custom_domain_name                  = var.custom_domain_name
  dns_zone_id                         = var.dns_zone_id
  host_name                           = var.host_name
  certificate_type                    = var.certificate_type
  minimum_tls_version                 = var.minimum_tls_version
  cdn_frontdoor_secret_id             = var.cdn_frontdoor_secret_id
  origin_group_name                   = var.origin_group_name
  session_affinity_enabled            = var.session_affinity_enabled
  restore_traffic_time                = var.restore_traffic_time
  health_probe_interval               = var.health_probe_interval
  health_probe_path                   = var.health_probe_path
  health_probe_protocol               = var.health_probe_protocol
  health_probe_request_type           = var.health_probe_request_type
  additional_latency                  = var.additional_latency
  sample_size                         = var.sample_size
  successful_samples_required         = var.successful_samples_required
  origin_name                         = var.origin_name
  origin_enabled                      = var.origin_enabled
  certificate_name_check_enabled      = var.certificate_name_check_enabled
  http_port                           = var.http_port
  https_port                          = var.https_port
  origin_host_header                  = var.origin_host_header
  priority                            = var.priority
  weight                              = var.weight
  private_link                        = var.private_link
  rule_set_name                       = var.rule_set_name
  rule_name                           = var.rule_name
  order                               = var.order
  behavior_on_match                   = var.behavior_on_match
  forwarding_protocol                 = var.forwarding_protocol
  query_string_caching_behavior       = var.query_string_caching_behavior
  query_string_parameters             = var.query_string_parameters
  compression_enabled                 = var.compression_enabled
  cache_behavior                      = var.cache_behavior
  cache_duration                      = var.cache_duration
  request_header_action_header_action = var.request_header_action_header_action
  request_header_action_header_name   = var.request_header_action_header_name
  request_header_action_value         = var.request_header_action_value
  url_redirect_action                 = var.url_redirect_action
  url_rewrite_action                  = var.url_rewrite_action
  conditions                          = var.conditions
}
