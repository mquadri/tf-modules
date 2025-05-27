terraform {
  required_version = "~> 1.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.89"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.15"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
}

provider "azapi" {
  subscription_id = ""
}
