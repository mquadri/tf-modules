# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">=1.2"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 1.44.0"

    }
    azuread = {
      source = "hashicorp/azuread"
      version = ">= 2.0.0"
    }
    azapi = {
      source = "Azure/azapi"
      version = ">= 1.0.0"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}
