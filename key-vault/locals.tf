locals {
  naming = "${var.appname}${var.env}"

  tags = {
    environment   = var.environment
    app_id        = var.app_id
    msftmigration = var.msftmigration
  }

  spn_minimum_roles = [
    "Key Vault Secrets Officer",
    "Key Vault Crypto Officer",
    "Key Vault Administrator"
  ]

  spn_minimum_role_assignments = {
    for role in local.spn_minimum_roles : role => {
      role_definition_id_or_name = role
      principal_id               = data.azuread_service_principal.spn.id
      description                = "SPN Role assignment for ${role}"
    }
  }

  role_assignments = merge(local.spn_minimum_role_assignments, var.role_assignments)

}