module "ai_studio" {
  source = "../"

  appid               = var.appid
  appname             = var.appname
  resourcetype        = var.resourcetype
  costAppOwnerManager = var.costAppOwnerManager
  costAppOwnerTech    = var.costAppOwnerTech
  costBudgetOwner     = var.costBudgetOwner
  costCostCenter      = var.costCostCenter
  costDivision        = var.costDivision
  location            = var.location
  costVP              = var.costVP
  env                 = var.env
  costAllocation      = var.costAllocation
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  costbaseline        = var.costbaseline
  additionalcontext   = var.additionalcontext

  resource_group_name = var.resource_group_name
  key_vault_name      = var.key_vault_name
  key_vault_rg_name   = var.key_vault_rg_name
  storage_account_id  = var.storage_account_id
  sku_name            = var.sku

  public_network_access_enabled = false
  enable_private_endpoint       = true
  private_endpoints = {
    pe_bot_endpoint = {
      name                        = "pe_ais_hub_example_dev_01"
      is_manual_connection        = false
      subresource_names           = ["amlworkspace"]
      private_dns_zone_group_name = "syn-ais-hub-example_dev_01"
      private_dns_zone_ids        = [data.azurerm_private_dns_zone.api_azureml.id, data.azurerm_private_dns_zone.notebooks_azure.id]
    }
  }
  create_dns_zone = false

  subscription_id      = var.subscription_id
  virtual_network_rg   = data.azurerm_resource_group.rg_vnet.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  pe_subnet_name       = data.azurerm_subnet.private_endpoint.name

  providers = {
    azurerm = azurerm.main
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "api_azureml" {
  provider              = azurerm.management
  name                  = "vnet-link-api-azureml-ais-hub-${var.appname}-${var.env}-${var.additionalcontext}"
  resource_group_name   = data.azurerm_private_dns_zone.api_azureml.resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.api_azureml.name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "notebooks_azure" {
  provider              = azurerm.management
  name                  = "vnet-link-notebooks-ais-hub-${var.appname}-${var.env}-${var.additionalcontext}"
  resource_group_name   = data.azurerm_private_dns_zone.notebooks_azure.resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.notebooks_azure.name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
}
