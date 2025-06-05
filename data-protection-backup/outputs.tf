output "vault_id" {
  description = "ID of the data protection backup vault"
  value       = azurerm_data_protection_backup_vault.vault1.id
}

output "backup_policies" {
  description = "Ids of all backup policies created for a backup vault"
  value = {
    for k, v in azurerm_data_protection_backup_policy_blob_storage.blob_storage_backup_policy :
    k => {
      id = v.id
    }
  }
}
