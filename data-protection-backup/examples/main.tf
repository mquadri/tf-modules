module "data_protection_backup_vault" {
  source                            = "../"
  backup_vault_config               = var.backup_vault_config
  blob_storage_backup_policy_config = var.vault_policies
  app_id                            = var.app_id
  msftmigration                     = var.msftmigration
  environment                       = var.environment
}
