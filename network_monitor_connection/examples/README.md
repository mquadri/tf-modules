# Azure Network Connection Monitor Module

This Terraform module creates and manages an Azure Network Connection Monitor resource using the `azurerm_network_connection_monitor` resource.

## Features

- Define source and destination endpoints for monitoring.
- Configure multiple test configurations dynamically.
- Support for HTTP, ICMP, and TCP protocols in test configurations.
- Define test groups dynamically to group endpoints and test configurations.
- Tagging support for resource management.

## Example

### Module

```
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
```
### tfvars
#### Example tfvars for deploying the Azure Network Connection Monitor module to check connectivity between two Azure VMs using TCP and port 3389
```
# Tags
msftmigration = "kjasbd"
environment   = "dev"
app_id        = "00000000-0000-0000-0000-000000000000"

network_connection_monitor_name = "example-network-connection-monitor_vm_vm"
location                        = "East US"
network_watcher_id              = "/subscriptions/use_yours/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/networkWatchers/NetworkWatcher_eastus2"
notes                           = "Example Network Connection Monitor_vm2vm"
output_workspace_resource_ids   = [
  "/subscriptions/use_yours/resourceGroups/defaultresourcegroup-cus/providers/Microsoft.OperationalInsights/workspaces/defaultworkspace-use_yours-cus"
]

source_endpoint_name                  = "source-endpoint"
source_endpoint_address               = "10.0.2.4"
source_endpoint_coverage_level        = null
source_endpoint_excluded_ip_addresses = []
source_endpoint_included_ip_addresses = []
source_endpoint_target_resource_id    = "/subscriptions/use_yours/resourceGroups/netmon-test2/providers/Microsoft.Compute/virtualMachines/net-mon-test"
source_endpoint_target_resource_type  = "AzureVM"

destination_endpoint_name                  = "destination-endpoint"
destination_endpoint_address               = "192.168.2.4"
destination_endpoint_coverage_level        = null
destination_endpoint_excluded_ip_addresses = []
destination_endpoint_included_ip_addresses = []
destination_endpoint_target_resource_id    = "/subscriptions/use_yours/resourceGroups/netmon-test2/providers/Microsoft.Compute/virtualMachines/net-mon-test02"
destination_endpoint_target_resource_type  = "AzureVM"



test_configurations = {
  tcp_test = {
    name                                        = "vm2vm-test"
    protocol                                    = "Tcp"
    test_frequency_in_seconds                   = 1800
    preferred_ip_version                        = "IPv4"
    success_threshold_checks_failed_percent     = 4
    success_threshold_round_trip_time_ms        = 200
    http_configuration_method                   = ""
    http_configuration_path                     = ""
    http_configuration_port                     = 0
    http_configuration_valid_status_code_ranges = []
    http_configuration_prefer_https             = false
    http_configuration_request_header           = {}
    icmp_configuration_trace_route_enabled      = false

    tcp_configuration_port                      = 3389
    tcp_configuration_trace_route_enabled       = true
    tcp_configuration_destination_port_behavior = "ListenIfAvailable"
  }
}

test_groups = {
  test_group_1 = {
    name                     = "example-test-group"
    destination_endpoints    = ["destination-endpoint"]
    source_endpoints         = ["source-endpoint"]
    test_configuration_names = ["vm2vm-test"]
    enabled                  = true
  }
}
```