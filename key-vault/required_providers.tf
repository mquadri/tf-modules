# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">= 1.9, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.87"
    }
    # tflint-ignore: terraform_unused_required_providers
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.48.0"
    }
    azapi = {
      source = "Azure/azapi"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}