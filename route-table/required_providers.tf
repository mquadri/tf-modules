# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    # tflint-ignore: terraform_required_providers
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