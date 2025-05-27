locals {
  resource_group_role_definition_format = "/subscriptions/%s%s"
  resource_group_role_scope_format      = "/subscriptions/%s/resourceGroups/%s"
  role_assignments_for_resource_group_for_any = {
    for flattened_role_assignments in flatten([
      for key, value in var.role_assignments_for_resource_groups : [
        for assignment_key, assignment_value in value.role_assignments : [
          for any_principal in assignment_value.any_principals : {
            key                = "rg-any-${key}-${assignment_key}-${any_principal}"
            role_definition_id = format(local.resource_group_role_definition_format, value.subscription_id == null ? local.default_subscription_id : value.subscription_id, local.role_definitions[assignment_value.role_definition].id)
            principal_id       = local.all_principals[any_principal].principal_id
            scope              = format(local.resource_group_role_scope_format, value.subscription_id == null ? local.default_subscription_id : value.subscription_id, value.resource_group_name)
            principal_type     = null
            expiration_days    = assignment_value.expiration_days
            elevated           = local.role_definitions[assignment_value.role_definition].elevated
          }
        ]
      ]
    ]) : flattened_role_assignments.key => flattened_role_assignments
  }
  role_assignments_for_resource_group_for_groups = {
    for flattened_role_assignments in flatten([
      for key, value in var.role_assignments_for_resource_groups : [
        for assignment_key, assignment_value in value.role_assignments : [
          for group in assignment_value.groups : {
            key                = "rg-group-${key}-${assignment_key}-${group}"
            role_definition_id = format(local.resource_group_role_definition_format, value.subscription_id == null ? local.default_subscription_id : value.subscription_id, local.role_definitions[assignment_value.role_definition].id)
            principal_id       = local.groups[group]
            scope              = format(local.resource_group_role_scope_format, value.subscription_id == null ? local.default_subscription_id : value.subscription_id, value.resource_group_name)
            principal_type     = local.principal_type.group
            expiration_days    = assignment_value.expiration_days
            elevated           = local.role_definitions[assignment_value.role_definition].elevated
          }
        ]
      ]
    ]) : flattened_role_assignments.key => flattened_role_assignments
  }
  role_assignments_for_resource_group_for_users = {
    for flattened_role_assignments in flatten([
      for key, value in var.role_assignments_for_resource_groups : [
        for assignment_key, assignment_value in value.role_assignments : [
          for user in assignment_value.users : {
            key                = "rg-user-${key}-${assignment_key}-${user}"
            role_definition_id = format(local.resource_group_role_definition_format, value.subscription_id == null ? local.default_subscription_id : value.subscription_id, local.role_definitions[assignment_value.role_definition].id)
            principal_id       = local.users[user]
            scope              = format(local.resource_group_role_scope_format, value.subscription_id == null ? local.default_subscription_id : value.subscription_id, value.resource_group_name)
            principal_type     = local.principal_type.user
            expiration_days    = assignment_value.expiration_days
            elevated           = local.role_definitions[assignment_value.role_definition].elevated
          }
        ]
      ]
    ]) : flattened_role_assignments.key => flattened_role_assignments
  }
  role_assignments_for_resource_groups = merge(
    local.role_assignments_for_resource_group_for_users,
    local.role_assignments_for_resource_group_for_groups,
    local.role_assignments_for_resource_group_for_any
  )
}