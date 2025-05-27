module "example-action_group" {
  source            = "../"
  key_vault_name    = var.key_vault_name
  action_groups     = var.action_groups
  key_vault_rg_name = var.key_vault_rg_name
  app_id            = var.app_id
  msftmigration     = var.msftmigration
  environment       = var.environment
}