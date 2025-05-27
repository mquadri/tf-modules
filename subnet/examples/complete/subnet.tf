module "subnet-example-infra-prod-01" {
  source              = "github.com/CenturyLink/tf-modules-azure//subnet?ref=2.3.0"
  appid               = var.appid
  appname             = var.appname
  resourcetype        = "snet-pe"
  costAppOwnerManager = var.costAppOwnerManager
  costAppOwnerTech    = var.costAppOwnerTech
  costBudgetOwner     = var.costBudgetOwner
  costCostCenter      = var.costCostCenter
  costDivision        = var.costDivision
  costVP              = var.costVP
  env                 = var.env
  costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  costbaseline        = var.costbaseline #(year resource created)
  location            = var.location
  additionalcontext   = var.additionalcontext

  vnet_resource_group_name = var.vnet_resource_group_name
  vnet_name                = var.vnet_name
  address_prefix           = var.address_prefix
  service_endpoint_list    = var.service_endpoint_list
  subnet_delegations       = var.subnet_delegations

  providers = {
    azurerm = azurerm.main
  }

  default_outbound_access_enabled               = var.default_outbound_access_enabled
  nat_gateway                                   = var.nat_gateway
  network_security_group                        = var.network_security_group
  private_endpoint_network_policies             = var.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  role_assignments                              = var.role_assignments
  route_table                                   = var.route_table
  service_endpoint_policies                     = var.service_endpoint_policies
  service_endpoints                             = var.service_endpoints
  sharing_scope                                 = var.sharing_scope
  subscription_id                               = var.subscription_id
}
