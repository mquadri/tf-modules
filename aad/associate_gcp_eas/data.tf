data "azuread_group" "group" {
  display_name = var.group_name
}

data "azuread_service_principal" "gcp_sso_app_sp" {
  display_name = var.gcp_sso_service_principal_display_name
}

data "azuread_service_principal" "gcp_prov_app_sp" {
  display_name = var.gcp_prov_service_principal_display_name
}
