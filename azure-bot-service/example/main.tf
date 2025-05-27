module "azure_bot_service" {
  source = "../"

  name                = "bot-${local.naming}"
  location            = var.location
  microsoft_app_id    = var.microsoft_app_id
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  appid               = var.appid
  appname             = var.appname
  resourcetype        = var.resourcetype
  costAppOwnerManager = var.costAppOwnerManager
  costAppOwnerTech    = var.costAppOwnerTech
  costBudgetOwner     = var.costBudgetOwner
  costCostCenter      = var.costCostCenter
  costDivision        = var.costDivision
  costVP              = var.costVP
  costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  costbaseline        = var.costbaseline #(year resource created)
  additionalcontext   = var.additionalcontext
  env                 = var.env
  tags                = local.tags

  domain_name = "bot-${var.appname}-${var.env}-${var.additionalcontext}"

  public_network_access_enabled = false
  enable_private_endpoint       = true
  private_endpoints = {
    pe_bot_endpoint = {
      name                        = "pe_bot_${var.appname}_${var.env}_${var.additionalcontext}"
      is_manual_connection        = false
      subresource_names           = ["bot"]
      private_dns_zone_group_name = "syn-bot-${var.appname}-${var.env}-${var.additionalcontext}"
      private_dns_zone_ids        = [data.azurerm_private_dns_zone.bot.id]
    }
    pe_token_endpoint = {
      name                        = "pe_bot_token_${var.appname}_${var.env}_${var.additionalcontext}"
      is_manual_connection        = false
      subresource_names           = ["token"]
      private_dns_zone_group_name = "syn-bot-token-${var.appname}-${var.env}_${var.additionalcontext}"
      private_dns_zone_ids        = [data.azurerm_private_dns_zone.bot.id]
    }
  }
  subscription_id      = "00000000-0000-0000-0000-000000000000"
  virtual_network_rg   = data.azurerm_resource_group.rg_vnet.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  pe_subnet_name       = data.azurerm_subnet.private_endpoint.name
  dns_zone_id          = data.azurerm_private_dns_zone.bot.id
  create_dns_zone      = false
}
