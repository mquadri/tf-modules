# tflint-ignore: terraform_required_providers
terraform {
  required_version = "~> 1.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.11.0, < 5.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = ">= 1.13, < 2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.48.0"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
    modtm = {
      source  = "Azure/modtm"
      version = "~> 0.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
}
