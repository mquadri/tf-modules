variable "storage_accounts" {
  description = "A map of storage accounts to register with the Recovery Services Vault"
  type = map(object({
    resource_group_name  = string
    recovery_vault_name  = string
    storage_account_name = string
  }))
}
