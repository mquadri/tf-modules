locals {}

inputs = {
  resource_group_name                                   = "example-resource-group"
  log_analytics_workspace_table_name                    = "example-table"
  log_analytics_workspace_id                            = "example-workspace-id"
  log_analytics_workspace_table_retention_in_days       = 30
  log_analytics_workspace_table_total_retention_in_days = 60
}