module "waf_policy" {
  source       = "../"
  waf_policies = var.waf_policies
  environment           = var.environment
  app_id                = var.app_id
  msftmigration         = var.msftmigration
}