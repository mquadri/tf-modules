resource "azurerm_virtual_machine_extension" "vm-extension" {
  for_each                    = var.extensions
  name                        = each.value.name
  virtual_machine_id          = each.value.virtual_machine_id
  publisher                   = each.value.publisher
  type                        = each.value.type
  type_handler_version        = each.value.type_handler_version
  auto_upgrade_minor_version  = each.value.auto_upgrade_minor_version
  automatic_upgrade_enabled   = each.value.automatic_upgrade_enabled
  settings                    = each.value.settings
  failure_suppression_enabled = each.value.failure_suppression_enabled
  protected_settings          = each.value.protected_settings
  provision_after_extensions  = each.value.provision_after_extensions
  tags                        = each.value.tags
}
