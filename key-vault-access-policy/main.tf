resource "azurerm_key_vault_access_policy" "keyvaultpermissions" {
  key_vault_id            = var.key_vault_id
  application_id          = var.application_id
  object_id               = var.object_id
  tenant_id               = var.tenant_id
  certificate_permissions = var.certificate_permissions
  key_permissions         = var.key_permissions
  secret_permissions      = var.secret_permissions
  storage_permissions     = var.storage_permissions
}
