module "avm-res-network-virtualnetwork_subnet" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm//modules/subnet"
  version = "0.8.1"

  name             = local.naming
  address_prefix   = var.address_prefix
  address_prefixes = [var.address_prefix]
  virtual_network = var.virtual_network != null ? var.virtual_network : {
    resource_id = data.azurerm_virtual_network.this.id
  }
  service_endpoints = length(var.service_endpoint_list) > 0 ? var.service_endpoint_list : []

  delegation = [
    for k, v in var.subnet_delegations :
    {
      name = k
      service_delegation = {
        name    = v["name"]
        actions = v["actions"]
      }
    }
  ]

  default_outbound_access_enabled               = var.default_outbound_access_enabled
  nat_gateway                                   = var.nat_gateway
  network_security_group                        = var.network_security_group
  private_endpoint_network_policies             = var.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  role_assignments                              = var.role_assignments
  route_table                                   = var.route_table
  service_endpoint_policies                     = var.service_endpoint_policies
  sharing_scope                                 = var.sharing_scope
  subscription_id                               = var.subscription_id
}