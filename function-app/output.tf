
output "resource" {
  value = {
    id                       = azapi_resource.functionApps.id
    name                     = azapi_resource.functionApps.name
    location                 = var.location
    resource_group_name      = var.resourceGroupName
    storage_name             = var.storageAccountName
    storage_container_name   = local.storageContainerName
    log_analytics_name       = module.functionApp_logAnalytics.name
    app_insight_name         = local.applicationInsightsName
    system_assigned_identity = try(data.azurerm_linux_function_app.fn_wrapper.identity[0].principal_id, "")
    user_assigned_identity   = try(data.azurerm_user_assigned_identity.function_app_identity[0].principal_id, "")
  }
  description = "All the specific elements of the resource"
}