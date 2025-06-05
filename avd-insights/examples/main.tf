# This is the module that creates the avd insights data collection rule
module "dcr" {
  source           = "../"
  avd_dcr_insights = var.avd_dcr_insights
  app_id           = var.app_id
  msftmigration    = var.msftmigration
  environment      = var.environment
}

# Virtual Machine Extension for AMA agent
resource "azurerm_virtual_machine_extension" "ama" {
  for_each = var.avd_dcr_insights

  name                      = each.value.vm_extension_name
  publisher                 = each.value.vm_extension_publisher
  type                      = each.value.vm_extension_type
  type_handler_version      = each.value.vm_extension_type_version
  virtual_machine_id        = each.value.vm_id
  automatic_upgrade_enabled = each.value.vm_extension_auto_upgrade_enabled

  depends_on = [module.dcr]
}

locals {
  resource_ids = module.dcr.resource_id
}

# Creates an association between an Azure Monitor data collection rule and a virtual machine.
resource "azurerm_monitor_data_collection_rule_association" "example" {
  for_each = var.avd_dcr_insights

  target_resource_id      = each.value.vm_id
  data_collection_rule_id = local.resource_ids[each.key]
  name                    = each.value.vm_association_name
}