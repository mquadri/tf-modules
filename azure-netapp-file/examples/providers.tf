terraform {
  required_version = ">= 1.9.2"
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.1"
    }
    modtm = {
      source  = "azure/modtm"
      version = "~> 0.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}