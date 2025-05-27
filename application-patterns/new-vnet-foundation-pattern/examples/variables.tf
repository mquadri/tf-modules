variable "prod_network_deploy" {
  type = map(object({
    location                 = string
    app_id                   = string
    msftmigration            = string
    appname                  = string
    env                      = string
    additionalcontext        = string
    vnet_resource_group_name = string
    address_space            = list(string)
    dns_servers              = optional(list(string), [])
    resourcetype             = string
    subnets = map(object({
      resourcetype      = optional(string)
      additionalcontext = optional(string)
      name              = optional(string)
      address_prefixes  = optional(list(string))
      service_endpoints = optional(list(string), [])
      delegations = optional(map(object({
        name    = string
        actions = list(string)
      })), {})

      nat_gateway = optional(object({
        id = string
      }))
      network_security_group = optional(object({
        id = string
      }))
      private_endpoint_network_policies             = optional(string, "Enabled")
      private_link_service_network_policies_enabled = optional(bool, true)
      route_table = optional(object({
        id = string
      }))
      service_endpoint_policies = optional(map(object({
        id = string
      })))
      default_outbound_access_enabled = optional(bool, true)
      sharing_scope                   = optional(string, null)
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
      role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })))
    }))
    name          = string
    bgp_community = optional(string, null)
    ddos_protection_plan = optional(object({
      id     = string
      enable = bool
    }), null)
    diagnostic_settings = optional(map(object({
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
    })), {})
    enable_telemetry     = optional(bool, true)
    enable_vm_protection = optional(bool, false)
    encryption = optional(object({
      enabled     = bool
      enforcement = string
    }), null)
    extended_location = optional(object({
      name = string
      type = string
    }), null)
    flow_timeout_in_minutes = optional(number, null)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    peerings = optional(map(object({
      name                               = string
      remote_virtual_network_resource_id = string
      allow_forwarded_traffic            = optional(bool, false)
      allow_gateway_transit              = optional(bool, false)
      allow_virtual_network_access       = optional(bool, true)
      do_not_verify_remote_gateways      = optional(bool, false)
      enable_only_ipv6_peering           = optional(bool, false)
      peer_complete_vnets                = optional(bool, true)
      local_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      remote_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      local_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      remote_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      use_remote_gateways                   = optional(bool, false)
      create_reverse_peering                = optional(bool, false)
      reverse_name                          = optional(string)
      reverse_allow_forwarded_traffic       = optional(bool, false)
      reverse_allow_gateway_transit         = optional(bool, false)
      reverse_allow_virtual_network_access  = optional(bool, true)
      reverse_do_not_verify_remote_gateways = optional(bool, false)
      reverse_enable_only_ipv6_peering      = optional(bool, false)
      reverse_peer_complete_vnets           = optional(bool, true)
      reverse_local_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      reverse_remote_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      reverse_local_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      reverse_remote_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      reverse_use_remote_gateways = optional(bool, false)
    })), {})

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

    tags                      = optional(map(string), {})
    create_virtual_network    = optional(bool, true)
    virtual_hub_id            = optional(string, null)
    internet_security_enabled = optional(bool, true)
    environment               = string

  }))
  default = {}
}

variable "network_resource_groups" {
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


variable "liftshift_network_deploy" {
  type = map(object({
    location                 = string
    app_id                   = string
    msftmigration            = string
    appname                  = string
    env                      = string
    additionalcontext        = string
    vnet_resource_group_name = string
    address_space            = list(string)
    dns_servers              = optional(list(string), [])
    resourcetype             = string
    subnets = map(object({
      resourcetype      = optional(string)
      additionalcontext = optional(string)
      name              = optional(string)
      address_prefixes  = optional(list(string))
      service_endpoints = optional(list(string), [])
      delegations = optional(map(object({
        name    = string
        actions = list(string)
      })), {})

      nat_gateway = optional(object({
        id = string
      }))
      network_security_group = optional(object({
        id = string
      }))
      private_endpoint_network_policies             = optional(string, "Enabled")
      private_link_service_network_policies_enabled = optional(bool, true)
      route_table = optional(object({
        id = string
      }))
      service_endpoint_policies = optional(map(object({
        id = string
      })))
      default_outbound_access_enabled = optional(bool, true)
      sharing_scope                   = optional(string, null)
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
      role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })))
    }))
    name          = string
    bgp_community = optional(string, null)
    ddos_protection_plan = optional(object({
      id     = string
      enable = bool
    }), null)
    diagnostic_settings = optional(map(object({
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
    })), {})
    enable_telemetry     = optional(bool, true)
    enable_vm_protection = optional(bool, false)
    encryption = optional(object({
      enabled     = bool
      enforcement = string
    }), null)
    extended_location = optional(object({
      name = string
      type = string
    }), null)
    flow_timeout_in_minutes = optional(number, null)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    peerings = optional(map(object({
      name                               = string
      remote_virtual_network_resource_id = string
      allow_forwarded_traffic            = optional(bool, false)
      allow_gateway_transit              = optional(bool, false)
      allow_virtual_network_access       = optional(bool, true)
      do_not_verify_remote_gateways      = optional(bool, false)
      enable_only_ipv6_peering           = optional(bool, false)
      peer_complete_vnets                = optional(bool, true)
      local_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      remote_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      local_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      remote_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      use_remote_gateways                   = optional(bool, false)
      create_reverse_peering                = optional(bool, false)
      reverse_name                          = optional(string)
      reverse_allow_forwarded_traffic       = optional(bool, false)
      reverse_allow_gateway_transit         = optional(bool, false)
      reverse_allow_virtual_network_access  = optional(bool, true)
      reverse_do_not_verify_remote_gateways = optional(bool, false)
      reverse_enable_only_ipv6_peering      = optional(bool, false)
      reverse_peer_complete_vnets           = optional(bool, true)
      reverse_local_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      reverse_remote_peered_address_spaces = optional(list(object({
        address_prefix = string
      })))
      reverse_local_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      reverse_remote_peered_subnets = optional(list(object({
        subnet_name = string
      })))
      reverse_use_remote_gateways = optional(bool, false)
    })), {})

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

    tags                      = optional(map(string), {})
    create_virtual_network    = optional(bool, true)
    virtual_hub_id            = optional(string, null)
    internet_security_enabled = optional(bool, true)
    environment               = string

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
