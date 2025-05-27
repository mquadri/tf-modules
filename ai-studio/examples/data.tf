# DNS Zones for AI Foundry Hub (AI Studio)
data "azurerm_private_dns_zone" "api_azureml" {
  provider            = azurerm.management
  name                = "privatelink.api.azureml.ms"
  resource_group_name = var.private_dns_rg
}

data "azurerm_private_dns_zone" "notebooks_azure" {
  provider            = azurerm.management
  name                = "privatelink.notebooks.azure.net"
  resource_group_name = var.private_dns_rg
}