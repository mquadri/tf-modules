locals {
  # tflint-ignore: terraform_unused_declarations
  naming = "${var.appname}${var.env}"
  mandatory_tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    //costDivision        = var.costDivision
    costRegion = var.costRegion
    //costVP              = var.costVP
    environment      = var.env
    costAllocation   = var.costAllocation #(can only be sharedcosts or chargeback)
    appFunction      = var.appFunction
    monthlyBudget    = var.monthlyBudget
    costbaseline     = var.costbaseline #(year resource created)
    provisioned_by   = "Terraform"
    provisioned_date = timestamp()
  }
}

module "azureworkbook" {
  source              = "../"
  resource_group_name = var.resource_group_name
  data_items          = var.data_items
  data_json_version   = var.data_json_version
  workbook_name       = var.workbook_name
  tags                = merge(local.mandatory_tags, try(var.tags, {}))
  app_id              = var.app_id
  msftmigration       = var.msftmigration
  environment         = var.environment
}
