# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.89"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.15"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1, < 4.0"
    }
  }
}
