module "lock" {
  source     = "../"
  name       = var.name
  scope      = var.scope
  lock_level = var.lock_level
  notes      = var.notes
}