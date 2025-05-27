

module "create_function_app" {
  source = "../"

  subscriptionId            = var.subscriptionId
  resourceGroupName         = var.resourceGroupName
  location                  = var.location
  malName                   = var.malName
  appid                     = var.appid
  appnameStorage            = var.appnameStorage
  env                       = var.env
  costCostCenter            = var.costCostCenter
  costVP                    = var.costVP
  costAppOwnerTech          = var.costAppOwnerTech
  costAppOwnerManager       = var.costAppOwnerManager
  costBudgetOwner           = var.costBudgetOwner
  additionalcontext         = var.additionalcontext
  costDivision              = var.costDivision
  costAllocation            = var.costAllocation
  appFunction               = var.appFunction
  monthlyBudget             = var.monthlyBudget
  costbaseline              = var.costbaseline
  storageAccountName        = var.storageAccountName
  functionAppRuntime        = var.functionAppRuntime
  functionAppRuntimeVersion = var.functionAppRuntimeVersion
  functionAppAccessADgroup  = var.functionAppAccessADgroup
  server_farm_body          = var.server_farm_body
  msftmigration             = var.msftmigration
}

output "name" {
  value = module.create_function_app.resource.name
}
output "id" {
  value = module.create_function_app.resource.id
}

output "location" {
  value = module.create_function_app.resource.location
}

output "storage_name" {
  value = module.create_function_app.resource.storage_name
}

output "storage_container_name" {
  value = module.create_function_app.resource.storage_container_name
}

output "log_analytics_name" {
  value = module.create_function_app.resource.log_analytics_name
}

output "app_insight_name" {
  value = module.create_function_app.resource.app_insight_name
}

