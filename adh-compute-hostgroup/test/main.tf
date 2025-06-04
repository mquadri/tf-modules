provider "azurerm" {
  features {}
  # Ensure subscription_id is set via environment variables or other means for testing
}

resource "azurerm_resource_group" "test_rg" {
  name     = "rg-adh-test"
  location = "East US" # Or a variable from terraform.tfvars
}

module "test_adh_hostgroup" {
  source = "../../" # Path to the module root

  # Mandatory Tags
  app_id        = "APPTEST"
  environment   = "DEV"
  msftmigration = "N"
  mal_id        = "MALTEST001"

  # Optional general tags
  tags = {
    TestPurpose = "ModuleTesting"
    Automation  = "Terraform"
  }

  # Module specific variables
  dedicated_host_group_name   = "testadhgroup001"
  resource_group_name         = azurerm_resource_group.test_rg.name
  location                    = azurerm_resource_group.test_rg.location
  platform_fault_domain_count = 1 # Minimal for testing
  automatic_placement_enabled = true
  zone                        = "1"   # Ensure this is valid for the location if not using a region with no zone support
  enable_telemetry            = false # Typically false for tests

  dedicated_hosts = {
    host1 = {
      name                    = "testadhhost01"
      platform_fault_domain   = 1
      sku_name                = "DSv3-Type1" # Example SKU, ensure this is available
      auto_replace_on_failure = true
      license_type            = "None"
    }
  }
}

output "test_dedicated_host_group_name" {
  description = "Name of the test dedicated host group."
  value       = module.test_adh_hostgroup.name
}

output "test_dedicated_host_group_resource_id" {
  description = "Resource ID of the test dedicated host group."
  value       = module.test_adh_hostgroup.resource.id # Accessing the 'id' from the 'resource' output map
}
