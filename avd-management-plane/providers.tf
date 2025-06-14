terraform {
  required_version = ">= 1.6.6, < 2.0.0"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.47.0, < 3.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.71.0, < 4.0.0"
    }
  }
}
