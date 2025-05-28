provider "azuread" {
  # Configuration for the Azure AD provider
  # Ensure your environment is configured for Azure AD authentication
  # (e.g., via Azure CLI, Service Principal, or Managed Identity)
}

module "aad_group_example" {
  source = "../.." // Assumes this example is run from within the examples directory

  group_name   = var.example_group_name
  group_owners = var.example_group_owners

  // Optional standard Lumen tags (AAD groups are not directly taggable with Azure tags)
  // app_id      = var.example_app_id
  // environment = var.example_environment
  // mal_id      = var.example_mal_id
}

output "created_group_id" {
  description = "The Object ID of the created AAD group from the example."
  value       = module.aad_group_example.group_id
}

output "created_group_name" {
  description = "The display name of the created AAD group from the example."
  value       = module.aad_group_example.group_name
}
