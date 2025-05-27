# Resource groups

module "resourcegroup" {
  source              = "../"
  name                = var.name
  location            = var.location
  enable_telemetry    = var.enable_telemetry
  lock                = var.lock
  role_assignments    = var.role_assignments
  appname             = var.appname
  env                 = var.env
  environment         = var.environment
  app_id              = var.app_id
  costCostCenter      = var.costCostCenter
  costVP              = var.costVP
  costAppOwnerTech    = var.costAppOwnerTech
  msftmigration       = var.msftmigration
  costAppOwnerManager = var.costAppOwnerManager
  costBudgetOwner     = var.costBudgetOwner
  costbaseline        = var.costbaseline
  resourcetype        = var.resourcetype
  monthlyBudget       = var.monthlyBudget
  additionalcontext   = var.additionalcontext
  migration           = var.migration
}
