provider "azuread" {
  # Ensure you have configured the Azure AD provider, e.g., via environment variables
  # or other authentication methods supported by the provider.
}

module "aad_gcp_association_example" {
  source = "../.." // Assumes this example is run from within the examples directory

  group_name = var.example_group_name

  // Optional: Provide these if you need to override module defaults
  // app_role_id_for_association            = var.example_app_role_id
  // gcp_sso_service_principal_display_name = var.example_sso_sp_name
  // gcp_prov_service_principal_display_name = var.example_prov_sp_name
}

output "sso_assignment_id_example" {
  description = "ID of the SSO group assignment from the example."
  value       = module.aad_gcp_association_example.gcp_lumen_sso_group_assignment_id
}

output "prov_assignment_id_example" {
  description = "ID of the Provisioning group assignment from the example."
  value       = module.aad_gcp_association_example.gcp_lumen_prov_group_assignment_id
}
