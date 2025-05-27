data "azuread_group" "group" {
  display_name = var.group_name
}

data "azuread_service_principal" "gcp_sso_app_sp" {
  display_name = "Google Cloud (GCP Lumen SSO)"
}

data "azuread_service_principal" "gcp_prov_app_sp" {
  display_name = "Google Cloud (GCP Lumen Provisioning)"
}

