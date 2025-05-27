# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
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