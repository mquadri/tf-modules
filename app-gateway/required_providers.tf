# tflint-ignore: terraform_required_version
terraform {
  required_version = ">= 1.5"
  required_providers {
    # tflint-ignore: terraform_required_providers
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.71"
    }
    modtm = {
      source  = "Azure/modtm"
      version = "~> 0.3"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }
}