locals {
  naming = "${var.appname}-${var.env}"

  tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costappownermanager
    costAppOwnerTech    = var.costappownertech
    costBudgetOwner     = var.costbudgetowner
    costCostCenter      = var.costcostcenter
    costDivision        = var.costdivision
    costRegion          = var.location
    costVP              = var.costvp
    environment         = var.environment
    costAllocation      = var.costallocation #(can only be sharedcosts or chargeback)
    appFunction         = var.appfunction
    monthlyBudget       = var.monthlybudget
    costbaseline        = var.costbaseline #(year resource created)
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
    app_id              = var.app_id
    msftmigration       = var.msftmigration
  }

  private_dns_zones_names = toset(var.private_dns_zones_names)
}