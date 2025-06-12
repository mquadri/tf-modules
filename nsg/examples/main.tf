module "nsg" {
  source              = "../"
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  diagnostic_settings = var.diagnostic_settings
  enable_telemetry    = var.enable_telemetry
  lock                = var.lock
  role_assignments    = var.role_assignments
  security_rules      = var.security_rules
  tags                = var.tags
  app_id              = var.app_id
  msftmigration       = var.msftmigration
  environment         = var.environment
  timeouts            = var.timeouts
}