# tflint-ignore: terraform_unused_declarations
data "azurerm_private_dns_zone" "kv" {
  provider            = azurerm.management
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.private_dns_rg
}

data "azurerm_private_dns_zone" "aks_centralus" {
  provider            = azurerm.management
  name                = "privatelink.centralus.azmk8s.io"
  resource_group_name = var.private_dns_rg
}

# tflint-ignore: terraform_unused_declarations
data "azurerm_private_dns_zone" "aks_eastus2" {
  provider            = azurerm.management
  name                = "privatelink.eastus2.azmk8s.io"
  resource_group_name = var.private_dns_rg
}