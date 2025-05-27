# Add your variable declarations here
variable "location" {
  description = "The location for the ExpressRoute circuit"
  type        = string
  default     = "East US 2"
}

variable "enable_telemetry" {
  description = "Enable telemetry for the module"
  type        = bool
  default     = false
}

variable "bandwidth_in_mbps" {
  description = "The bandwidth in Mbps for the ExpressRoute circuit"
  type        = number
  default     = 50
}

variable "peering_location" {
  description = "The peering location for the ExpressRoute circuit"
  type        = string
  default     = ""
}

variable "service_provider_name" {
  description = "The service provider name for the ExpressRoute circuit"
  type        = string
  default     = ""
}

variable "expressroute_resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = ""
}

variable "peerings" {
  type = map(object({
    peering_type                  = string
    vlan_id                       = number
    primary_peer_address_prefix   = optional(string, null)
    secondary_peer_address_prefix = optional(string, null)
    ipv4_enabled                  = optional(bool, true)
    shared_key                    = optional(string, null)
    peer_asn                      = optional(number, null)
    route_filter_resource_id      = optional(string, null)
    microsoft_peering_config = optional(object({
      advertised_public_prefixes = list(string)
      customer_asn               = optional(number, null)
      routing_registry_name      = optional(string, "NONE")
      advertised_communities     = optional(list(string), null)
    }), null)
    ipv6 = optional(object({
      primary_peer_address_prefix   = string
      secondary_peer_address_prefix = string
      enabled                       = optional(bool, true)
      route_filter_resource_id      = optional(string, null)
      microsoft_peering = optional(object({
        advertised_public_prefixes = optional(list(string))
        customer_asn               = optional(number, null)
        routing_registry_name      = optional(string, "NONE")
        advertised_communities     = optional(list(string), null)
      }), null)
    }), null)
  }))
  default     = {}
  description = <<DESCRIPTION
(Optional) A map of association objects to create peerings between the created circuit and the designated gateways. 

- `peering_type` - (Required) The type of peering. Possible values are `AzurePrivatePeering`, `AzurePublicPeering`, and `MicrosoftPeering`.
- `vlan_id` - (Required) The VLAN ID for the peering.
- `primary_peer_address_prefix` - (Optional) The primary peer address prefix.
- `secondary_peer_address_prefix` - (Optional) The secondary peer address prefix.
- `ipv4_enabled` - (Optional) Is IPv4 enabled for this peering. Defaults to `true`.
- `shared_key` - (Optional) The shared key for the peering.
- `peer_asn` - (Optional) The peer ASN.
- `route_filter_resource_id` - (Optional) The ID of the route filter to associate with the peering.
- `microsoft_peering_config` - (Optional) A map of Microsoft peering configuration settings.
  - `advertised_public_prefixes` - (Required) A list of public prefixes to advertise.
  - `customer_asn` - (Optional) The customer ASN.
  - `routing_registry_name` - (Optional) The routing registry name. Defaults to `NONE`.
  - `advertised_communities` - (Optional) A list of advertised communities.
- `ipv6` - (Optional) A map of IPv6 peering configuration settings.
  - `primary_peer_address_prefix` - (Required) The primary peer address prefix.
  - `secondary_peer_address_prefix` - (Required) The secondary peer address prefix.
  - `enabled` - (Optional) Is IPv6 enabled for this peering. Defaults to `true`.
  - `route_filter_resource_id` - (Optional) The ID of the route filter to associate with the peering.
  - `microsoft_peering` - (Optional) A map of Microsoft peering configuration settings.
    - `advertised_public_prefixes` - (Optional) A list of public prefixes to advertise.
    - `customer_asn` - (Optional) The customer ASN.
    - `routing_registry_name` - (Optional) The routing registry name. Defaults to `NONE`.
    - `advertised_communities` - (Optional) A list of advertised communities.

Example Input:

```terraform
peerings = {
  PrivatePeering = {
    peering_type                  = "AzurePrivatePeering"
    peer_asn                      = 100
    primary_peer_address_prefix   = "10.0.0.0/30"
    secondary_peer_address_prefix = "10.0.0.4/30"
    ipv4_enabled                  = true
    vlan_id                       = 300

    ipv6 {
      primary_peer_address_prefix   = "2002:db01::/126"
      secondary_peer_address_prefix = "2003:db01::/126"
      enabled                       = true
    }
  },
  MicrosoftPeering = {
    peering_type                  = "MicrosoftPeering"
    peer_asn                      = 200
    primary_peer_address_prefix   = "123.0.0.0/30"
    secondary_peer_address_prefix = "123.0.0.4/30"
    ipv4_enabled                  = true
    vlan_id                       = 400

    microsoft_peering_config {
      advertised_public_prefixes = ["123.1.0.0/24"]
    }

    ipv6 {
      primary_peer_address_prefix   = "2002:db01::/126"
      secondary_peer_address_prefix = "2003:db01::/126"
      enabled                       = true

      microsoft_peering {
        advertised_public_prefixes = ["2002:db01::/126"]
      }
    }
  }
}
```
DESCRIPTION
  nullable    = false
}
variable "express_route_circuit_authorizations" {
  type = map(object({
    name = string
  }))
  default     = {}
  description = <<DESCRIPTION
(Optional) A map of authorization objects to create authorizations for the ExpressRoute Circuits. 
- `name` - (Required) The name of the authorization.
DESCRIPTION
  nullable    = false
}
variable "diagnostic_settings" {
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default     = {}
  description = <<DESCRIPTION
A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.
- `log_categories` - (Optional) A set of log categories to send to the log analytics workspace. Defaults to `[]`.
- `log_groups` - (Optional) A set of log groups to send to the log analytics workspace. Defaults to `["allLogs"]`.
- `metric_categories` - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to `["AllMetrics"]`.
- `log_analytics_destination_type` - (Optional) The destination type for the diagnostic setting. Possible values are `Dedicated` and `AzureDiagnostics`. Defaults to `Dedicated`.
- `workspace_resource_id` - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.
- `storage_account_resource_id` - (Optional) The resource ID of the storage account to send logs and metrics to.
- `event_hub_authorization_rule_resource_id` - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.
- `event_hub_name` - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.
- `marketplace_partner_resource_id` - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.
DESCRIPTION  
  nullable    = false
}

variable "sku" {
  type = object({
    tier   = string
    family = string
  })
  description = <<DESCRIPTION
(Required) The SKU of the ExpressRoute Circuit.
DESCRIPTION
  nullable    = false
}
############################tags#################################
variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
  default     = "01"
}

variable "appFunction" {
  description = "app function"
  type        = string
  default     = ""
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
  default     = ""
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = ""
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}
variable "costDivision" {
  description = "cost division"
  type        = string
  default     = ""
}
variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = ""
}
variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = ""
}
variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}
variable "resourcetype" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}
variable "monthlyBudget" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tags
variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX","NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}
