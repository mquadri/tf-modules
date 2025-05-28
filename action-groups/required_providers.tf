terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    validation = { # Retained in case any input validation uses it, or for future deprecation warnings
      source  = "tlkamp/validation"
      version = "~> 1.1.1" 
    }
    # Removed random, azuread, azapi as they are not directly used by the module's main.tf logic.
    # If key_vault_secret data source needs specific provider versions, that would be handled by the azurerm provider.
  }
}
