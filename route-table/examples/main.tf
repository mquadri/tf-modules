module "example-route-table" {
  source                        = "../"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  name                          = var.name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  enable_telemetry              = var.enable_telemetry
  lock                          = var.lock
  role_assignments              = var.role_assignments
  routes                        = var.routes
  subnet                        = var.subnet
  tags                          = var.tags
  app_id                        = var.app_id
  environment                   = var.environment
  msftmigration                 = var.msftmigration
}