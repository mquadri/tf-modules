# tflint-ignore: terraform_required_providers
terraform {
  required_version = "~> 1.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.11.0, < 4.0"

    }
    azuread = {
      source = "hashicorp/azuread"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.15"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}
