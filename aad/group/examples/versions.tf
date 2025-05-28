terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.26" # Match module's version constraint or use a compatible one
    }
  }
  required_version = ">= 1.0"
}
