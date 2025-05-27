terraform {
  required_version = "~> 1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.74"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~>1.15"
    }
  }
}
provider "azurerm" {
  features {}
}

provider "azapi" {
}