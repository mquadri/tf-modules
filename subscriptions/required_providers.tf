# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "> 3.89"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.0.0"
    }
    azapi = {
      source = "Azure/azapi"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.13.0"
    }
  }
}