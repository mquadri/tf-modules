# Tag variable values
resourcetype   = "sub"
appid          = "test"
appname        = "exmaple-infra"
env            = "dev"
costCostCenter = "test"
# costVP                               = "vp"
costAppOwnerTech    = "owner"
costAppOwnerManager = "manager"
costBudgetOwner     = "budget owner"
# management_group_name                = "mg-name"
# costDivision                         = "devision-name"
appFunction             = "exmaple general dev Subscription"
costbaseline            = "2024"
costAllocation          = "sharedcost"
monthlyBudget           = "1000"
log_analytics_workspace = "loglbeastus2"
subnet_name             = "subnet_vnet"
vnet_name               = "vnet_eastus2"
frontend_ip_configurations = {
  frontend_configuration_1 = {
    name                                   = "myFrontend"
    create_public_ip_address               = false
    frontend_private_ip_address            = "10.0.0.45"
    frontend_private_ip_subnet_resource_id = "/subscriptions/db4edbdd-2433-47cc-a5da-d1cf82051e02/resourceGroups/rg-loadbalancer_eastus/providers/Microsoft.Network/virtualNetworks/vnet_eastus2/subnets/subnet_vnet"
    inherit_lock                           = true
    inherit_tags                           = true
  }
}
builtin_role        = "Contributor"
location            = "eastus2"
resource_group_name = "rg-loadbalancer_eastus"
name                = "lbmonitoreastus2"