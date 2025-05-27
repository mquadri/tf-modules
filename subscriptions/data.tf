data "azurerm_billing_enrollment_account_scope" "scope" {
  billing_account_name    = var.billing_account_name
  enrollment_account_name = var.enrollment_account_name
}

data "azurerm_management_group" "management_group" {
  name = var.management_group_name
}
