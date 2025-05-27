terraform {
  required_version = "~> 1.5"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.11"
    }

    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}