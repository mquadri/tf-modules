output "gcp_lumen_sso_group_assignment_id" {
  description = "The ID of the Azure AD app role assignment for the GCP Lumen SSO group."
  value       = azuread_app_role_assignment.gcp_lumen_sso_group.id
}

output "gcp_lumen_prov_group_assignment_id" {
  description = "The ID of the Azure AD app role assignment for the GCP Lumen Provisioning group."
  value       = azuread_app_role_assignment.gcp_lumen_prov_group.id
}
