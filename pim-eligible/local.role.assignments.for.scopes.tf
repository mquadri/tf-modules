locals {
  regex_scope_is_management_group = "(?i)(/providers/Microsoft.Management/managementGroups/)([^/]+)$"
  role_assignments_for_scopes = merge(
    local.role_assignments_for_scopes_for_users,
    local.role_assignments_for_scopes_for_groups,
    local.role_assignments_for_scopes_for_any
  )
  role_assignments_for_scopes_for_any = {
    for flattened_role_assignments in flatten([
      for key, value in var.role_assignments_for_scopes : [
        for assignment_key, assignment_value in value.role_assignments : [
          for any_principal in assignment_value.any_principals : {
            key = "scope-any-${key}-${assignment_key}-${any_principal}"
            role_definition_id = (length(regexall(local.regex_scope_is_management_group, value.scope)) > 0 ?
              local.role_definitions[assignment_value.role_definition].id :
            format(local.scope_role_definition_format, split("/", value.scope)[2], local.role_definitions[assignment_value.role_definition].id))
            principal_id    = local.all_principals[any_principal].principal_id
            scope           = value.scope
            principal_type  = null
            expiration_days = assignment_value.expiration_days
            elevated        = local.role_definitions[assignment_value.role_definition].elevated
          }
        ]
      ]
    ]) : flattened_role_assignments.key => flattened_role_assignments
  }
  role_assignments_for_scopes_for_groups = {
    for flattened_role_assignments in flatten([
      for key, value in var.role_assignments_for_scopes : [
        for assignment_key, assignment_value in value.role_assignments : [
          for group in assignment_value.groups : {
            key = "scope-group-${key}-${assignment_key}-${group}"
            role_definition_id = (length(regexall(local.regex_scope_is_management_group, value.scope)) > 0 ?
              local.role_definitions[assignment_value.role_definition].id :
            format(local.scope_role_definition_format, split("/", value.scope)[2], local.role_definitions[assignment_value.role_definition].id))
            principal_id    = local.groups[group]
            scope           = value.scope
            principal_type  = local.principal_type.group
            expiration_days = assignment_value.expiration_days
            elevated        = local.role_definitions[assignment_value.role_definition].elevated
          }
        ]
      ]
    ]) : flattened_role_assignments.key => flattened_role_assignments
  }
  role_assignments_for_scopes_for_users = {
    for flattened_role_assignments in flatten([
      for key, value in var.role_assignments_for_scopes : [
        for assignment_key, assignment_value in value.role_assignments : [
          for user in assignment_value.users : {
            key = "scope-user-${key}-${assignment_key}-${user}"
            role_definition_id = (length(regexall(local.regex_scope_is_management_group, value.scope)) > 0 ?
              local.role_definitions[assignment_value.role_definition].id :
            format(local.scope_role_definition_format, split("/", value.scope)[2], local.role_definitions[assignment_value.role_definition].id))
            principal_id    = local.users[user]
            scope           = value.scope
            principal_type  = local.principal_type.user
            expiration_days = assignment_value.expiration_days
            elevated        = local.role_definitions[assignment_value.role_definition].elevated
          }
        ]
      ]
    ]) : flattened_role_assignments.key => flattened_role_assignments
  }
  scope_role_definition_format = "/subscriptions/%s%s"
}