
terraform {
  required_version = ">=1.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.10"
    }
    azapi = {
      source  = "Azure/azapi"
      version = ">= 1.15.0, < 2.3.0"
    }
  }
}

