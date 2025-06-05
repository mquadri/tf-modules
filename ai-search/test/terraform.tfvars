# Mandatory Lumen Tags for the ai-search module
app_id        = "AISearchTest001"
environment   = "DEV"
msftmigration = "N"
mal_id        = "MALTEST002"

# General custom tags for the ai-search module instance
tags = {
  TestID      = "aisearch-test-001"
  Purpose     = "BasicIntegrationTest"
  Automation  = "Terraform"
}

# Configuration for the search_service map
search_service = {
  main_test_search_instance = {
    name                = "lmn-aistest-dev-main-001" # Ensure this name is globally unique for Azure AI Search
    # resource_group_name will be taken from the test/main.tf (azurerm_resource_group.test_rg.name)
    # location will be taken from the test/main.tf (azurerm_resource_group.test_rg.location)
    sku                 = "free" # Using 'free' SKU for testing to avoid costs if possible
    replica_count       = 1
    partition_count     = 1
    # tags for this specific search service instance (optional)
    tags = {
      ServiceSpecificTag = "TestInstanceAlpha"
    }
    # public_network_access_enabled = false # Example: if you want to test private networking
    # diagnostic_settings           = {}    # Example: configure if needed for test
    # private_endpoints             = {}    # Example: configure if needed for test
  }
}

# Note: For a real test, ensure the 'name' for the search service is globally unique.
# You might need to parameterize it further or use random suffixes in your test's main.tf.
# The resource_group_name and location are typically provided by the test/main.tf.
# This tfvars file provides values for the variables defined in the ai-search module's variables.tf
# and those used by the test/main.tf module block.
