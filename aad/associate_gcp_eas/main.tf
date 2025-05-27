resource "azuread_app_role_assignment" "gcp_lumen_sso_group" {
  principal_object_id = local.group_id
  app_role_id         = local.role_id_for_association
  resource_object_id  = data.azuread_service_principal.gcp_sso_app_sp.object_id
}

resource "azuread_app_role_assignment" "gcp_lumen_prov_group" {
  principal_object_id = local.group_id
  app_role_id         = local.role_id_for_association

  resource_object_id = data.azuread_service_principal.gcp_prov_app_sp.object_id
}
