data "azuread_user" "owner" {
  for_each            = toset(var.group_owners)
  user_principal_name = each.key
}

locals {
  owner_set = [for i, v in var.group_owners : data.azuread_user.owner[v].id]
}

resource "azuread_group" "group" {
  display_name     = var.group_name
  security_enabled = true
  owners           = local.owner_set
}

locals {
  group_id = azuread_group.group.id
}
