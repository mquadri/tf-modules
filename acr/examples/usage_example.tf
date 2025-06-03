// Example usage of the ACR module (Simplified)

// Provider configuration (can also be in a separate providers.tf in this example directory)
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = "~> 1.0"
}

provider "azurerm" {
  features {}
  // Ensure you are logged in via Azure CLI or have Service Principal credentials configured
}

// Example Resource Group (in a real scenario, this might be pre-existing)
resource "azurerm_resource_group" "example_rg" {
  name     = "acr-example-rg"
  location = "East US" # Choose an Azure region
}

// ACR Module Invocation
module "acr_example_instance" {
  source = "../" // Points to the parent acr module

  resource_group_name = azurerm_resource_group.example_rg.name
  location            = azurerm_resource_group.example_rg.location

  # Naming inputs (used if acr_name_override is not set)
  appname             = "myacr"
  environment         = "DEV"

  # Mandatory Tagging Inputs
  app_id              = "APP0002"
  msftmigration       = "Phase1"
  mal_id              = "MAL67890"

  # ACR Specific Configuration
  sku                           = "Standard" // Options: Basic, Standard, Premium
  admin_enabled                 = false      // Default is false, recommended
  public_network_access_enabled = false      // Default is false, recommended for security

  # Optional: User-defined tags
  tags = {
    TerraformExample = "true"
    Owner            = "DevTeam"
  }

  // To configure private endpoints, diagnostic settings, or georeplications,
  // refer to the main module's variables.tf and the more detailed example
  // often found in examples/main.tf or similar.
}

output "acr_example_id" {
  description = "ID of the example ACR created."
  value       = module.acr_example_instance.acr_id // or .acr_resource_id depending on actual output name
}

output "acr_example_name" {
  description = "Name of the example ACR created."
  value       = module.acr_example_instance.acr_name
}

output "acr_example_login_server" {
  description = "Login server of the example ACR."
  value       = module.acr_example_instance.acr_login_server // If this output exists
}
