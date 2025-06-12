terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    modtm = { # Keeping as it was in the original file and mentioned in README resources
      source  = "azure/modtm"
      version = "~> 0.3"
    }
    random = { # Keeping as it was in the original file and mentioned in README resources
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }
}