module "vm_pattern" {
  source                     = "../"
  vm_admin_pwd_keyvault_name = var.vm_admin_pwd_keyvault_name
  machine_creds_akv_rg       = var.machine_creds_akv_rg
  location                   = var.location
  vm_config                  = var.vm_config
}