locals {}

inputs = {
server_version       = "12.0"
location             = "Central US"
resource_group_name  = "poc-test-rg"
azuread_administrator = {
  azuread_authentication_only = true
  login_username              = "sqladmin"
  object_id                   = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  tenant_id                   = ""
}
databases = {
  db01 = {
    name     = "new-db"
    sku_name = "Basic"
  }
}
name = "sql-server-test"
private_endpoints = {
  "pe01" = {
    subnet_resource_id = "/subscriptions/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/resourceGroups/post-rg/providers/Microsoft.Network/virtualNetworks/vm-test-vnet/subnets/new"

  }
}

additionalcontext   = "01"
appid               = "t0000000"
appname             = "newapp"
env                 = "dev"
costAppOwnerTech    = "new"
costAppOwnerManager = "manager"
costBudgetOwner     = "owner"
costbaseline        = "baseline"
resourcetype        = "resource"
costDivision        = ""
costAllocation      = ""
appFunction         = "function"
monthlyBudget       = ""
costCostCenter      = ""
costVP              = ""
tags = {
  msftmigration = "yes"
  app_id        = "SYSGENXXXXXXX"
  environment   = "PROD"
}


}
