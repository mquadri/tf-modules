locals {
  default_name = "spark-${var.appname}-${var.env}-${var.location}-${var.additionalcontext}"
  var_name     = var.name == null ? "" : var.name
  name         = length(local.var_name) > 5 ? local.var_name : local.default_name
  tags = {
    appid               = var.appid
    appname             = var.appname
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    costDivision        = var.costDivision
    costVP              = var.costVP
    costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
  }
}