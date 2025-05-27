module "acr-dev" {
  source               = "github.com/CenturyLink/tf-modules-azure//acr?ref=1.0.35"
  appid                = var.appid
  appname              = var.appname
  resourcetype         = "acr"
  costAppOwnerManager  = var.costAppOwnerManager
  costAppOwnerTech     = var.costAppOwnerTech
  costBudgetOwner      = var.costBudgetOwner
  costCostCenter       = var.costCostCenter
  costDivision         = var.costDivision
  location             = var.location
  costVP               = var.costVP
  env                  = var.env
  costAllocation       = var.costAllocation #(can only be sharedcosts or chargeback)
  appFunction          = var.appFunction
  monthlyBudget        = var.monthlyBudget
  costbaseline         = var.costbaseline #(year resource created)
  additionalcontext    = var.additionalcontext
  resource_group_name  = module.resource-group-aks.name
  subnet_id            = var.subnet_id
  additional_locations = var.acr_additional_locations
  private_dns_zone_ids = data.azurerm_private_dns_zone.acr.id
}