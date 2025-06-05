module "synapse_workspace" {
  #Naming and Tags
  source              = "../"
  location            = var.location
  resourcetype        = var.resourcetype
  appid               = var.appid
  appname             = var.appname
  env                 = var.env
  costCostCenter      = var.costCostCenter
  costVP              = var.costVP
  costAppOwnerTech    = var.costAppOwnerTech
  costAppOwnerManager = var.costAppOwnerManager
  costBudgetOwner     = var.costBudgetOwner
  additionalcontext   = var.additionalcontext
  costDivision        = var.costDivision
  costAllocation      = var.costAllocation
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  costbaseline        = var.costbaseline

  #Resource Group and Network

  resource_group_name      = var.resource_group_name
  vnet_resource_group_name = var.vnet_resource_group_name
  vnet_name                = var.vnet_name
  pe_subnet_name           = var.pe_subnet_name

  #Synapse Workspace

  administrator_login                  = var.administrator_login
  key_vault_name                       = var.key_vault_name
  key_vault_resource_group_name        = var.key_vault_resource_group_name
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id

  #Synapse SQL Dedicated Pool

  syndp_sku_name             = var.syndp_sku_name
  syndp_storage_account_type = var.syndp_storage_account_type

  #Private DNS Zones

  private_dns_dev_zone_name = var.private_dns_dev_zone_name
  private_dns_sql_zone_name = var.private_dns_sql_zone_name
  private_dns_web_zone_name = var.private_dns_web_zone_name
  private_dns_rg            = var.private_dns_rg
}