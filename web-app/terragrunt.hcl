locals {}

inputs = {
  appid               = "SYSGEN788213322"
  appname             = "example-asp"
  env                 = "dev"
  costCostCenter      = "S0019984"
  costVP              = "Aaron Hastings"
  costAppOwnerTech    = "Daniel Bohachick"
  costAppOwnerManager = "Nels Thompson"
  costBudgetOwner     = "Bryan Thompson"
  costDivision        = "OPERATIONS STRATEGY & TRANSFORMATION"
  appFunction         = "dlh-eo"
  costbaseline        = "2024"
  costAllocation      = "chargeback"
  monthlyBudget       = "5000"
  additionalcontext   = "01"
  location            = "eastus2"

  subscription_id = "00000000-0000-0000-0000-000000000000"

  resource_group_name = "rg-app-exmaple-infra-dev-01"
  # location                 = "eastus2"
  os_type                  = "Linux"
  service_plan_resource_id = "sample-app-service-plan-resource_id"
}
