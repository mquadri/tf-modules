module "aks" {
  source              = "github.com/CenturyLink/tf-modules-azure//aks?ref=1.0.22"
  appid               = var.appid
  appname             = var.appname
  resourcetype        = "aks"
  costAppOwnerManager = var.costAppOwnerManager
  costAppOwnerTech    = var.costAppOwnerTech
  costBudgetOwner     = var.costBudgetOwner
  costCostCenter      = var.costCostCenter
  costDivision        = var.costDivision
  costVP              = var.costVP
  env                 = var.env
  costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  costbaseline        = var.costbaseline #(year resource created)
  location            = var.location
  additionalcontext   = var.additionalcontext
  #aks
  kubernetes_version            = var.kubernetes_version
  resource_group_name           = module.resource-group-aks.name
  vnet_subnet_id                = var.vnet_subnet_id
  tenant_id                     = var.tenant_id
  default_node_pool             = var.default_node_pool
  default_node_pool_zones       = var.default_node_pool_zones
  default_node_pool_node_taints = var.default_node_pool_node_taints
  network_profile               = var.network_profile
  upgrade_settings              = var.upgrade_settings
  automatic_channel_upgrade     = var.automatic_channel_upgrade
  private_dns_zone_id           = var.private_dns_zone_id
  aks_vnet_name                 = var.aks_vnet_name
  aks_vnet_subnet_name          = var.aks_vnet_subnet_name
  network_resource_group_name   = var.network_resource_group_name
  aks_private_dns_name          = var.aks_private_dns_name
  additional_node_pools         = var.additional_node_pools
  admin_group_object_ids        = var.admin_group_object_ids
}