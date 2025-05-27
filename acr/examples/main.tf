locals {
  naming = "${var.resourcetype}${var.appname}${var.env}${var.location}"
  tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costappownermanager
    costAppOwnerTech    = var.costappownertech
    costBudgetOwner     = var.costbudgetowner
    costCostCenter      = var.costcostcenter
    //costDivision        = var.costDivision
    costRegion = var.location
    //costVP              = var.costVP
    environment      = var.env
    costAllocation   = var.costallocation #(can only be sharedcosts or chargeback)
    appFunction      = var.appfunction
    monthlyBudget    = var.monthlybudget
    costbaseline     = var.costbaseline #(year resource created)
    provisioned_by   = "Terraform"
    provisioned_date = timestamp()
  }
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "false"
#----------------------------------------------------------
resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = var.tags
}

module "avm-res-network-privatednszone" {
  source     = "../../private-dns-zone"
  depends_on = [azurerm_resource_group.rg]
  count      = var.create_dns_zone ? 1 : 0
  # Required Inputs
  domain_name         = var.domain_name
  resource_group_name = var.resource_group_name
  # Optional Inputs
  a_records             = var.a_records
  aaaa_records          = var.aaaa_records
  cname_records         = var.cname_records
  enable_telemetry      = var.enable_telemetry
  mx_records            = var.mx_records
  ptr_records           = var.ptr_records
  soa_record            = var.soa_record
  srv_records           = var.srv_records
  tags                  = var.tags
  txt_records           = var.txt_records
  virtual_network_links = var.virtual_network_links
}

locals {
  dns_zone_id = var.create_dns_zone ? module.avm-res-network-privatednszone[0].dns_zone_id : var.dns_zone_id
}

module "acr" {
  source                        = "../"
  depends_on                    = [azurerm_resource_group.rg]
  resource_group_name           = var.resource_group_name
  acr_name                      = local.naming
  tags                          = var.tags
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  export_policy_enabled         = var.export_policy_enabled
  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids   = [local.dns_zone_id]
      name                            = "pe-${local.naming}"
      private_service_connection_name = "psc-${local.naming}"
      tags                            = local.tags
      private_dns_zone_group_name     = "pe-${local.naming}"
      location                        = var.location
      resource_group_name             = var.resource_group_name
      subnet_resource_id              = "/subscriptions/${var.subscription_id}/resourceGroups/${var.virtual_network_rg}/providers/Microsoft.Network/virtualNetworks/${var.virtual_network_name}/subnets/${var.pe_subnet_name}"
    }
  }
  diagnostic_settings = var.diagnostic_settings
  appid               = var.appid
  appname             = var.appname
  resourcetype        = var.resourcetype
  costAppOwnerManager = var.costappownermanager
  costAppOwnerTech    = var.costappownertech
  costBudgetOwner     = var.costbudgetowner
  costCostCenter      = var.costcostcenter
  env                 = var.env
  costAllocation      = var.costallocation #(can only be sharedcosts or chargeback)
  appFunction         = var.appfunction
  monthlyBudget       = var.monthlybudget
  costbaseline        = var.costbaseline #(year resource created)
  additionalcontext   = var.additionalcontext
  app_id              = var.app_id
  environment         = var.environment
  msftmigration       = var.msftmigration
}