location = "your-location"

name = "your-route-table-name"

resource_group_name = "your-rg"


disable_bgp_route_propagation = true

enable_telemetry = true

lock = {
  kind = "CanNotDelete"
  # name can be omitted or set to null to auto-generate a name
}

role_assignments = {
  role1 = {
    role_definition_id_or_name       = "your role id or name"
    principal_id                     = "your-principal id"
    description                      = "Description"
    skip_service_principal_aad_check = false
  }
}

routes = {
  route1 = {
    name           = "my-vnet-route"
    address_prefix = "10.1.0.0/16"
    next_hop_type  = "VnetLocal"
  }
}

tags = {
  environment = "production"
  team        = "networking"
}

subnet = {
  "subnet-1" = {
    subnet_name          = "default"
    virtual_network_name = "your-vnet"
    rg_name              = "your-rg"
  }
  "subnet-2" = {
    subnet_name          = "default2"
    virtual_network_name = "your-vnet"
    rg_name              = "your-rg"
  }
}
