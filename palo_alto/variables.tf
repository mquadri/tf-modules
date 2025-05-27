variable "nva" {
  description = "Configuration for Palo Alto Virtual Network Appliance"
  type = map(object({
    name    = string
    region  = string
    vhub_id = string
  }))
}

variable "firewall" {
  description = "Configuration for Palo Alto Next Generation Firewall"
  type = map(object({
    name                = string
    region              = string
    vhub_id             = string
    resource_group_name = string
    public_ip_id        = string
    panorama_config     = string
  }))
}

variable "routing_intent" {
  description = "Map of routing intents with associated routing policies for each virtual hub"
  type = map(object({
    name            = string
    vhub_id         = string
    region          = string
    routing_policies = list(object({
      policy_name  = string
      destinations = list(string)
    }))
  }))
}
