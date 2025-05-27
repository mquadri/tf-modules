flow_logs = {
  "flow_log_1" = {
    name                 = "example-flow-log-1"
    network_watcher_name = "NetworkWatcher_eastus"
    resource_group_name  = "rg"

    # Storage Account (Fetched Dynamically)
    storage_account_name = "mystorage022"
    storage_account_rg   = "rg"


    # Virtual Network (Target Resource)
    vnet_name = "test-vnet112"
    vnet_rg   = "rg"


    # Flow Log Version
    version = 2

    retention_policy = {
      days    = 30
      enabled = true
    }

    traffic_analytics = {
      enabled               = true
      workspace_id          = "id" # Example Workspace ID
      workspace_region      = "East US 2"
      workspace_resource_id = "id" # Example Resource ID
      interval_in_minutes   = 60
    }

  }
}