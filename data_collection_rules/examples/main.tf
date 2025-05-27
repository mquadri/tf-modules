locals {
  tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    //costDivision        = var.costDivision
    costRegion = var.location
    //costVP              = var.costVP
    costAllocation   = var.costAllocation #(can only be sharedcosts or chargeback)
    appFunction      = var.appFunction
    monthlyBudget    = var.monthlyBudget
    costbaseline     = var.costbaseline #(year resource created)
    provisioned_by   = "Terraform"
    provisioned_date = timestamp()
    app_id         = var.app_id
    msftmigration  = var.msftmigration
    environment    = var.environment
  }
}
module "data_collection_rules" {
  source                       = "../"
  datacollection_endpoint      = var.datacollection_endpoint
  monitor_data_collection_rule = var.monitor_data_collection_rule
  data_sources                 = var.data_sources
  resource_group_name          = var.resource_group_name
  tags                         = local.tags
  dcr_association              = var.dcr_association
}
