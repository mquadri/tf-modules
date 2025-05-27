resource "azuread_service_principal" "msgraph" {
  # If entra_id_scanning is true, create the Wiz for Azure service principal
  count        = local.entra_id_scanning ? 1 : 0
  client_id    = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
  use_existing = true
}

resource "azuread_app_role_assignment" "sp_grant_role_consent" {
  # If entra_id_scanning is true, grant the Wiz for Azure service principal the required permissions to read the Microsoft Graph
  count               = local.entra_id_scanning ? length(local.application_roles) : 0
  app_role_id         = azuread_service_principal.msgraph[0].app_role_ids[local.application_roles[count.index]]
  principal_object_id = var.wiz_spn_id
  resource_object_id  = azuread_service_principal.msgraph[0].object_id
}

resource "azurerm_role_definition" "wiz_custom_role" {
  name  = var.wiz_custom_role_name
  scope = local.scope
  count = local.scope_exists ? 1 : 0

  description = "Wiz Custom Role"

  permissions {
    actions = concat(
      local.custom_role_actions_base,
      local.custom_role_actions_data_scanning,
      local.custom_role_actions_serverless_scanning
    )
  }

  assignable_scopes = [local.scope]
}

# Create the Wiz custom roles with a time delay to allow the Azure dataplane to catch up. You can leave the max default variable to the default.
# The creation of Azure custom role can take several minutes and needs to be completed before the role assignments are made, or the role assignments will simply not happen.
# Similarly, you may notice that deletion of the custom role can take several minutes to complete when you run `terraform destroy`.
resource "time_sleep" "wait_for_az_dataplane_custom_role" {
  create_duration = var.azure_wait_timer
  depends_on = [
    azurerm_role_definition.wiz_custom_role
  ]
}

# Assign Roles to Wiz for Azure Enterprise App
resource "azurerm_role_assignment" "wiz_custom_role_assignment" {
  scope                = local.scope
  count                = local.scope_exists ? 1 : 0
  principal_id         = var.wiz_spn_id
  role_definition_name = var.wiz_custom_role_name
  depends_on = [
    time_sleep.wait_for_az_dataplane_custom_role
  ]
}

resource "azurerm_role_assignment" "wiz_k8s_cluster_role_assignment" {
  scope                = local.scope
  count                = local.scope_exists ? 1 : 0
  principal_id         = var.wiz_spn_id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
}

resource "azurerm_role_assignment" "wiz_k8s_rbac_role_assignment" {
  scope                = local.scope
  count                = local.scope_exists ? 1 : 0
  principal_id         = var.wiz_spn_id
  role_definition_name = "Azure Kubernetes Service RBAC Reader"
}

resource "azurerm_role_assignment" "wiz_reader_role_assignment" {
  scope                = local.scope
  count                = local.scope_exists ? 1 : 0
  principal_id         = var.wiz_spn_id
  role_definition_name = "Reader"
}

resource "azurerm_role_assignment" "wiz_openai_role_assignment" {
  scope                = local.scope
  count                = local.scope_exists && var.enable_openai_scanning ? 1 : 0
  principal_id         = var.wiz_spn_id
  role_definition_name = "Cognitive Services OpenAI User"
}

resource "azurerm_role_assignment" "wiz_storage_reader_assignment" {
  scope                = local.scope
  count                = local.scope_exists && var.enable_data_scanning ? 1 : 0
  principal_id         = var.wiz_spn_id
  role_definition_name = "Storage Blob Data Reader"
}
