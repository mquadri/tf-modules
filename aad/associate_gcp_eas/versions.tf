# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.26.1"
    }
  }
}
