# Configure the Azure provider
# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
    }
  }
  backend "azurerm" {
    resource_group_name  = "Infra.Ops-CCOE-HCA-state-management-rg"
    storage_account_name = "infraopstfstatesa"
    container_name       = "tfstates"
    subscription_id      = "8939e7de-7f79-41cf-a8c7-572bce16fd7c"
    # EXAMPLE key                  = "<sub-name>-vm.tfstate"
    key = ""
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
