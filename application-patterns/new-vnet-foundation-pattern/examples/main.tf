module "rg-acp-prod-eus2-01" {
  source                  = "../"
  network_resource_groups = var.network_resource_groups
  # providers = {
  #   azurerm = azurerm.main
  # }
}

module "vnet-nets-platform-prod-eus2-02" {
  source              = "../"
  prod_network_deploy = var.prod_network_deploy
  depends_on          = [module.rg-acp-prod-eus2-01]
}


module "rg-ls-eus2-01" {
  source                      = "../"
  application_resource_groups = var.application_resource_groups
  # providers = {
  #   azurerm = azurerm.main
  # }
}

module "vnet-ls-test-eus2-02" {
  source                   = "../"
  liftshift_network_deploy = var.liftshift_network_deploy
  depends_on               = [module.rg-ls-eus2-01]
}


module "nsg-subnet-association" {
  source          = "../"
  nsg_association = var.nsg_association
  depends_on      = [module.vnet-nets-platform-prod-eus2-02, module.vnet-ls-test-eus2-02]
}
