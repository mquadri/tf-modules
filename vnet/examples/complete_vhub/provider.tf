# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.89.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Infra.Ops-CCOE-HCA-state-management-rg"
    storage_account_name = "infraopstfstatesa"
    container_name       = "tfstates"
    subscription_id      = "8939e7de-7f79-41cf-a8c7-572bce16fd7c"
    key                  = "sub-ccoe-vnet-examples-01.tfstate"
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
  alias           = "network-hub"
  subscription_id = "a316fc1a-3781-40dd-8327-d9eaa1ea077f"
  tenant_id       = "72b17115-9915-42c0-9f1b-4f98e5a4bcd2"
}