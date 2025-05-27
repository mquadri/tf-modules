terraform {
  required_providers {
    netapp-cloudmanager = {
      source  = "NetApp/netapp-cloudmanager"
      version = "25.3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.15.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  subscription_id = ""
  features {}
}

provider "netapp-cloudmanager" {
  refresh_token = local.refresh_token
}