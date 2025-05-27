resource "azurerm_management_lock" "lock" {
  name       = var.name
  scope      = var.scope
  lock_level = var.lock_level
  notes      = var.notes
}