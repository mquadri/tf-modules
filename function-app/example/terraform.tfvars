
subscriptionId            = "6a6dc038-8ea9-4a9e-9adc-93d7947cbe9d"
resourceGroupName         = "rg-dlhfinance-dev-01"
location                  = "eastus2"
malName                   = "dlhfinance"
appid                     = "SYSGEN788087903"
appnameStorage            = "steelthread" # application name for storage account (tags)
costAppOwnerManager       = "Idilio Moncivais"
costAppOwnerTech          = "Jim O'Keefe"
costBudgetOwner           = "Jayshree.Ganesh@lumen.com"
costCostCenter            = "K1005002"
costDivision              = "Finance"
costVP                    = "William Marcinko"
env                       = "dev"
costAllocation            = "chargeback"
appFunction               = "steelthread"
monthlyBudget             = "6000"
costbaseline              = "2024"
additionalcontext         = "01"
storageAccountName        = "sastahndlhfinancedev01"
functionAppRuntime        = "java"
functionAppRuntimeVersion = 17
functionAppAccessADgroup  = "azad.rg.dlhfinancedev.contributor"
server_farm_body = {
  kind = "functionapp"
  sku = {
    name = "FC1"
    tier = "FlexConsumption"
  }
  properties = {
    reserved = true
  }
}
msftmigration = "no"