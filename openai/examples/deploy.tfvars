# Local variables specific to OpenAI resource
openai_resource_name  = "openai-single-test3"
custom_subdomain_name = "openai-single-test3"
location              = "brazilsouth"
openai_sku_name       = "S0"
resource_group_name   = "rg-openai-single"
azurerm_cognitive_deployment = {
  "gpt-4o-001" = {
    name = "deploy002"
    model = {
      format  = "OpenAI"
      name    = "gpt-4o"
      version = "2024-05-13"
    }
    sku = {
      name     = "GlobalStandard"
      capacity = 1
    }
    rai_policy_name = "custom"
  }
}

identity_type = "UserAssigned"
content_filtering = {
  custom : {
    basePolicyName = "Microsoft.Default"
    mode           = "Default"
    contentFilters = [
      { name = "Hate", blocking = true, enabled = true, severityThreshold = "High", source = "Prompt" },
      { name = "Selfharm", blocking = true, enabled = true, severityThreshold = "High", source = "Prompt" },
      { name = "Selfharm", blocking = true, enabled = true, severityThreshold = "High", source = "Completion" },
      { name = "Sexual", blocking = true, enabled = true, severityThreshold = "High", source = "Prompt" },
      { name = "Violence", blocking = true, enabled = true, severityThreshold = "High", source = "Prompt" },
      { name = "Jailbreak", blocking = true, enabled = true, source = "Prompt" },
      { name = "Indirect Attack", blocking = true, enabled = true, source = "Prompt" },
      { name = "Profanity", blocking = true, enabled = true, source = "Prompt" },
      { name = "Hate", blocking = true, enabled = true, severityThreshold = "High", source = "Completion" },
      { name = "Sexual", blocking = true, enabled = true, severityThreshold = "High", source = "Completion" },
      { name = "Violence", blocking = true, enabled = true, severityThreshold = "High", source = "Completion" },
      { name = "Protected Material Text", blocking = false, enabled = true, source = "Completion" },
      { name = "Protected Material Code", blocking = false, enabled = true, source = "Completion" },
      { name = "Profanity", blocking = true, enabled = true, source = "Completion" }
    ],
    customBlocklists : []
  }
}
# Networking details for private endpoint
tags = {}
managed_identity = {
  "user_identity1" = {
    user_managed_identity_name           = "testuseridentity27"
    managed_identity_resource_group_name = "rg-openai-single" ### existing rg name
    managed_identity_location            = "brazilsouth"
  }
}
existing_user_assigned_identity_name = "testuseridentity27"
user_assigned_identity_rg_name       = "rg-openai-single"
################ Rbac assignment#######################
#######################################################
enable_encryption = true
key_vault_name    = "AlzMonitoring-rg-kv"
key_vault_rg_name = "AlzMonitoring-rg"
resourcetype      = "openai"
appname           = "hash"

virtual_network_links = {
  "test-vnet-link" = {
    vnetlinkname = "test-vnet-link5"
    vnetid       = "/subscriptions/4ce5dc2e-0f88-46c6-873f-d1ebe23a9e07/resourceGroups/rg-openai-single/providers/Microsoft.Network/virtualNetworks/sampletest"
  }
}
domain_name = "test.project.com"
# Virtual Network Details
virtual_network_rg   = "rg-openai-single"
virtual_network_name = "sampletest"
pe_subnet_name       = "default"
dns_zone_id          = ""
create_dns_zone      = true
private_endpoints = {
  "pe1" = {
    name                 = "private-endpoint-23"
    subresource_names    = ["account"]
    is_manual_connection = false
  }
}
subscription_id = "4ce5dc2e-0f88-46c6-873f-d1ebe23a9e07"
################################diagnostics #########################################################
