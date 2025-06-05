locals {
  group_id                = data.azuread_group.group.id
  role_id_for_association = var.app_role_id_for_association
}
