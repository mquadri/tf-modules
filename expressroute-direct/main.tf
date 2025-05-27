locals {
  naming = "${var.resourcetype}-${var.appname}-${var.env}-${var.location}"

  tags = {
    appid               = var.appid
    appname             = var.appname
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    costVP              = var.costVP
    environment         = var.env
    resourcetype        = var.resourcetype
    location            = var.location
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
  }
}
#Expressroute Resource Group#
resource "azurerm_resource_group" "exprrg" {
  name     = var.exprrg
  location = var.location

  tags = local.tags
}

#public ip
resource "azurerm_public_ip" "publicip" {
  name                = "${local.naming}-pip-${var.additionalcontext}"
  resource_group_name = data.azurerm_resource_group.gwsubnetrg.name
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

#Expressroute port#
resource "azurerm_express_route_port" "erp" {
  name                = "erp-${local.naming}-${var.additionalcontext}"
  resource_group_name = azurerm_resource_group.exprrg.name
  location            = var.location
  peering_location    = var.erppeeringlocation
  bandwidth_in_gbps   = var.erpgbps
  encapsulation       = "Dot1Q"
  //In the event that MACSEC is required, additional information can be located here https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_port#link1

  link1 {
    admin_enabled = false
  }

  link2 {
    admin_enabled = false
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}

resource "azurerm_express_route_circuit" "example" {
  name                  = "erc-${local.naming}-${var.additionalcontext}"
  location              = var.location
  resource_group_name   = azurerm_resource_group.exprrg.name
  express_route_port_id = azurerm_express_route_port.erp.id
  bandwidth_in_gbps     = var.erpgbps

  sku {
    tier   = var.erpskutier
    family = var.erpskufamily
  }
}

#Expressroute Private Peering
resource "azurerm_express_route_circuit_peering" "privpeer" {
  peering_type                  = "AzurePrivatePeering"
  express_route_circuit_name    = azurerm_express_route_circuit.erc.name
  resource_group_name           = azurerm_resource_group.exprrg.name
  peer_asn                      = var.peer_asn
  primary_peer_address_prefix   = var.primary_peering_address
  secondary_peer_address_prefix = var.secondary_peering_address
  vlan_id                       = var.vlan_id
}

#Expressroute vng#
resource "azurerm_virtual_network_gateway" "ercgw" {
  name                = "${local.naming}-vpng-${var.additionalcontext}"
  resource_group_name = data.azurerm_resource_group.gwsubnetrg.name
  location            = var.location
  type                = "ExpressRoute"
  sku                 = var.gwsku

  ip_configuration {
    name                 = "default"
    public_ip_address_id = azurerm_public_ip.publicip.id
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
  name                       = "${local.naming}-cn-${var.additionalcontext}"
  resource_group_name        = azurerm_resource_group.exprrg.name
  location                   = var.location
  type                       = "ExpressRoute"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.ercgw.id
  express_route_circuit_id   = azurerm_express_route_circuit.erc.id
  routing_weight             = var.rtweight

  tags = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}