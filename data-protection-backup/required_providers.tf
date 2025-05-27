# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">=1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=1.44.0"
    }
  }
}
