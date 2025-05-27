appid               = "SYSGEN787488690"
appname             = "example-laser-ai"
resourcetype        = "lang"
costAppOwnerManager = "Suren Rodrigues"
costAppOwnerTech    = "Durwankur Damle / Jun Cha"
costBudgetOwner     = "Rabih Nahas"
costCostCenter      = "K1005944"
costVP              = "Gregory Freeman"
costDivision        = "Operations"
env                 = "dev"
costAllocation      = "chargeback"
appFunction         = "example Language Service"
monthlyBudget       = "5000"
costbaseline        = "2024"
location            = "eastus2"
additionalcontext   = "01"
subscription_id     = "00000000-0000-0000-0000-000000000000"

name                = "lang-example-laser-ai-dev-eastus2-01"
resource_group_name = "rg-lang-exmaple-infra-dev-01"
sku_name            = "F0"

# Other settings
cognitive_deployments                        = {}
custom_question_answering_search_service_id  = "sample-search_service_id"
custom_question_answering_search_service_key = "sample_search_service_key"
custom_subdomain_name                        = null
customer_managed_key = {
  key_vault_resource_id = "sample_key_vault_id"
  key_name              = "sample_key_vault_name"
  user_assigned_identity = {
    resource_id = "sample_user_assigned_identity_id"
  }
}
diagnostic_settings        = {}
dynamic_throttling_enabled = true
enable_telemetry           = true
fqdns                      = null
local_auth_enabled         = true
lock                       = null
managed_identities = {
  "system-assigned"            = false
  "user_assigned_resource_ids" = []
}
network_acls = {
  default_action = "Deny"
  virtual_network_rules = [{
    subnet_id = "sample_subnet_id"
  }]
}
outbound_network_access_restricted = false
private_endpoints = {
  pe_endpoint = {
    name                            = "pe_endpoint"
    private_dns_zone_resource_ids   = ["sample_private_dns_zone_id"]
    private_service_connection_name = "pe_endpoint_connection"
    subnet_resource_id              = "sample-subnet-resource-id"
  }
}
private_endpoints_manage_dns_zone_group = true
public_network_access_enabled           = true
qna_runtime_endpoint                    = null
role_assignments = {
  role1 = {
    principal_id               = "sample-principal-id"
    role_definition_id_or_name = "Contributor"
  }
}
storage = [{
  identity_client_id = "sample-client-id"
  storage_account_id = "sample-storage-account-id"
}]
timeouts = {
  create = "40"
  delete = "40"
  read   = "10"
  update = "40"
}
