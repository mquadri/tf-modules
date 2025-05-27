# tflint-ignore: terraform_unused_declarations
data "azurerm_virtual_hub_connection" "example" {
  name                = "vhub-hub-shared-cus-01"
  resource_group_name = "rg-hub-prod-cus-01"
  provider            = azurerm.network-hub
}