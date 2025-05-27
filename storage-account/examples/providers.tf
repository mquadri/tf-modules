# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">= 1.7.0"
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = ">= 1.4.0, < 2.0" #"~> 1.13"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0, < 4.2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
}