data "azurerm_storage_account" "this" {
  for_each            = var.storage_accounts
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_backup_container_storage_account" "this" {
  for_each            = var.storage_accounts
  resource_group_name = each.value.resource_group_name
  recovery_vault_name = each.value.recovery_vault_name
  storage_account_id  = data.azurerm_storage_account.this[each.key].id
}
