cdn_profile_name                    = "my-cdn-profile"
resource_group_name                 = "new"
sku_name                            = "Standard_AzureFrontDoor"
response_timeout_seconds            = 60
tags                                = { environment = "production" }
identity_type                       = "SystemAssigned"
identity_ids                        = []
custom_domain_name                  = "my-custom-domain"
dns_zone_id                         = null
host_name                           = "myhost.mydnszone.com"
certificate_type                    = "ManagedCertificate"
minimum_tls_version                 = "TLS12"
cdn_frontdoor_secret_id             = null
origin_group_name                   = "my-origin-group"
session_affinity_enabled            = true
restore_traffic_time                = 5
health_probe_interval               = 30
health_probe_path                   = "/health"
health_probe_protocol               = "Https"
health_probe_request_type           = "GET"
additional_latency                  = 50
sample_size                         = 4
successful_samples_required         = 3
origin_name                         = "my-origin"
origin_enabled                      = true
certificate_name_check_enabled      = true
http_port                           = 80
https_port                          = 443
origin_host_header                  = "myhost.mydnszone.com"
priority                            = 1
weight                              = 50
rule_set_name                       = "myruleset"
rule_name                           = "myrule"
order                               = 1
forwarding_protocol                 = "HttpsOnly"
query_string_caching_behavior       = "IgnoreQueryString"
compression_enabled                 = true
cache_behavior                      = "OverrideAlways"
cache_duration                      = "01:00:00"
request_header_action_header_action = "Append"
request_header_action_header_name   = "X-Custom-Header"
request_header_action_value         = "CustomValue"
conditions = {
  host_name_condition = [{
    operator         = "Equal"
    negate_condition = false
    match_values     = ["myhost.mydnszone.com"]
    transforms       = []
  }]
  query_string_condition = [{
    operator         = "Equal"
    match_values     = ["param=value"]
    negate_condition = false
    transforms       = []
  }]
  post_args_condition = [{
    post_args_name   = "param"
    operator         = "Equal"
    match_values     = ["value"]
    transforms       = []
    negate_condition = false
  }]
  cookies_condition = [{
    cookie_name      = "session"
    operator         = "Equal"
    match_values     = ["value"]
    transforms       = []
    negate_condition = false
  }]
  http_version_condition = [{
    match_values     = ["2.0"]
    operator         = "Equal"
    negate_condition = false
  }]
  url_file_extension_condition = [{
    operator         = "Equal"
    match_values     = ["html"]
    transforms       = []
    negate_condition = false
  }]
  url_path_condition = [{
    operator         = "Equal"
    match_values     = ["/path"]
    transforms       = []
    negate_condition = false
  }]
}
