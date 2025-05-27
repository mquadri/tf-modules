locals {
  pe_tags = {
    appid               = "SYSGEN123456789"
    env                 = "prod"
    costCostCenter      = "S0023456"
    costVP              = "Jane Doe"
    costAppOwnerTech    = "John Smith"
    costAppOwnerManager = "Alice Johnson"
    costBudgetOwner     = "Alice Johnson"
    costDivision        = "RESEARCH & DEVELOPMENT"
    appFunction         = "core aks svcs"
    costbaseline        = "2025"
    costAllocation      = "projectcosts"
    additionalcontext   = "02"
    monthlyBudget       = "4500"
  }
  hca_tags = {
    appid                 = "SYSGEN987654321"
    appname               = "innovation-hub"
    env                   = "dev"
    costCostCenter        = "H1234000"
    costVP                = "Carlos Ruiz"
    costAppOwnerTech      = "Maria Lopez"
    costAppOwnerManager   = "Luis Fernandez"
    costBudgetOwner       = "Luis Fernandez"
    management_group_name = "mg-us-workloads-dev"
    costDivision          = "RESEARCH & DEVELOPMENT"
    appFunction           = "INNOVATION HUB RESOURCES"
    application_name      = "innovation-hub"
    costbaseline          = "2025"
    costAllocation        = "projectcost"
    monthlyBudget         = "2000"
  }
}