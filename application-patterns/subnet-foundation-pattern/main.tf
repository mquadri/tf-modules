#application resource group
module "application-resource-group" {
  source            = "../../resource-groups"
  for_each          = var.application_resource_groups
  location          = each.value.location
  name              = each.value.name
  enable_telemetry  = each.value.enable_telemetry
  lock              = each.value.lock
  role_assignments  = each.value.role_assignments
  tags              = each.value.tags
  appname           = each.value.appname
  resourcetype      = each.value.resourcetype
  additionalcontext = each.value.additionalcontext
  app_id            = each.value.app_id
  environment       = each.value.environment
  migration         = each.value.migration
}

#app subnet
module "app-subnet" {
  source                                                = "../../subnet"
  for_each                                              = var.new_subnet
  location                                              = each.value.location
  resourcetype                                          = each.value.resourcetype
  appid                                                 = each.value.appid
  appname                                               = each.value.appname
  additionalcontext                                     = each.value.additionalcontext
  vnet_resource_group_name                              = each.value.vnet_resource_group_name
  vnet_name                                             = each.value.vnet_name
  service_endpoint_list                                 = each.value.service_endpoint_list
  subnet_enforce_private_link_endpoint_network_policies = each.value.subnet_enforce_private_link_endpoint_network_policies
  address_prefix                                        = each.value.address_prefix
  subnet_delegations                                    = each.value.subnet_delegations
  name                                                  = each.value.name
  default_outbound_access_enabled                       = each.value.default_outbound_access_enabled
  nat_gateway                                           = each.value.nat_gateway
  network_security_group                                = each.value.network_security_group
  private_endpoint_network_policies                     = each.value.private_endpoint_network_policies
  private_link_service_network_policies_enabled         = each.value.private_link_service_network_policies_enabled
  role_assignments                                      = each.value.role_assignments
  route_table                                           = each.value.route_table
  service_endpoint_policies                             = each.value.service_endpoint_policies
  sharing_scope                                         = each.value.sharing_scope
  subscription_id                                       = each.value.subscription_id
  virtual_network                                       = each.value.virtual_network
  env                                                   = each.value.env
}

#NSG association to subnet
module "nsg-subnet-association" {
  source          = "../../nsg_association"
  nsg_association = var.nsg_association
}
