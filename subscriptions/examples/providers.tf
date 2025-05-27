# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.60.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Infra.Ops-CCOE-HCA-state-management-rg"
    storage_account_name = "infraopstfstatesa"
    container_name       = "tfstates"
    subscription_id      = "8939e7de-7f79-41cf-a8c7-572bce16fd7c"
    key                  = "subscription-management-example.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}

provider "azurerm" {
  features {}
  alias                      = "management"
  subscription_id            = "000bdcc8-114c-418a-ad9d-a1ac486ac658"
  tenant_id                  = "72b17115-9915-42c0-9f1b-4f98e5a4bcd2"
  skip_provider_registration = true
}
