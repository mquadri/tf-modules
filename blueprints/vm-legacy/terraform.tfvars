env                               = "dev"
resource_group_name               = "rg-github-runner-dev-01"
vm_name_token                     = "github-runner"
vm_size                           = "Standard_B1ms"
vm_admin_user                     = "login-account-id"
vm_admin_pwd_keyvault_name        = "keyvault-resource-name"
vm_admin_pwd_keyvault_secret_name = "secret-name"
nic_rg                            = "rg-vnet-github-runner-dev-01"
nic_vnet                          = "vnet-github-runner-dev-centralus-dev-01"
nic_subnet_name                   = "snet-pe-github-runner-dev-01"
nic = { "nic1" = {
  rg                   = "rg-github-runner-dev-01",
  location             = "centralus",
  enable_ip_forwarding = false,
  subnet_id            = "fully qualified subnet_id"
  name                 = "internal",
  private_ip_address   = null,
  primary              = true,
} }
os_disk = {
  caching              = "ReadWrite"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = 100
}
source_image_reference = {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts-gen2"
  version   = "latest"
}
