resource "validation_warning" "access_policies" {
  condition = var.access_policies != null || !var.rbac_enabled
  summary   = "From August 2024 onwards, the access_policies input variable will be deprecated. Please consider using the role_assignments input variable instead."
  details   = <<EOF
    The access_policies input variable is deprecated and will be removed in August 2024. 
    Please consider using the role_assignments input variable instead. 
    The role_assignments input variable allows you to assign roles to the Key Vault for service principals, users, and groups.
    The role_assignments input variable is more flexible and allows you to assign any role to any principal, whereas the access_policies input variable 
    only allows you to assign the Key Vault Contributor role to service principals, users, and groups. 
    For more information, see the documentation: 
      - https://github.com/Azure/terraform-azurerm-avm-res-keyvault-vault?tab=readme-ov-file#-role_assignments
      - https://learn.microsoft.com/en-us/azure/key-vault/general/rbac-migration
EOF
}

resource "validation_warning" "soft_delete_enabled" {
  condition = var.soft_delete_enabled != null
  summary   = "The soft_delete_enabled input variable is deprecated. v1.0 ignores it and v2.0 will delete this variable"
}
