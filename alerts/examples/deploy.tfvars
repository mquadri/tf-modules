metric_alerts = {
  alert1 = {
    name                     = "CPUHighAlert2"
    resource_group_name      = "new-epac"
    scopes                   = ["/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourcegroups/new-epac/providers/Microsoft.Compute/virtualMachines/test-vm1313"]
    description              = "Alert when CPU usage is high"
    enabled                  = true
    auto_mitigate            = false
    frequency                = "PT5M"
    severity                 = 3
    target_resource_type     = "Microsoft.Compute/virtualMachines"
    target_resource_location = "eastus"
    window_size              = "PT15M"
    actions_group_ids        = ["/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/new-epac/providers/Microsoft.Insights/actiongroups/CriticalAlertsGroup"]

    criteria = {
      cpu_usage_criteria = {
        metric_namespace = "Microsoft.Compute/virtualMachines"
        metric_name      = "Percentage CPU"
        aggregation      = "Average"
        operator         = "GreaterThan"
        threshold        = 80
      }
    }
  }
}