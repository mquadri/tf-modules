variable "file_shares" {
  description = "A map of file shares to be protected"
  type = map(object({
    resource_group_name    = string
    recovery_vault_name    = string
    source_file_share_name = string
    storage_account_name   = string
    backup_policy_name     = string
  }))
}
