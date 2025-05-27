###############################
# Azure Backup outputs
###############################
output "recovery_vault_name" {
  description = "Azure Recovery Services Vault name"
  value       = azurerm_recovery_services_vault.vault.name
}

output "recovery_vault_id" {
  description = "Azure Recovery Services Vault ID"
  value       = azurerm_recovery_services_vault.vault.id
}

output "vm_backup_policy" {
  description = "The IDs of the VM Backup Policies"
  value       = { for k, v in azurerm_backup_policy_vm.vm_backup_policy : k => v.id }
}

output "vm_backup_policy_names" {
  description = "The names of the VM Backup Policies"
  value       = { for k, v in azurerm_backup_policy_vm.vm_backup_policy : k => v.name }
}

output "vm_backup_policy_resource_group_names" {
  description = "The resource group names of the VM Backup Policies"
  value       = { for k, v in azurerm_backup_policy_vm.vm_backup_policy : k => v.resource_group_name }
}

output "vm_backup_policy_recovery_vault_names" {
  description = "The recovery vault names of the VM Backup Policies"
  value       = { for k, v in azurerm_backup_policy_vm.vm_backup_policy : k => v.recovery_vault_name }
}

output "vm_backup_policy_policy_types" {
  description = "The policy types of the VM Backup Policies"
  value       = { for k, v in azurerm_backup_policy_vm.vm_backup_policy : k => v.policy_type }
}

output "vm_backup_policy_timezones" {
  description = "The timezones of the VM Backup Policies"
  value       = { for k, v in azurerm_backup_policy_vm.vm_backup_policy : k => v.timezone }
}

output "vm_backup_policy_instant_restore_retention_days" {
  description = "The instant restore retention days of the VM Backup Policies"
  value       = { for k, v in azurerm_backup_policy_vm.vm_backup_policy : k => v.instant_restore_retention_days }
}