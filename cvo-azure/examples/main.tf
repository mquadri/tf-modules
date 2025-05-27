module "cvo" {
  source = "../"

  cvo_instances             = var.cvo_instances
  secret_name_refresh_token = var.secret_name_refresh_token
  secret_name_svm           = var.secret_name_svm
  secret_name_client        = var.secret_name_client
  secret_name_workspace     = var.secret_name_workspace
  secret_name_saas          = var.secret_name_saas
  secret_name_nss           = var.secret_name_nss
  keyvault_name             = var.keyvault_name
  keyvault_rg               = var.keyvault_rg
  secret_subscription_id    = var.secret_subscription_id
}