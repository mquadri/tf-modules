terraform {
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.63"
    }
    azapi = {
      source = "Azure/azapi"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~>1.1.1"
    }
  }
}
