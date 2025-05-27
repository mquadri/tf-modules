data "terraform_remote_state" "subscriptions" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Infra.Ops-CCOE-HCA-state-management-rg"
    storage_account_name = "infraopstfstatesa"
    container_name       = "tfstates"
    subscription_id      = "8939e7de-7f79-41cf-a8c7-572bce16fd7c"
    key                  = "subscription-management.tfstate"
  }
}

data "terraform_remote_state" "subscription_config" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Infra.Ops-CCOE-HCA-state-management-rg"
    storage_account_name = "infraopstfstatesa"
    container_name       = "infra-tfstates"
    subscription_id      = "8939e7de-7f79-41cf-a8c7-572bce16fd7c"
    key                  = "sub-example-env-nn.infra.tfstate"
  }
}

data "terraform_remote_state" "networking" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Infra.Ops-CCOE-HCA-state-management-rg"
    storage_account_name = "infraopstfstatesa"
    container_name       = "infra-tfstates"
    subscription_id      = "8939e7de-7f79-41cf-a8c7-572bce16fd7c"
    key                  = "coreit-network-poc.infra.tfstates"

  }
}

