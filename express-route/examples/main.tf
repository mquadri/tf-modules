
locals {
  naming = "${var.appname}-${var.env}-${var.location}"

  tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    costDivision        = var.costDivision
    costRegion          = var.location
    costVP              = var.costVP
    costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
    appFunction         = var.appFunction
    monthlyBudget       = var.monthlyBudget
    costbaseline        = var.costbaseline #(year resource created)
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
  }
}
#Expressroute Resource Group#
data "azurerm_resource_group" "exprrg" {
  name = var.expressroute_resource_group_name
}

module "exr_circuit_test" {
  source                               = "../"
  resource_group_name                  = data.azurerm_resource_group.exprrg.name
  name                                 = "expr-${local.naming}-${var.additionalcontext}"
  service_provider_name                = var.service_provider_name
  peering_location                     = var.peering_location
  bandwidth_in_mbps                    = var.bandwidth_in_mbps
  location                             = var.location
  sku                                  = var.sku
  peerings                             = var.peerings
  express_route_circuit_authorizations = var.express_route_circuit_authorizations
  tags                                 = local.tags
  diagnostic_settings                  = var.diagnostic_settings
  enable_telemetry                     = var.enable_telemetry
  app_id                               = var.app_id
  msftmigration                        = var.msftmigration
  environment                          = var.environment
}
