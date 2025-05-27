# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmosdbdatabase" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.throughput
}
