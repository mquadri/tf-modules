variable "new_subnet" {
  type = map(object({
    location                                              = string
    resourcetype                                          = string
    appid                                                 = string
    appname                                               = string
    env                                                   = string
    additionalcontext                                     = string
    vnet_resource_group_name                              = string
    vnet_name                                             = string
    address_prefix                                        = string
    subscription_id                                       = string
    name                                                  = string
    service_endpoint_list                                 = optional(list(string), [])
    subnet_enforce_private_link_endpoint_network_policies = optional(map(bool), {})
    subnet_delegations = optional(map(object({
      name    = string
      actions = list(string)
    })), {})
    default_outbound_access_enabled = optional(bool, true)
    nat_gateway = optional(object({
      id = string
    }), null)
    network_security_group = optional(object({
      id = string
    }), null)
    private_endpoint_network_policies             = optional(string, "Enabled")
    private_link_service_network_policies_enabled = optional(bool, true)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    route_table = optional(object({
      id = string
    }), null)
    service_endpoint_policies = optional(map(object({
      id = string
    })), null)
    sharing_scope = optional(string, null)
    virtual_network = optional(object({
      resource_id = string
    }), null)
  }))
}


variable "application_resource_groups" {
  type = map(object({
    location         = string
    name             = string
    enable_telemetry = optional(bool, true)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    tags              = optional(map(string), {})
    appname           = string
    resourcetype      = string
    additionalcontext = string
    app_id            = string
    environment       = string
    migration         = string
  }))
  default = {}
}


variable "nsg_association" {
  type = map(object({
    nsg_name                 = string
    nsg_resource_group       = string
    subnet_name              = string
    vnet_name                = string
    vnet_resource_group_name = string
  }))
  default     = {}
  description = "Associates NSGs with subnet"
}
