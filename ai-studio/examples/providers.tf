terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.102.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.10"
    }
  }
}


provider "azurerm" {
  features {}
}
