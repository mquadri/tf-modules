module "document_intelligence" {
  source = "../../document-intelligence"
  providers = {
    azurerm = azurerm.main
  }

  appid               = var.appid
  appname             = var.appname
  resourcetype        = "di"
  costAppOwnerManager = var.costAppOwnerManager
  costAppOwnerTech    = var.costAppOwnerTech
  costBudgetOwner     = var.costBudgetOwner
  costCostCenter      = var.costCostCenter
  costDivision        = var.costDivision
  costVP              = var.costVP
  env                 = var.env
  costAllocation      = var.costAllocation
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  costbaseline        = var.costbaseline
  location            = var.location
  additionalcontext   = var.additionalcontext

  resource_group_name = "rg-sample-01"
  sku_name            = "S0"

  public_network_access_enabled = false
  private_endpoints = {
    pe1 = {
      name               = "pe_di_${var.appname}_${var.env}_${var.additionalcontext}"
      subnet_resource_id = "sample_subnet_id"
    }
  }
}
