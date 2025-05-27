locals {
  storages = {
    storage_1 = {
      resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/example-resource-group/providers/Microsoft.Storage/storageAccounts/example-storage-account"
      group_id    = "blob"
    },
    storage_2_dfs = {
      resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/example-resource-group/providers/Microsoft.Storage/storageAccounts/example-storage-account"
      group_id    = "dfs"
    },
    storage_2_blob = {
      resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/example-resource-group/providers/Microsoft.Storage/storageAccounts/example-storage-account"
      group_id    = "blob"
    }
  }
}


module "databricks_ncc" {
  source                            = "github.com/CenturyLink/tf-modules-azure//databricks-serversless-compute?ref=2.0.0"
  databricks_workspace_id           = "2812869264"
  location                          = var.location
  private_endpoint_rules_mysql      = ["/subscriptions/${var.subscription_id}/resourceGroups/example-resource-group/providers/Microsoft.DBforMySQL/server1/databases/example-mysql-server"]
  private_endpoint_rules_sql_server = ["/subscriptions/${var.subscription_id}/resourceGroups/myresourcegroup/providers/Microsoft.Sql/servers/myserver"]
  private_endpoint_rules_storage    = local.storages

  providers = {
    databricks = databricks.accounts
    azapi      = azapi.main
  }
}
