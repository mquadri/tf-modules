module "avm-res-netapp-netappaccount" {
  source  = "../"
  anf_netapp = var.anf_netapp
  app_id         = var.app_id
  msftmigration  = var.msftmigration
  environment    = var.environment
}