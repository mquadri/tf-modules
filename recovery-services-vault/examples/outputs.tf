###############################
# Azure Backup outputs
###############################
output "recovery_vault_name" {
  description = "Azure Recovery Services Vault name"
  value       = module.recovery_services_vault_setup.recovery_vault_name
}

output "recovery_vault_id" {
  description = "Azure Recovery Services Vault ID"
  value       = module.recovery_services_vault_setup.recovery_vault_id
}