locals {
  naming = "${var.resourcetype}-${var.appname}-${var.env}-${var.location}"

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
resource "azurerm_resource_group" "exprrg" {
  name = var.exprrg
}

data "azurerm_public_ip" "pip" {
  name                = var.pip
  resource_group_name = var.exprrg
}

data "azurerm_express_route_circuit" "expr" {
  name                = var.expr
  resource_group_name = var.exprrg
}

#Expressroute Private Peering
resource "azurerm_express_route_circuit_peering" "privpeer" {
  peering_type                  = "AzurePrivatePeering"
  express_route_circuit_name    = data.azurerm_express_route_circuit.expr.name
  resource_group_name           = azurerm_resource_group.exprrg.name
  peer_asn                      = var.peer_asn
  primary_peer_address_prefix   = var.primary_peering_address
  secondary_peer_address_prefix = var.secondary_peering_address
  vlan_id                       = var.vlan_id
}

#Expressroute vng#
resource "azurerm_virtual_network_gateway" "ercgw" {
  name                = "vpng-${local.naming}-${var.additionalcontext}"
  resource_group_name = data.azurerm_resource_group.exprrg.name
  location            = var.location
  type                = "ExpressRoute"
  sku                 = var.gwsku

  ip_configuration {
    name                 = "default"
    public_ip_address_id = data.azurerm_public_ip.publicip.id
    subnet_id            = var.gwsubnet
  }
  tags = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}

#Expressroute connection#
resource "azurerm_virtual_network_gateway_connection" "erccn" {
  name                       = "ercn-${local.naming}-${var.additionalcontext}"
  resource_group_name        = azurerm_resource_group.exprrg.name
  location                   = var.location
  type                       = "ExpressRoute"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.ercgw.id
  express_route_circuit_id   = data.azurerm_express_route_circuit.expr.id
  routing_weight             = var.rtweight

  tags = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}