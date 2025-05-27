output "registered_backup_containers" {
  description = "A map of registered backup containers"
  value = {
    for key, container in azurerm_backup_container_storage_account.this :
    key => {
      id                  = container.id
      resource_group_name = var.storage_accounts[key].resource_group_name
      recovery_vault_name = var.storage_accounts[key].recovery_vault_name
    }
  }
}
