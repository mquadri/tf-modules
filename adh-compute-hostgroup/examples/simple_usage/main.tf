# Example main.tf for adh-compute-hostgroup module

module "test_adh_hostgroup" { # Renamed module instance for clarity
  source = "../../"           # Corrected path assuming simple_usage is one level down from module root

  # Pass mandatory tags directly
  app_id        = var.app_id
  environment   = var.environment
  msftmigration = var.msftmigration
  mal_id        = var.mal_id

  # Pass additional custom tags via the 'tags' variable
  tags = var.tags

  # Module specific variables
  dedicated_host_group_name   = var.dedicated_host_group_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  platform_fault_domain_count = var.platform_fault_domain_count
  automatic_placement_enabled = var.automatic_placement_enabled
  zone                        = var.zone
  enable_telemetry            = var.enable_telemetry # This is a variable of the AVM module
  dedicated_hosts             = var.dedicated_hosts
}