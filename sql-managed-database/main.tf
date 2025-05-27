# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">=0.13"
}

resource "azurerm_mssql_managed_database" "database" {
  managed_instance_id = var.sql_managed_instance_id
  name                = var.name

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
