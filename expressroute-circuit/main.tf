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
    environment         = var.env
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
  name = var.exprrg
}

#public ip
resource "azurerm_public_ip" "publicip" {
  name                = "pip-${local.naming}-${var.additionalcontext}"
  resource_group_name = data.azurerm_resource_group.exprrg.name
  location            = var.location
  allocation_method   = var.iptype
  sku                 = var.ipsku
  zones               = var.zones

  tags = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}

#Expressroute Circuit#
resource "azurerm_express_route_circuit" "erc" {
  name                  = "expr-${local.naming}-${var.additionalcontext}"
  resource_group_name   = data.azurerm_resource_group.exprrg.name
  location              = var.location
  service_provider_name = var.ercserviceprovider
  peering_location      = var.ercpeeringlocation
  bandwidth_in_mbps     = var.ercmbps

  sku {
    tier   = var.ercskutier
    family = var.ercskufamily
  }

  allow_classic_operations = false

  tags = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}