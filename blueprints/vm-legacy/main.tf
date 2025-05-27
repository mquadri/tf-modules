module "vm" {
  source = "github.com/CenturyLink/tf-modules-azure//vm?ref=1.3.0"
  #source = "../../../../tf-modules-azure/vm"

  env                               = var.env
  resource_group_name               = var.resource_group_name
  vm_name_token                     = var.vm_name_token
  vm_name                           = var.vm_name
  incr                              = var.incr
  vm_size                           = var.vm_size
  vm_admin_user                     = var.vm_admin_user
  vm_admin_pwd_keyvault_rg          = var.vm_admin_pwd_keyvault_rg
  vm_admin_pwd_keyvault_name        = var.vm_admin_pwd_keyvault_name
  vm_admin_pwd_keyvault_secret_name = var.vm_admin_pwd_keyvault_secret_name
  nic                               = var.nic
  os_disk                           = var.os_disk
  source_image_reference            = var.source_image_reference

  providers = {
    azurerm = azurerm.main
  }
}
