locals {
  naming = "${var.resourcetype}-${var.appname}-${var.env}"

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

  frontend_port_name             = "${local.naming}-feport"
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  gateway_ip_configuration_name  = "${local.naming}-gwipc"

  resource_group_name = data.azurerm_resource_group.rgrp.name
  location            = data.azurerm_resource_group.rgrp.location
}