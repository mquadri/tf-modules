create_resource_group          = true
resource_group_name            = "avmModuleTesting2"
location                       = "EastUS"
private_connection_resource_id = ""
export_policy_enabled          = false
# Azure Subscription ID
subscription_id = ""

# Virtual Network Details
virtual_network_rg   = "test-rg14"
virtual_network_name = "testvnet49"
pe_subnet_name       = "default"
dns_zone_id          = ""
create_dns_zone      = true
domain_name          = "test.project.com"
additionalcontext    = "test"
virtual_network_links = {
  "test-vnet-link" = {
    vnetlinkname = "test-vnet-link2"
    vnetid       = ""
  }
}

# Tag variable values
resourcetype        = "sub"
appid               = "test"
appname             = "exampleApp"
env                 = "dev"
costcostcenter      = "test"
costvp              = "vp"
costappownertech    = "owner"
costappownermanager = "manager"
costbudgetowner     = "budget owner"
costdivision        = "devision-name"
appfunction         = "exmaple general dev Subscription"
costbaseline        = "2024"
costallocation      = "sharedcost"
monthlybudget       = "1000"

#ACR variable values
diagnostic_settings = {
  ds1 = {
    name                        = "test-diagnostics"
    log_categories              = []
    log_groups                  = ["allLogs"]
    metric_categories           = ["AllMetrics"]
    storage_account_resource_id = ""
  }
}