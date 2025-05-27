module "network_connection_monitor" {
  source                          = "../"
  network_connection_monitor_name = var.network_connection_monitor_name
  location                        = var.location
  network_watcher_id              = var.network_watcher_id
  notes                           = var.notes
  output_workspace_resource_ids   = var.output_workspace_resource_ids
  msftmigration                   = var.msftmigration
  environment                     = var.environment
  app_id                          = var.app_id
  tags                            = local.tags

  source_endpoint_name                  = var.source_endpoint_name
  source_endpoint_address               = var.source_endpoint_address
  source_endpoint_coverage_level        = var.source_endpoint_coverage_level
  source_endpoint_excluded_ip_addresses = var.source_endpoint_excluded_ip_addresses
  source_endpoint_included_ip_addresses = var.source_endpoint_included_ip_addresses
  source_endpoint_target_resource_id    = var.source_endpoint_target_resource_id
  source_endpoint_target_resource_type  = var.source_endpoint_target_resource_type

  destination_endpoint_name                  = var.destination_endpoint_name
  destination_endpoint_address               = var.destination_endpoint_address
  destination_endpoint_coverage_level        = var.destination_endpoint_coverage_level
  destination_endpoint_excluded_ip_addresses = var.destination_endpoint_excluded_ip_addresses
  destination_endpoint_included_ip_addresses = var.destination_endpoint_included_ip_addresses
  destination_endpoint_target_resource_id    = var.destination_endpoint_target_resource_id
  destination_endpoint_target_resource_type  = var.destination_endpoint_target_resource_type

  test_configurations = var.test_configurations

  test_groups = var.test_groups
}