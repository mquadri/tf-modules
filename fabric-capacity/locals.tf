locals {
  default_name = var.additionalcontext != "" ? "${var.resourcetype}${var.appname}${var.env}${var.additionalcontext}" : "${var.resourcetype}${var.appname}${var.env}"
  var_name     = var.name == null ? "" : var.name
  name         = length(local.var_name) > 3 ? local.var_name : lower(replace(local.default_name, "-", ""))

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
