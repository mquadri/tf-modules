terraform {
  required_version = ">= 1.7.0"
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = ">= 1.15.0, < 2.3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.116.0, < 5.0.0"
    }
    modtm = {
      source  = "Azure/modtm"
      version = "~> 0.3"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}
