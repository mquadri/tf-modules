# -------------------- Variables --------------------

variable "network_connection_monitor_name" {
  description = "The name of the Network Connection Monitor."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Network Connection Monitor should exist."
  type        = string
}

variable "network_watcher_id" {
  description = "The ID of the Network Watcher."
  type        = string
}

variable "notes" {
  description = "The description of the Network Connection Monitor."
  type        = string
  default     = null
}

variable "output_workspace_resource_ids" {
  description = "A list of IDs of the Log Analytics Workspace which will accept the output from the Network Connection Monitor."
  type        = list(string)
  default     = []
}

variable "source_endpoint_name" {
  description = "The name of the source endpoint."
  type        = string
}


variable "source_endpoint_address" {
  description = "The address of the source endpoint."
  type        = string
}

variable "source_endpoint_coverage_level" {
  description = "The coverage level of the source endpoint."
  type        = string
}

variable "source_endpoint_excluded_ip_addresses" {
  description = "The excluded IP addresses for the source endpoint."
  type        = list(string)
  default     = []
}

variable "source_endpoint_included_ip_addresses" {
  description = "The included IP addresses for the source endpoint."
  type        = list(string)
  default     = []
}

variable "source_endpoint_target_resource_id" {
  description = "The target resource ID of the source endpoint."
  type        = string
  default     = null
}

variable "source_endpoint_target_resource_type" {
  description = "The target resource type of the source endpoint."
  type        = string
  default     = null
}

variable "destination_endpoint_name" {
  description = "The name of the destination endpoint."
  type        = string
}

variable "destination_endpoint_address" {
  description = "The address of the destination endpoint."
  type        = string
}

variable "destination_endpoint_coverage_level" {
  description = "The coverage level of the destination endpoint."
  type        = string
}

variable "destination_endpoint_excluded_ip_addresses" {
  description = "The excluded IP addresses for the destination endpoint."
  type        = list(string)
  default     = []
}

variable "destination_endpoint_included_ip_addresses" {
  description = "The included IP addresses for the destination endpoint."
  type        = list(string)
  default     = []
}

variable "destination_endpoint_target_resource_id" {
  description = "The target resource ID of the destination endpoint."
  type        = string
  default     = null
}

variable "destination_endpoint_target_resource_type" {
  description = "The target resource type of the destination endpoint."
  type        = string
  default     = null
}


variable "test_configurations" {
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

variable "test_groups" {
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


# tags

variable "tags" {
  description = "A mapping of tags to assign to the Network Connection Monitor."
  type        = map(string)
  default     = {}
}
variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}
variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}
