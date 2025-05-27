locals {
  role_management_policies = merge(
    local.role_mgmt_policies_for_resource_groups,
    local.role_mgmt_policies_for_management_groups,
    local.role_mgmt_policies_for_scopes,
    local.role_mgmt_policies_for_subscriptions
  )
}