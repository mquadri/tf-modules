activity_log_alertt = {
  new_activity_log_alert = {
    name                = "NewServiceHealthAlert"
    resource_group_name = "my-resource-group_health_alerts"
    scopes              = ["/subscriptions/sub-id"]
    description         = "Monitors Azure service health"
    enabled             = true
    location            = "global"
    category            = "service_health"
    tags                = { "Environment" = "Production" }
    action_group_ids    = [
      "/subscriptions/"sub -id "/resourceGroups/my-resource-group_health_alerts/providers/Microsoft.Insights/actionGroups/example-action-group-health-alerts"
    ]
    events    = ["Incident", "Maintenance"]
    locations = ["East US", "West Europe"]
    services  = ["Virtual Machines", "App Service"]
  }

  new_resource_health_alert = {
    name                = "NewResourceHealthAlert"
    resource_group_name = "my-resource-group_health_alerts"
    scopes              = ["/subscriptions/"sub-id"/resourceGroups/my-resource-group_health_alerts/providers/Microsoft.Compute/virtualMachines/myVM"]
    description         = "Monitors Azure resource health"
    enabled             = true
    location            = "global"
    category            = "resource_health"
    tags                = { "Environment" = "Production" }
    action_group_ids    = [
      "/subscriptions/"sub-id"/resourceGroups/my-resource-group_health_alerts/providers/Microsoft.Insights/actionGroups/example-action-group-health-alerts"
    ]
    current  = ["Unavailable", "Degraded"]
    previous = ["Available"]
    reason   = ["PlatformInitiated"]
  }
}