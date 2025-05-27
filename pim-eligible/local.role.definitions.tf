locals {
  elevated_roles = ["Owner", "Role Based Access Control Administrator", "User Access Administrator"]
  role_definitions = { for key, value in data.azurerm_role_definition.role_definitions_by_name :
    key => {
      id                                 = value.id
      scopes                             = value.assignable_scopes
      require_multifactor_authentication = var.role_definitions[key].require_multifactor_authentication
      require_approval                   = var.role_definitions[key].require_approval
      require_ticket_info                = var.role_definitions[key].require_ticket_info
      approvers                          = var.role_definitions[key].approvers
      additional_approver_recipients     = var.role_definitions[key].additional_approver_recipients
      additional_assignee_recipients     = var.role_definitions[key].additional_assignee_recipients
      additional_admin_recipients        = var.role_definitions[key].additional_admin_recipients
      elevated                           = contains(local.elevated_roles, value.name) ? true : false
    }
  }
}

data "azurerm_role_definition" "role_definitions_by_name" {
  for_each = var.role_definitions

  name               = each.value.name
  role_definition_id = each.value.id
  scope              = each.value.scope
}