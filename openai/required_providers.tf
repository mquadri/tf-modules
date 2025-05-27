# tflint-ignore: terraform_required_providers
terraform {
  # Required version of Terraform https://github.com/Azure/terraform-azurerm-openai/blob/1b1c53721161e88bf27b34927666f1e8c9454782/providers.tf#L3C3-L3C32
  # Needed for openAI + CMK
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      # https://github.com/Azure/terraform-azurerm-openai/blob/1b1c53721161e88bf27b34927666f1e8c9454782/providers.tf#L8
      source  = "hashicorp/azurerm"
      version = "~>3.80"

    }
    azuread = {
      source = "hashicorp/azuread"
    }
    azapi = {
      source = "Azure/azapi"
      version = ">= 1.0.0"
    }
    validation = {
      source  = "tlkamp/validation"
      version = "~> 1.1.1"
    }
  }
}