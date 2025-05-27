resourcetype    = "sub"
appid          = "test"
appname        = "infra"
env            = "dev"
costCostCenter = "test"
# costVP                               = "vp"
costAppOwnerTech    = "owner"
costAppOwnerManager = "manager"
costBudgetOwner     = "budget owner"
# management_group_name                = "mg-name"
# costDivision                         = "devision-name"
appFunction    = "exmaple general dev Subscription"
costbaseline   = "2024"
costAllocation = "sharedcost"
monthlyBudget  = "1000"

expressroute_resource_group_name   = "express-route-rg"
service_provider_name = "Equinix"
peering_location      = "Seattle"
bandwidth_in_mbps     = 50
location              = "WestUS2"
sku = {
  tier   = "Standard"
  family = "MeteredData"
}
peerings = {
  firstPeeringConfig = {
    peering_type                  = "AzurePrivatePeering"
    peer_asn                      = 64512
    primary_peer_address_prefix   = "10.1.0.0/30"
    secondary_peer_address_prefix = "10.1.0.4/30"
    ipv4_enabled                  = true
    vlan_id                       = 300
  }
}
express_route_circuit_authorizations = {
  authorization1 = {
    name = "authorization1"
  }
}
diagnostic_settings = {
diag1 = {
  name                       = "test-diag123"
  logs_destinations_ids      = ["test"]
  workspace_resource_id      = "test"
  enable_diagnostic_setting  = true
  log_category_groups        = ["allLogs"]
  metric_categories          = ["AllMetrics"]
  additionalcontext          = "test"
}
}
enable_telemetry = true
