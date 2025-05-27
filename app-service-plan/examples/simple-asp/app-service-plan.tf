module "app-service-plan" {
  # source = "github.com/CenturyLink/tf-modules-azure//app-service-plan?ref=2.35.0"

  # For local testing:
  source = "../../../../tf-modules-azure/app-service-plan/"

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

  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name

  providers = {
    azurerm = azurerm.main
  }
}

output "asp_name" {
  value = module.app-service-plan.name
}

output "asp_resource_id" {
  value = module.app-service-plan.resource_id
}

output "asp_resource" {
  value = module.app-service-plan.resource
}
