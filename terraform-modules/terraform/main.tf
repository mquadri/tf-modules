# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.8"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Infra.Ops-CCOE-HCA-state-management-rg"
    storage_account_name = "infraopstfstatesa"
    container_name       = "tfstates"
    key                  = "tf-module-azure-terraformmodules.tfstate"
    subscription_id      = "8939e7de-7f79-41cf-a8c7-572bce16fd7c"
  }
}

provider "azurerm" {
  # Configuration options
}

provider "github" {
  # Configuration options
  token = var.token
  owner = var.owner
}

resource "github_repository" "terraformmodules" {
  name                 = "tf-modules-azure-terraformmodules"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}
