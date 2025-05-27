# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0, < 5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  alias           = "management"
  subscription_id = "000bdcc8-114c-418a-ad9d-a1ac486ac658" #Lumen-Management-Hub
}