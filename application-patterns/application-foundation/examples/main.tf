module "app-foundation-ptn" {
  source           = "../"
  location         = var.location
  app_id           = var.app_id
  environment      = var.environment
  appname          = var.appname
  env              = var.env
  msftmigration    = var.msftmigration
  nsg_config       = var.nsg_config
  law_config       = var.law_config
  key_vault_config = var.key_vault_config
}
