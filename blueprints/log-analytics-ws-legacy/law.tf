module "law" {
  source = "github.com/CenturyLink/tf-modules-azure//log-analytics-ws?ref=1.4.6"

  location                       = var.location
  resourcetype                   = "law"
  appid                          = var.appid
  appname                        = var.appname
  env                            = var.env
  costCostCenter                 = var.costCostCenter
  costVP                         = var.costVP
  costAppOwnerTech               = var.costAppOwnerTech
  costAppOwnerManager            = var.costAppOwnerManager
  costBudgetOwner                = var.costBudgetOwner
  additionalcontext              = var.additionalcontext
  costDivision                   = var.costDivision
  costAllocation                 = var.costAllocation
  appFunction                    = var.appFunction
  monthlyBudget                  = var.monthlyBudget
  costbaseline                   = var.costbaseline
  resource_group_name            = data.azurerm_resource_group.rg_application.name
  retention_in_days              = 30
  analytics_storage_account_name = module.storage-account-blob.name
  subnet_id                      = data.azurerm_subnet.private_endpoint.id
  private_dns_rg                 = var.private_dns_rg

  providers = {
    azurerm            = azurerm.main
    azurerm.management = azurerm.management
  }

  depends_on = [module.storage-account-blob.name]

}
