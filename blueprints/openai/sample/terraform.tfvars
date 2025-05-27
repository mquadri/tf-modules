additionalcontext     = "dummy-context"
appFunction           = "delete-this-appfunction"
appid                 = "delete-this-appid"
appname               = "delete-this-appname"
capacity              = 1
costAllocation        = "dummy-cost-allocation"
costAppOwnerManager   = "dummy-manager"
costAppOwnerTech      = "dummy-tech"
costBaseline          = "2022"
costBudgetOwner       = "dummy-owner"
costCostCenter        = "dummy-cost-center"
costDivision          = "dummy-division"
costVP                = "dummy-vp"
custom_subdomain_name = "dummy-subdomain"
deployments = [
  {
    name                   = "gpt-4"
    version_upgrade_option = "NoAutoUpgrade"
    model_format           = "OpenAI"
    model_name             = "gpt-4"
    model_version          = "0314"
    scale_type             = "Standard"
    capacity               = 1
  }
]
env                           = "dev"
fqdns                         = ["dummy.fqdn.com"]
key_vault_name                = "rg-terraform-openai-akv"
key_vault_resource_group_name = "rg-terraform-test"
local_auth_enabled            = true
location                      = "North Central US"
monthlyBudget                 = "1000"
network_acls_default_action   = "Allow"
network_acls_ip_rules         = []
network_acls_virtual_network_rules = [
  {
    subnet_id                            = "/subscriptions/b0259ca2-abfe-48b9-9d50-80de4fbb0879/resourceGroups/rg-vnet-ops-devops-utilities-qa/providers/Microsoft.Network/virtualNetworks/vnet-ops-devOps-utilities-qa/subnets/subnet_148.155.170.64_27"
    ignore_missing_vnet_service_endpoint = true
  }
]
outbound_network_access_restricted = false
pe_subnet_name                     = "subnet_148.155.170.64_27"
public_network_access_enabled      = true
resourcetype                       = "openai"
resource_group_name                = "rg-terraform-test"
sku_name                           = "S0"
vnet_name                          = "vnet-ops-devOps-utilities-qa"