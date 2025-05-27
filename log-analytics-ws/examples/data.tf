data "azurerm_storage_account" "analytics_storage_account" {
  name                = var.storage_account_name
  resource_group_name = var.storage_account_rg_name
}