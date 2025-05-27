locals {
  role_mgmt_policies_for_management_group_for_any = {
    for flattened_role_mgmt_policies in flatten([
      for key, value in var.role_assignments_for_management_groups : [
        for assignment_key, assignment_value in value.role_assignments : [
          {
            key                                = "mg-policy-${key}-${assignment_key}"
            role_definition_id                 = local.role_definitions[assignment_value.role_definition].id
            scope                              = data.azurerm_management_group.management_groups_by_id_or_display_name[key].id
            require_multifactor_authentication = local.role_definitions[assignment_value.role_definition].require_multifactor_authentication
            require_approval                   = local.role_definitions[assignment_value.role_definition].require_approval
            require_ticket_info                = local.role_definitions[assignment_value.role_definition].require_ticket_info
            approvers                          = local.role_definitions[assignment_value.role_definition].approvers
            additional_approver_recipients     = local.role_definitions[assignment_value.role_definition].additional_approver_recipients
            additional_assignee_recipients     = local.role_definitions[assignment_value.role_definition].additional_assignee_recipients
            additional_admin_recipients        = local.role_definitions[assignment_value.role_definition].additional_admin_recipients
          }
        ]
      ]
    ]) : flattened_role_mgmt_policies.key => flattened_role_mgmt_policies
  }
  role_mgmt_policies_for_management_group_for_groups = {
    for flattened_role_mgmt_policies in flatten([
      for key, value in var.role_assignments_for_management_groups : [
        for assignment_key, assignment_value in value.role_assignments : [
          {
            key                                = "mg-policy-${key}-${assignment_key}"
            role_definition_id                 = local.role_definitions[assignment_value.role_definition].id
            scope                              = data.azurerm_management_group.management_groups_by_id_or_display_name[key].id
            require_multifactor_authentication = local.role_definitions[assignment_value.role_definition].require_multifactor_authentication
            require_approval                   = local.role_definitions[assignment_value.role_definition].require_approval
            require_ticket_info                = local.role_definitions[assignment_value.role_definition].require_ticket_info
            approvers                          = local.role_definitions[assignment_value.role_definition].approvers
            additional_approver_recipients     = local.role_definitions[assignment_value.role_definition].additional_approver_recipients
            additional_assignee_recipients     = local.role_definitions[assignment_value.role_definition].additional_assignee_recipients
            additional_admin_recipients        = local.role_definitions[assignment_value.role_definition].additional_admin_recipients
          }
        ]
      ]
    ]) : flattened_role_mgmt_policies.key => flattened_role_mgmt_policies
  }
  role_mgmt_policies_for_management_group_for_users = {
    for flattened_role_mgmt_policies in flatten([
      for key, value in var.role_assignments_for_management_groups : [
        for assignment_key, assignment_value in value.role_assignments : [
          {
            key                                = "mg-policy-${key}-${assignment_key}"
            role_definition_id                 = local.role_definitions[assignment_value.role_definition].id
            scope                              = data.azurerm_management_group.management_groups_by_id_or_display_name[key].id
            require_multifactor_authentication = local.role_definitions[assignment_value.role_definition].require_multifactor_authentication
            require_approval                   = local.role_definitions[assignment_value.role_definition].require_approval
            require_ticket_info                = local.role_definitions[assignment_value.role_definition].require_ticket_info
            approvers                          = local.role_definitions[assignment_value.role_definition].approvers
            additional_approver_recipients     = local.role_definitions[assignment_value.role_definition].additional_approver_recipients
            additional_assignee_recipients     = local.role_definitions[assignment_value.role_definition].additional_assignee_recipients
            additional_admin_recipients        = local.role_definitions[assignment_value.role_definition].additional_admin_recipients
          }
        ]
      ]
    ]) : flattened_role_mgmt_policies.key => flattened_role_mgmt_policies
  }
  role_mgmt_policies_for_management_groups = merge(
    local.role_mgmt_policies_for_management_group_for_users,
    local.role_mgmt_policies_for_management_group_for_groups,
    local.role_mgmt_policies_for_management_group_for_any
  )
}