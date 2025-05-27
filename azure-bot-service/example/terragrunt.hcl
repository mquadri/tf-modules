generate "provider" {
  path      = "azurerm_provider.tf"
  if_exists = "skip"
  contents  = <<EOF
  EOF
}



terraform {
  extra_arguments "vars" {
    commands = ["apply", "plan", "destroy"]
    arguments = [
      "-var", "name=bot-whateveryouwant-but-works",
      "-var", "location=northcentralus",
      "-var", "resourcetype=ais",
      "-var", "appid=SYSGEN2843268158",
      "-var", "appname=example-infra",
      "-var", "env=test",
      "-var", "costCostCenter=H427708790",
      "-var", "costVP=Elsie Mendez",
      "-var", "costAppOwnerTech=Corey Cobb",
      "-var", "costAppOwnerManager=Hilda Daniel",
      "-var", "costBudgetOwner=Marcus Holloway",
      "-var", "costDivision=IT & ENGINEERING",
      "-var", "appFunction=example general Prod Subscription",
      "-var", "costbaseline=2024",
      "-var", "costAllocation=sharedcost",
      "-var", "monthlyBudget=1000",
      "-var", "additionalcontext=01",
      "-var", "resource_group_name=rg-ais-sample-01",
      "-var", "key_vault_name=kv-ais-sample-01",
      "-var", "key_vault_rg_name=rg-kv-ais-sample-01",
      "-var", "storage_account_id=storage_account_id",
      "-var", "sku=F0",
      "-var", "microsoft_app_id=fe7b287b-eefe-41e6-a4ac-178c1c35c152"
    ]
  }
}