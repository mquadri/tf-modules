module "key-vault-application" {
  source               = "github.com/CenturyLink/tf-modules-azure//key-vault?ref=2.46.2"
  appid                = var.appid
  app_id               = var.appid
  appname              = var.appname
  resourcetype         = "kv"
  costAppOwnerManager  = var.costAppOwnerManager
  costAppOwnerTech     = var.costAppOwnerTech
  costBudgetOwner      = var.costBudgetOwner
  costCostCenter       = var.costCostCenter
  costDivision         = var.costDivision
  costVP               = var.costVP
  environment          = var.environment
  costAllocation       = var.costAllocation #(can only be sharedcosts or chargeback)
  appFunction          = var.appFunction
  monthlyBudget        = var.monthlyBudget
  costbaseline         = var.costbaseline #(year resource created)
  location             = var.location
  additionalcontext    = var.additionalcontext
  resource_group_name  = data.azurerm_resource_group.rg_application.name
  private_dns_zone_ids = data.azurerm_private_dns_zone.kv.id
  subnet_id            = var.subnet_id
  tenant_id            = var.tenant_id
  sku_name             = "premium"
  rbac_enabled         = var.rbac_enabled
  msftmigration        = false
  env                  = var.env
  

  providers = {
    azurerm = azurerm.main
  }
}