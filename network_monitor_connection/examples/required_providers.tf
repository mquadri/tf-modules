terraform {
  required_version = ">= 1.11.2, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.25.0, < 5.0.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}