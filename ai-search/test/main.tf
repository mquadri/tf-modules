provider "azurerm" {
  features {}
  # Subscription should be configured via environment variables or Azure CLI login for tests
}

resource "azurerm_resource_group" "test_rg" {
  name     = "rg-aisearch-test-001"
  location = "East US" # Choose a common region for testing
}

module "ai_search_test_instance" {
  source = "../../" # Path to the ai-search module root

  # Mandatory Lumen Tags
  app_id        = "TESTAPP001"
  environment   = "DEV"
  msftmigration = "N"
  mal_id        = "MALTEST001"

  # General custom tags for the module instance
  tags = {
    TestPurpose = "ModuleTesting"
    Automation  = "Terraform"
  }

  search_service = {
    test_search_service = {
      name                = "lmn-testaisrch-dev-001" # Unique name for the search service
      resource_group_name = azurerm_resource_group.test_rg.name
      location            = azurerm_resource_group.test_rg.location
      sku                 = "standard" # Or "free" if a no-cost option is preferred for testing
      replica_count       = 1
      partition_count     = 1
      # Add any other specific parameters you want to test from the search_service object structure
      # For example, if testing public_network_access_enabled:
      # public_network_access_enabled = false
      tags = {
        InstanceSpecificTag = "SearchInstance1"
      }
    }
  }
}

output "test_search_service_id" {
  description = "ID of the test AI Search service instance."
  value       = module.ai_search_test_instance.resource_id["test_search_service"]
}

output "test_search_service_primary_key" {
  description = "Primary admin key for the test AI Search service instance."
  value       = module.ai_search_test_instance.primary_admin_keys["test_search_service"]
  sensitive   = true
}
