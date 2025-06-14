# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">= 1.4.6"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"

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
