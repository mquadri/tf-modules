create_resource_group = true
resource_group_name   = "avmModuleTesting2"
location              = "EastUS"
# Azure Subscription ID
subscription_id = ""

# # Virtual Network Details
virtual_network_rg   = "test-rg16"
virtual_network_name = "testvnet51"
pe_subnet_name       = "default"

storage_account_name    = "teststrg"
storage_account_rg_name = "test-rg16"
additionalcontext       = "01"

#Diagnostic setting
diagnostics_settings_name = "test-diag1"
enable_diagnostic_setting = true
log_categories            = []
log_category_groups       = ["allLogs"]
metric_categories         = ["Transaction"]

# Tag variable values
resourcetype        = "sub"
appid               = "test"
appname             = "infra"
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

monitor_private_link_scoped_service_name              = "privateLinkScope873"
private_dns_zones_names                               = ["test.contoso.com", "test.project.com"]
private_dns_rg                                        = "test-lumen-rg16"
log_analytics_workspace_local_authentication_disabled = false
log_analytics_workspace_sku                           = "PerGB2018"
log_analytics_workspace_retention_in_days             = "30"
log_analytics_workspace_internet_ingestion_enabled    = false
log_analytics_workspace_internet_query_enabled        = false
monitor_private_link_scope_name                       = "law_pl_scope"
