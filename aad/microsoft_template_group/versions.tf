terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.26" // Consistent with other AAD modules, audit suggested ~> 2.0
    }
  }
  required_version = ">= 1.0.0" // Or a more specific minimum version if known
}
