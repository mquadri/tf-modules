module "avm_res_resources_resourcegroup" {
  count               = var.create_resource_group ? 1 : 0
  source              = "../resource-groups"
  name                = var.resource_group_name
  location            = var.location
  enable_telemetry    = var.enable_telemetry
  lock                = var.lock
  role_assignments    = var.rg_role_assignments
  appid               = var.appid
  appname             = var.appname
  env                 = var.env
  costCostCenter      = var.costCostCenter
  costVP              = var.costVP
  costAppOwnerTech    = var.costAppOwnerTech
  costAppOwnerManager = var.costAppOwnerManager
  costBudgetOwner     = var.costBudgetOwner
  costbaseline        = var.costbaseline
  resourcetype        = var.resourcetype
  costDivision        = var.costDivision
  costAllocation      = var.costAllocation
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  additionalcontext   = var.additionalcontext
  managed_by          = var.managed_by
  migration           = var.msftmigration
  environment         = var.environment
  app_id              = var.app_id
}


module "avm-res-managedidentity-userassignedidentity" {
  for_each            = var.managed_identity
  source              = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
  version             = "0.3.3"
  location            = each.value.managed_identity_location
  resource_group_name = each.value.managed_identity_resource_group_name
  name                = each.value.user_managed_identity_name
  lock                = each.value.lock
  enable_telemetry    = each.value.enable_telemetry
  tags                = local.tags[each.key]
  depends_on          = [module.avm_res_resources_resourcegroup]
}