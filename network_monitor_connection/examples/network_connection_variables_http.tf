variable "network_connection_monitor_name_http" {
  description = "The name of the Network Connection Monitor."
  type        = string
}

variable "location_http" {
  description = "The Azure Region where the Network Connection Monitor should exist."
  type        = string
}

variable "network_watcher_id_http" {
  description = "The ID of the Network Watcher."
  type        = string
}

variable "notes_http" {
  description = "The description of the Network Connection Monitor."
  type        = string
  default     = null
}

variable "output_workspace_resource_ids_http" {
  description = "A list of IDs of the Log Analytics Workspace which will accept the output from the Network Connection Monitor."
  type        = list(string)
  default     = []
}


variable "source_endpoint_name_http" {
  description = "The name of the source endpoint."
  type        = string
}

variable "source_endpoint_address_http" {
  description = "The address of the source endpoint."
  type        = string
}

variable "source_endpoint_coverage_level_http" {
  description = "The coverage level of the source endpoint."
  type        = string
}

variable "source_endpoint_excluded_ip_addresses_http" {
  description = "The excluded IP addresses for the source endpoint."
  type        = list(string)
  default     = []
}

variable "source_endpoint_included_ip_addresses_http" {
  description = "The included IP addresses for the source endpoint."
  type        = list(string)
  default     = []
}

variable "source_endpoint_target_resource_id_http" {
  description = "The target resource ID of the source endpoint."
  type        = string
  default     = null
}

variable "source_endpoint_target_resource_type_http" {
  description = "The target resource type of the source endpoint."
  type        = string
  default     = null
}

variable "destination_endpoint_name_http" {
  description = "The name of the destination endpoint."
  type        = string
}

variable "destination_endpoint_address_http" {
  description = "The address of the destination endpoint."
  type        = string
}

variable "destination_endpoint_coverage_level_http" {
  description = "The coverage level of the destination endpoint."
  type        = string
}

variable "destination_endpoint_excluded_ip_addresses_http" {
  description = "The excluded IP addresses for the destination endpoint."
  type        = list(string)
  default     = []
}

variable "destination_endpoint_included_ip_addresses_http" {
  description = "The included IP addresses for the destination endpoint."
  type        = list(string)
  default     = []
}

variable "destination_endpoint_target_resource_id_http" {
  description = "The target resource ID of the destination endpoint."
  type        = string
  default     = null
}

variable "destination_endpoint_target_resource_type_http" {
  description = "The target resource type of the destination endpoint."
  type        = string
  default     = null
}

variable "test_configurations_http" {
  description = "A map of test configuration details"
  type = map(object({
    name                                        = string
    protocol                                    = string
    test_frequency_in_seconds                   = number
    preferred_ip_version                        = string
    success_threshold_checks_failed_percent     = number
    success_threshold_round_trip_time_ms        = number
    http_configuration_method                   = string
    http_configuration_path                     = string
    http_configuration_port                     = number
    http_configuration_valid_status_code_ranges = list(string)
    http_configuration_prefer_https             = bool
    http_configuration_request_header           = map(string)
    icmp_configuration_trace_route_enabled      = bool
    tcp_configuration_port                      = number
    tcp_configuration_trace_route_enabled       = bool
    tcp_configuration_destination_port_behavior = string
  }))
  default = {}
}


variable "test_groups_http" {
  description = "A map of test group configurations"
  type = map(object({
    name                     = string
    destination_endpoints    = list(string)
    source_endpoints         = list(string)
    test_configuration_names = list(string)
    enabled                  = bool
  }))
  default = {}
}