module "example" {
  source = "github.com/CenturyLink/tf-modules-azure//subscriptions?ref=2.3.0"

  costRegion            = "nortcentralus"
  location              = "nortcentralus"
  resourcetype          = "sub"
  appid                 = "SYSGEN2843268158"
  appname               = "exmaple-infra"
  env                   = "dev"
  costCostCenter        = "H427708790"
  costVP                = "Elsie Mendez"
  costAppOwnerTech      = "Corey Cobb"
  costAppOwnerManager   = "Hilda Daniel"
  costBudgetOwner       = "Marcus Holloway"
  subscription_name     = "sub-example-dev-01"
  management_group_name = "mg-us-workloads-poc"
  costDivision          = "SEGMENT ENG & BUS OPS"
  appFunction           = "exmaple general Prod Subscription"
  costbaseline          = "2024"
  costAllocation        = "chargeback"
  monthlyBudget         = "4000"
  additionalcontext     = "01"
}

output "example" {
  description = "The example subscription ID."
  value       = module.example.subscription_id
}
