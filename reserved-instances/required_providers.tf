# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.89.0"
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
