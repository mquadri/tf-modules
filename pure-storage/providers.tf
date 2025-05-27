terraform {
  required_providers {
    cbs = {
      source  = "PureStorage-OpenConnect/cbs"
      #version = "~> 0.11."
      version  = "0.11.1"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.7.0, < 5.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.6"
    }
  }
  required_version = ">= 0.13"
}