# tflint-ignore: terraform_required_providers
terraform {
  # Requirements of avm-res-cognitiveservices-account module:
  # https://github.com/Azure/terraform-azurerm-avm-res-cognitiveservices-account?tab=readme-ov-file#requirements

  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.71.0, < 4.0"

    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
    modtm = {
      source  = "azure/modtm"
      version = "~> 0.3"
    }
    azapi = {
      source = "Azure/azapi"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}