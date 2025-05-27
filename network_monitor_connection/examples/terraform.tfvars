#############################################################
##################### Tags #################################
#############################################################

msftmigration = "kjasbd"
environment   = "dev"
app_id        = "00000000-0000-0000-0000-000000000000"

#############################################################
###### Network Connection Monitor Variables #################
#############################################################

#############################################################
# Example tfvars for deploying the Azure Network Connection
# Monitor module to check connectivity between two Azure VMs
# using TCP and port 3389
#############################################################

network_connection_monitor_name = "example-network-connection-monitor_vm_vm"
location                        = "East US"
network_watcher_id              = "/subscriptions/use_yours/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/networkWatchers/NetworkWatcher_eastus2"
notes                           = "Example Network Connection Monitor_vm2vm"
output_workspace_resource_ids = [
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


#############################################################
# Example tfvars for deploying the Azure Network Connection
# Monitor module to check connectivity between an Azure VM and
# google.com using HTTP and port 443
#############################################################


network_connection_monitor_name_http = "example-network-connection-monitor_http"
location_http                        = "EastUS2"
network_watcher_id_http              = "/subscriptions/use_yours/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/networkWatchers/NetworkWatcher_eastus2"
notes_http                           = "HTTP test for www.google.com"
output_workspace_resource_ids_http = [
  "/subscriptions/use_yours/resourceGroups/defaultresourcegroup-cus/providers/Microsoft.OperationalInsights/workspaces/defaultworkspace-use_yours-cus"
]

source_endpoint_name_http                  = "source-endpoint"
source_endpoint_address_http               = "10.0.2.4"
source_endpoint_coverage_level_http        = null
source_endpoint_excluded_ip_addresses_http = []
source_endpoint_included_ip_addresses_http = []
source_endpoint_target_resource_id_http    = "/subscriptions/use_yours/resourceGroups/netmon-test2/providers/Microsoft.Compute/virtualMachines/net-mon-test"
source_endpoint_target_resource_type_http  = "AzureVM"

destination_endpoint_name_http                  = "destination-endpoint"
destination_endpoint_address_http               = "www.google.com"
destination_endpoint_coverage_level_http        = null
destination_endpoint_excluded_ip_addresses_http = []
destination_endpoint_included_ip_addresses_http = []


test_configurations_http = {
  http_test = {
    name                                        = "http-test"
    protocol                                    = "Http"
    test_frequency_in_seconds                   = 1800
    preferred_ip_version                        = "IPv4"
    success_threshold_checks_failed_percent     = 4
    success_threshold_round_trip_time_ms        = 200
    http_configuration_method                   = "Get"
    http_configuration_path                     = null
    http_configuration_port                     = 443
    http_configuration_valid_status_code_ranges = []
    http_configuration_prefer_https             = true
    http_configuration_request_header           = {}
    icmp_configuration_trace_route_enabled      = false
    tcp_configuration_port                      = 0
    tcp_configuration_trace_route_enabled       = false
    tcp_configuration_destination_port_behavior = ""
  }
}

test_groups_http = {
  test_group_1 = {
    name                     = "http-test-group"
    destination_endpoints    = ["destination-endpoint"]
    source_endpoints         = ["source-endpoint"]
    test_configuration_names = ["http-test"]
    enabled                  = true
  }
}