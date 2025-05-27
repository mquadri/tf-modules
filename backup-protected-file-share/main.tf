data "azurerm_storage_account" "this" {
  for_each            = var.file_shares
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_backup_policy_file_share" "this" {
  for_each            = var.file_shares
  name                = each.value.backup_policy_name
  resource_group_name = each.value.resource_group_name
  recovery_vault_name = each.value.recovery_vault_name
}

resource "azurerm_backup_protected_file_share" "this" {
  for_each                  = var.file_shares
  resource_group_name       = each.value.resource_group_name
  recovery_vault_name       = each.value.recovery_vault_name
  source_file_share_name    = each.value.source_file_share_name
  source_storage_account_id = data.azurerm_storage_account.this[each.key].id
  backup_policy_id          = data.azurerm_backup_policy_file_share.this[each.key].id
}
