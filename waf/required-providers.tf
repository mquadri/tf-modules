# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90"
    }
    azuread = {
      source = "hashicorp/azuread"
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