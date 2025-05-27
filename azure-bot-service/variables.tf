#TAGS VARIABLES#
variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
}

variable "appFunction" {
  description = "app function"
  type        = string
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costDivision" {
  description = "cost division"
  type        = string
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = "ais"
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
}

#MODULE VARIABLES#

variable "name" {
  description = "The name of the Azure Bot Service."
  type        = string
  default     = null
}

variable "location" {
  description = "The location where the Azure Bot Service will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Bot Service."
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Bot Service."
  type        = string
}

variable "microsoft_app_id" {
  description = "The Microsoft App ID for the Azure Bot Service."
  type        = string
}


############################################private endpoint############################
variable "private_endpoints" {
  type = map(object({
    name                           = string
    is_manual_connection           = optional(bool)
    private_connection_resource_id = optional(string)
    subresource_names              = list(string)
    request_message                = optional(string)
    private_dns_zone_group_name    = optional(string)
    private_dns_zone_ids           = optional(list(string))
  }))
  description = "Private Endpoints for the supported resources"
  default     = {}
}

variable "subscription_id" {
  type    = string
  default = null
}

variable "pe_subnet_name" {
  type    = string
  default = null
}

variable "virtual_network_name" {
  default = null
  type    = string
}

variable "virtual_network_rg" {
  default = null
  type    = string
}

variable "domain_name" {
  type        = string
  description = "The name of the private dns zone."
}


variable "a_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a A record."
}

variable "aaaa_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a AAAA record."
}

variable "cname_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    record              = string
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a CNAME record."
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see https://aka.ms/avm/telemetryinfo.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "mx_records" {
  type = map(object({
    name                = optional(string, "@")
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      preference = number
      exchange   = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a MX record."
}

variable "ptr_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a PTR record."
}

variable "soa_record" {
  type = object({
    email        = string
    expire_time  = optional(number, 2419200)
    minimum_ttl  = optional(number, 10)
    refresh_time = optional(number, 3600)
    retry_time   = optional(number, 300)
    ttl          = optional(number, 3600)
    tags         = optional(map(string), null)
  })
  default     = null
  description = "optional soa_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com"
}

variable "srv_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      priority = number
      weight   = number
      port     = number
      target   = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a SRV record."
}

variable "txt_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      value = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a TXT record."
}

variable "virtual_network_links" {
  type = map(object({
    vnetlinkname     = string
    vnetid           = string
    autoregistration = optional(bool, false)
    tags             = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a virtual network link."
}
variable "create_dns_zone" {
  type    = bool
  default = false
}

variable "dns_zone_id" {
  description = "The ID of the DNS zone if provided by the user"
  type        = string
  default     = ""
}
variable "enable_private_endpoint" {
  description = "controls whether or not to create private endpoints"
  type        = bool
  default     = true
}
variable "public_network_access_enabled" {
  description = "Enable or disable public network access."
  type        = bool
  default     = true
}

##############################################
# Diagnostics settings for open AI
##############################################

variable "enable_diagnostic_setting" {
  type        = bool
  default     = false
  description = "Choose if Diagnostic setting should be enabled"
}

variable "diagnostics_settings_name" {
  type        = string
  description = "The diagnostics setting name of the resource on."
  default     = ""
}

variable "log_categories" {
  type        = list(string)
  default     = null
  description = "List of log categories. Defaults to all available."
}

variable "excluded_log_categories" {
  type        = list(string)
  default     = []
  description = "List of log categories to exclude."
}

variable "metric_categories" {
  type        = list(string)
  default     = null
  description = "List of metric categories. Defaults to all available."
}

variable "logs_destinations_ids" {
  type        = list(string)
  nullable    = false
  default     = []
  description = <<EOD
List of destination resources IDs for logs diagnostic destination.
Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.
If you want to use Azure EventHub as destination, you must provide a formatted string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>|</code> character.
EOD
}

variable "log_analytics_destination_type" {
  type        = string
  default     = "AzureDiagnostics"
  description = "When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
}
