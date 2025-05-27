
module "network_connection_monitor_http" {
  source = "../"

  network_connection_monitor_name = var.network_connection_monitor_name_http
  location                        = var.location_http
  network_watcher_id              = var.network_watcher_id_http
  notes                           = var.notes_http
  output_workspace_resource_ids   = var.output_workspace_resource_ids_http
  msftmigration                   = var.msftmigration
  environment                     = var.environment
  app_id                          = var.app_id
  tags                            = local.tags

  source_endpoint_name                  = var.source_endpoint_name_http
  source_endpoint_address               = var.source_endpoint_address_http
  source_endpoint_coverage_level        = var.source_endpoint_coverage_level_http
  source_endpoint_excluded_ip_addresses = var.source_endpoint_excluded_ip_addresses_http
  source_endpoint_included_ip_addresses = var.source_endpoint_included_ip_addresses_http
  source_endpoint_target_resource_id    = var.source_endpoint_target_resource_id_http
  source_endpoint_target_resource_type  = var.source_endpoint_target_resource_type_http

  destination_endpoint_name                  = var.destination_endpoint_name_http
  destination_endpoint_address               = var.destination_endpoint_address_http
  destination_endpoint_coverage_level        = var.destination_endpoint_coverage_level_http
  destination_endpoint_excluded_ip_addresses = var.destination_endpoint_excluded_ip_addresses_http
  destination_endpoint_included_ip_addresses = var.destination_endpoint_included_ip_addresses_http
  destination_endpoint_target_resource_id    = var.destination_endpoint_target_resource_id_http
  destination_endpoint_target_resource_type  = var.destination_endpoint_target_resource_type_http

  test_configurations = var.test_configurations_http

  test_groups = var.test_groups_http
}