terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.12"
    }
    modtm = { # Keeping as it was in the original file
      source  = "azure/modtm"
      version = "~> 0.3"
    }
    random = { # Keeping as it was in the original file
      source  = "hashicorp/random"
      version = ">= 3.5.0" # Loosening to allow newer versions if compatible
    }
    validation = { # Keeping as it was in the original file
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}