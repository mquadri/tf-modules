# log-analytics-ws-table/required_providers.tf

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.15"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}