module "content_safety" {
  source = "../../content-safety"
  providers = {
    azurerm = azurerm.main
  }

  appid         = var.appid
  msftmigration = var.msftmigration
  environment   = var.environment
  app_id        = var.app_id
  appname       = var.appname
  env           = var.env

  location          = var.location
  additionalcontext = var.additionalcontext

  resource_group_name = "rg-sample-01"
  sku_name            = "S0"

  public_network_access_enabled = false
  private_endpoints = {
    pe1 = {
      name               = "pe_cs_${var.appname}_${var.env}_${var.additionalcontext}"
      subnet_resource_id = "sample_subnet_id"
    }
  }
}
