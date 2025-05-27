module "fab_capacity" {
  source              = "../"
  appid               = var.appid
  appname             = var.appname
  resourcetype        = var.resourcetype
  costAppOwnerManager = var.costAppOwnerManager
  costAppOwnerTech    = var.costAppOwnerTech
  costBudgetOwner     = var.costBudgetOwner
  costCostCenter      = var.costCostCenter
  costDivision        = var.costDivision
  costVP              = var.costVP
  env                 = var.env
  costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  costbaseline        = var.costbaseline #(year resource created)
  location            = var.location
  additionalcontext   = var.additionalcontext

  resource_group_name    = var.resource_group_name
  sku_name               = var.sku_name
  administration_members = var.administration_members
  name                   = var.name
}