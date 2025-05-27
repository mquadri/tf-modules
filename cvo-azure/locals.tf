locals {
  refresh_token = data.azurerm_key_vault_secret.refresh_token.value
}