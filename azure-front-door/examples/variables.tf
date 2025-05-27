variable "cdn_profile_name" {
  description = "The name of the CDN Front Door Profile"
  type        = string
  default     = "example-cdn-profile"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "sku_name" {
  description = "The SKU of the CDN Front Door Profile"
  type        = string
  default     = "Standard_AzureFrontDoor"
}

variable "response_timeout_seconds" {
  description = "The response timeout in seconds"
  type        = number
}

variable "tags" {
  description = "The tag values"
  type        = map(string)
  default     = {}
}

variable "identity_type" {
  description = "The type of identity"
  type        = string
}

variable "identity_ids" {
  description = "The identity IDs"
  type        = list(string)
  default     = []
}

variable "custom_domain_name" {
  description = "The name of the custom domain"
  type        = string
}

variable "dns_zone_id" {
  description = "The ID of the DNS zone"
  type        = string
  default     = null
}

variable "host_name" {
  description = "The host name for the custom domain"
  type        = string
  default     = null
}

variable "certificate_type" {
  description = "The type of certificate to use"
  type        = string
  default     = "ManagedCertificate"
}

variable "minimum_tls_version" {
  description = "The minimum TLS version to support"
  type        = string
  default     = "TLS12"
}

variable "cdn_frontdoor_secret_id" {
  description = "Resource ID of the Front Door Secret"
  type        = string
  default     = null
}

variable "origin_group_name" {
  description = "The name of the origin group"
  type        = string
}

variable "session_affinity_enabled" {
  description = "Whether session affinity is enabled"
  type        = bool
  default     = true
}

variable "restore_traffic_time" {
  description = "The time to restore traffic to a healed or new endpoint in minutes"
  type        = number
  default     = 10
}

variable "health_probe_interval" {
  description = "The interval for health probes in seconds"
  type        = number
  default     = 240
}

variable "health_probe_path" {
  description = "The path for health probes"
  type        = string
  default     = "/"
}

variable "health_probe_protocol" {
  description = "The protocol for health probes"
  type        = string
  default     = "Https"
}

variable "health_probe_request_type" {
  description = "The request type for health probes"
  type        = string
  default     = "HEAD"
}

variable "additional_latency" {
  description = "The additional latency for load balancing in milliseconds"
  type        = number
  default     = 50
}

variable "sample_size" {
  description = "The sample size for load balancing"
  type        = number
  default     = 4
}

variable "successful_samples_required" {
  description = "The number of successful samples required for load balancing"
  type        = number
  default     = 3
}

variable "origin_name" {
  description = "The name of the origin"
  type        = string
}

variable "origin_enabled" {
  description = "Whether the origin is enabled"
  type        = bool
  default     = true
}

variable "certificate_name_check_enabled" {
  description = "Whether the certificate name check is enabled"
  type        = bool
  default     = false
}

variable "http_port" {
  description = "The HTTP port for the origin"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "The HTTPS port for the origin"
  type        = number
  default     = 443
}

variable "origin_host_header" {
  description = "The origin host header"
  type        = string
  default     = null
}

variable "priority" {
  description = "The priority of the origin"
  type        = number
  default     = 1
}

variable "weight" {
  description = "The weight of the origin"
  type        = number
  default     = 500
}

variable "private_link" {
  description = "The private link configuration"
  type = object({
    request_message        = optional(string)
    target_type            = optional(string)
    location               = optional(string)
    private_link_target_id = optional(string)
  })
  default = null
}

variable "rule_set_name" {
  description = "The name which should be used for this Front Door Rule Set."
  type        = string
}

variable "rule_name" {
  description = "The name of the CDN Front Door rule."
  type        = string
}

variable "order" {
  description = "The order in which the rule is applied."
  type        = number
}

variable "behavior_on_match" {
  description = "The behavior when the rule matches a request."
  type        = string
  default     = "Continue"
}

# Route Configuration Override Action Variables
variable "forwarding_protocol" {
  description = "The protocol to use when forwarding the request (e.g., HTTP or HTTPS)."
  type        = string
  default     = null
}

variable "query_string_caching_behavior" {
  description = "Defines how query strings are handled for caching purposes."
  type        = string
  default     = null
}

variable "query_string_parameters" {
  description = "Specifies the query string parameters to include or exclude."
  type        = list(string)
  default     = []
}

variable "compression_enabled" {
  description = "Indicates whether compression is enabled for the response."
  type        = bool
  default     = null
}

variable "cache_behavior" {
  description = "Defines the caching behavior for the request."
  type        = string
  default     = null
}

variable "cache_duration" {
  description = "Specifies the duration for which the response should be cached."
  type        = string
  default     = null
}

# Conditions Variables
variable "request_header_action_header_action" {
  description = "The header action for the request header action"
  type        = string
}

variable "request_header_action_header_name" {
  description = "The header name for the request header action"
  type        = string
}

variable "request_header_action_value" {
  description = "The value for the request header action"
  type        = string
  default     = null
}

variable "url_redirect_action" {
  description = "The URL redirect action configuration"
  type = object({
    redirect_type        = optional(string)
    redirect_protocol    = optional(string)
    query_string         = optional(string)
    destination_path     = optional(string)
    destination_hostname = optional(string)
    destination_fragment = optional(string)
  })
  default = null
}

variable "url_rewrite_action" {
  description = "The URL rewrite action configuration"
  type = object({
    source_pattern          = optional(string)
    destination             = optional(string)
    preserve_unmatched_path = optional(bool)
  })
  default = null
}

variable "conditions" {
  description = "The conditions for the rule."
  type = object({
    host_name_condition = optional(list(object({
      operator         = string
      negate_condition = bool
      match_values     = list(string)
      transforms       = list(string)
    })))
    is_device_condition = optional(list(object({
      operator         = string
      negate_condition = bool
      match_values     = list(string)
    })))
    request_method_condition = optional(list(object({
      operator         = string
      negate_condition = bool
      match_values     = list(string)
    })))
    url_filename_condition = optional(list(object({
      operator         = string
      negate_condition = bool
      match_values     = list(string)
      transforms       = list(string)
    })))
    ssl_protocol_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      negate_condition = bool
    })))
    server_port_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      negate_condition = bool
    })))
    client_port_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      negate_condition = bool
    })))
    socket_address_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      negate_condition = bool
    })))
    remote_address_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      negate_condition = bool
    })))
    query_string_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      negate_condition = bool
      transforms       = list(string)
    })))
    post_args_condition = optional(list(object({
      post_args_name   = string
      operator         = string
      match_values     = list(string)
      transforms       = list(string)
      negate_condition = bool
    })))
    request_header_condition = optional(list(object({
      header_name      = string
      operator         = string
      match_values     = list(string)
      transforms       = list(string)
      negate_condition = bool
    })))
    request_uri_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      transforms       = list(string)
      negate_condition = bool
    })))
    request_scheme_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      negate_condition = bool
    })))
    request_body_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      negate_condition = bool
      transforms       = list(string)
    })))
    cookies_condition = optional(list(object({
      cookie_name      = string
      operator         = string
      match_values     = list(string)
      transforms       = list(string)
      negate_condition = bool
    })))
    http_version_condition = optional(list(object({
      match_values     = list(string)
      operator         = string
      negate_condition = bool
    })))
    url_file_extension_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      transforms       = list(string)
      negate_condition = bool
    })))
    url_path_condition = optional(list(object({
      operator         = string
      match_values     = list(string)
      transforms       = list(string)
      negate_condition = bool
    })))
  })
  default = null
}
