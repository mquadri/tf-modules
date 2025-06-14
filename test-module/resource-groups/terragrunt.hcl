
include "root" {
  path = find_in_parent_folders()
}

locals {}

terraform {
  source  = "git@github.com:CenturyLink/tf-modules-azure.git//resource-groups?ref=2.16.0"

}

inputs = {
  enable_telemetry    = false
  name                = "rg-test"
  appid               = "00000000-0000-0"
  appname             = "new-app"
  env                 = "dev"
  costCostCenter      = "123"
  costVP              = "356"
  costAppOwnerTech    = "new"
  costAppOwnerManager = "manager"
  costBudgetOwner     = "owner"
  costbaseline        = "baseline"
  resourcetype        = "resource"
  costDivision        = "1363"
  costAllocation      = "1234"
  appFunction         = "function"
  monthlyBudget       = "123456"
  additionalcontext   = "01"
  managed_by          = "own"
  location            = "centralus"
}
