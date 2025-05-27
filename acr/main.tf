locals {
  naming = "${var.resourcetype}${var.appname}${var.env}${var.location}"

  tags = {
    environment         = var.environment
    app_id              = var.app_id
    msftmigration       = var.msftmigration
  }
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
}

module "avm-res-containerregistry-registry" {
  source                        = "Azure/avm-res-containerregistry-registry/azurerm"
  version                       = "0.3.1"
  location                      = var.location
  name                          = "${local.naming}${var.additionalcontext}"
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  export_policy_enabled         = var.export_policy_enabled
  tags                          = local.tags
  georeplications               = var.georeplications
  private_endpoints             = var.private_endpoints
  diagnostic_settings           = var.diagnostic_settings
}