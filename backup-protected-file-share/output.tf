output "protected_file_share_ids" {
  description = "A map of IDs for all protected file shares."
  value = {
    for key, share in azurerm_backup_protected_file_share.this : key => share.id
  }
}