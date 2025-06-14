# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">=0.13"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.5.0, < 4.0"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.0" # Adjust the version as needed
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}

provider "azapi" {
}
