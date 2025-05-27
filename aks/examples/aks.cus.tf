
module "aks" {
  source = "github.com/CenturyLink/tf-modules-azure//aks?ref=2.9.0"

  providers = {
    azurerm = azurerm.main
    azapi   = azapi.main
  }

  appid                         = local.pe_tags.appid
  appname                       = "shared-wklds"
  resourcetype                  = "aks"
  costAppOwnerManager           = local.pe_tags.costAppOwnerManager
  costAppOwnerTech              = local.pe_tags.costAppOwnerTech
  costBudgetOwner               = local.pe_tags.costBudgetOwner
  costCostCenter                = local.pe_tags.costAppOwnerManager
  costDivision                  = local.pe_tags.costDivision
  costVP                        = local.pe_tags.costVP
  env                           = local.pe_tags.env
  costAllocation                = local.pe_tags.costAllocation
  appFunction                   = local.pe_tags.appFunction
  monthlyBudget                 = local.pe_tags.monthlyBudget
  costbaseline                  = "2024"
  location                      = "centralus"
  additionalcontext             = "01"
  resource_group_name           = data.terraform_remote_state.subscription_config.outputs.resource-group_aks.name
  vnet_subnet_id                = data.terraform_remote_state.networking.outputs.enablement_shared_subnet_aks.id
  kubernetes_version            = var.kubernetes_version
  tenant_id                     = var.tenant_id
  default_node_pool             = null
  default_node_pool_zones       = var.default_node_pool_zones
  default_node_pool_node_taints = null
  network_profile               = local.network_profile_load_balancer
  private_dns_zone_id           = data.azurerm_private_dns_zone.aks_centralus.id
  aks_vnet_name                 = data.terraform_remote_state.networking.outputs.enablement_shared_vnet.vnet_name
  aks_vnet_subnet_name          = data.terraform_remote_state.networking.outputs.enablement_shared_subnet_aks.name
  network_resource_group_name   = data.terraform_remote_state.subscription_config.outputs.resource-group_vnet.name
  additional_node_pools         = var.additional_node_pools
  admin_group_object_ids        = var.admin_group_object_ids
  subscription_id               = data.terraform_remote_state.subscriptions.outputs.sub_example_env_nn_subscription_id
  key_vault_secrets_provider = {
    secret_rotation_enabled = true
  }
}