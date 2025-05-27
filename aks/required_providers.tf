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
      source  = "Azure/azapi"
      version = "~> 1.15"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}

provider "azurerm" {
  features {}
  alias           = "management"
  subscription_id = var.mgmt_sub_id
  tenant_id       = var.tenant_id
}