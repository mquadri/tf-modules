# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.71.0, < 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Infra.Ops-CCOE-HCA-state-management-rg"
    storage_account_name = "infraopstfstatesa"
    container_name       = "tfstates"
    subscription_id      = "8939e7de-7f79-41cf-a8c7-572bce16fd7c"
    key                  = "examples-01.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
  subscription_id            = var.subscription_id
  alias                      = "main"
}
