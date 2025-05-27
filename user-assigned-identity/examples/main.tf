##### User managed identity #####
module "user_managed_identity_setup" {
  source                = "../"
  location              = var.location
  resource_group_name   = var.resource_group_name
  managed_identity      = var.managed_identity
  rg_role_assignments   = var.rg_role_assignments
  create_resource_group = var.create_resource_group
  appid                 = var.appid
  appname               = var.appname
  resourcetype          = var.resourcetype
  costAppOwnerManager   = var.costappownermanager
  costAppOwnerTech      = var.costappownertech
  costBudgetOwner       = var.costbudgetowner
  costCostCenter        = var.costcostcenter
  costDivision          = var.costdivision
  costVP                = var.costvp
  env                   = var.env
  environment           = var.environment
  app_id                = var.app_id
  msftmigration         = var.msftmigration
  costAllocation        = var.costallocation
  appFunction           = var.appfunction
  monthlyBudget         = var.monthlybudget
  costbaseline          = var.costbaseline
  additionalcontext     = var.additionalcontext
  managed_by            = var.managed_by
}