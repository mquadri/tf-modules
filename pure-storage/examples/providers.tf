terraform {
  required_providers {
    cbs = {
      source  = "PureStorage-OpenConnect/cbs"
      version = "~> 0.11.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.15.0"
    }
    random = {
      source = "hashicorp/random"
      #version = "~> 3.1.0"
      version = ">= 3.5.1, < 4.0"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  subscription_id = ""
  features {}
}

provider "cbs" {
  azure {}
}