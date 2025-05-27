# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
  subscription_id            = var.subscription_id
  alias                      = "main"
}

provider "azurerm" {
  features {}
  alias                      = "keyVault"
  subscription_id            = var.kv_sub_id
  tenant_id                  = var.tenant_id
  skip_provider_registration = true
}



