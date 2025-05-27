output "protected_file_share_ids" {
  description = "A map of IDs for all protected file shares."
  value       = module.backup_file_shares.protected_file_share_ids
}