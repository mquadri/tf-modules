module "custom_vision_prediction" {
  # source   = "github.com/CenturyLink/tf-modules-azure//custom-vision?ref=2.36.4"
  source = "../"
  providers = {
    azurerm = azurerm.main
  }

  name = "cstv-${var.appname}-${var.env}-${var.additionalcontext}-prediction"
  kind = "CustomVision.Prediction"

  appid               = var.appid
  appname             = var.appname
  resourcetype        = "cstv"
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
      name               = "pe_cstv_${var.appname}_${var.env}_${var.additionalcontext}"
      subnet_resource_id = "sample_subnet_id"
    }
  }
}
