module "virtualnetwork-subnet" {
  source                    = "../../vnet"
  for_each                  = var.prod_network_deploy
  location                  = each.value.location
  app_id                    = each.value.app_id
  msftmigration             = each.value.msftmigration
  appname                   = each.value.appname
  env                       = each.value.env
  additionalcontext         = each.value.additionalcontext
  vnet_resource_group_name  = each.value.vnet_resource_group_name
  address_space             = each.value.address_space
  dns_servers               = each.value.dns_servers
  subnets                   = each.value.subnets
  name                      = each.value.name
  bgp_community             = each.value.bgp_community
  ddos_protection_plan      = each.value.ddos_protection_plan
  diagnostic_settings       = each.value.diagnostic_settings
  enable_telemetry          = each.value.enable_telemetry
  enable_vm_protection      = each.value.enable_vm_protection
  encryption                = each.value.encryption
  extended_location         = each.value.extended_location
  flow_timeout_in_minutes   = each.value.flow_timeout_in_minutes
  lock                      = each.value.lock
  peerings                  = each.value.peerings
  role_assignments          = each.value.role_assignments
  tags                      = each.value.tags
  create_virtual_network    = each.value.create_virtual_network
  virtual_hub_id            = each.value.virtual_hub_id
  internet_security_enabled = each.value.internet_security_enabled
  environment               = each.value.environment
  resourcetype              = each.value.resourcetype
}

#network resource group
module "network-resource-group" {
  source            = "../../resource-groups"
  for_each          = var.network_resource_groups
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


module "liftshift-virtualnetwork-subnet" {
  source                    = "../../vnet"
  for_each                  = var.liftshift_network_deploy
  location                  = each.value.location
  app_id                    = each.value.app_id
  msftmigration             = each.value.msftmigration
  appname                   = each.value.appname
  env                       = each.value.env
  additionalcontext         = each.value.additionalcontext
  vnet_resource_group_name  = each.value.vnet_resource_group_name
  address_space             = each.value.address_space
  dns_servers               = each.value.dns_servers
  subnets                   = each.value.subnets
  name                      = each.value.name
  bgp_community             = each.value.bgp_community
  ddos_protection_plan      = each.value.ddos_protection_plan
  diagnostic_settings       = each.value.diagnostic_settings
  enable_telemetry          = each.value.enable_telemetry
  enable_vm_protection      = each.value.enable_vm_protection
  encryption                = each.value.encryption
  extended_location         = each.value.extended_location
  flow_timeout_in_minutes   = each.value.flow_timeout_in_minutes
  lock                      = each.value.lock
  peerings                  = each.value.peerings
  role_assignments          = each.value.role_assignments
  tags                      = each.value.tags
  create_virtual_network    = each.value.create_virtual_network
  virtual_hub_id            = each.value.virtual_hub_id
  internet_security_enabled = each.value.internet_security_enabled
  environment               = each.value.environment
  resourcetype              = each.value.resourcetype
}



#NSG association to subnet
module "nsg-subnet-association" {
  source          = "../../nsg_association"
  nsg_association = var.nsg_association
}
