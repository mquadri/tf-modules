
resource "databricks_mws_ncc_binding" "ncc_binding" {
  provider                       = databricks
  network_connectivity_config_id = local.ncc_id
  workspace_id                   = var.databricks_workspace_id
}


resource "time_sleep" "wait_10_min_for_ncc_config" {
  depends_on = [databricks_mws_ncc_binding.ncc_binding]

  create_duration = "10m"
}

resource "databricks_mws_ncc_private_endpoint_rule" "storage" {
  for_each                       = var.private_endpoint_rules_storage
  provider                       = databricks
  network_connectivity_config_id = local.ncc_id
  resource_id                    = each.value.resource_id
  group_id                       = each.value.group_id

  depends_on = [time_sleep.wait_10_min_for_ncc_config]
}

# Get Private endpoint connection from storage account

data "azapi_resource_list" "private_endpoint_connections" {
  for_each               = databricks_mws_ncc_private_endpoint_rule.storage
  type                   = "Microsoft.Storage/storageAccounts/privateEndpointConnections@2023-01-01"
  parent_id              = each.value.resource_id
  response_export_values = ["value"]

  depends_on = [databricks_mws_ncc_private_endpoint_rule.storage]

}

locals {
  unapproved_private_endpoints = {
    for k, v in databricks_mws_ncc_private_endpoint_rule.storage : k => v
    if v.connection_state == "PENDING"
  }
}


# Approve the private endpoint
resource "azapi_update_resource" "approval" {
  for_each  = local.unapproved_private_endpoints
  type      = "Microsoft.Storage/storageAccounts/privateEndpointConnections@2023-01-01"
  name      = [for v in jsondecode(data.azapi_resource_list.private_endpoint_connections[each.key].output).value : v.name if strcontains(v.properties.privateEndpoint.id, each.value.endpoint_name)][0]
  parent_id = each.value.resource_id

  body = jsonencode({
    properties = {
      privateLinkServiceConnectionState = {
        description = "Approved via Terraform"
        status      = "Approved"
      }
    }
  })

  depends_on = [data.azapi_resource_list.private_endpoint_connections]
}

resource "databricks_mws_ncc_private_endpoint_rule" "sql_server" {
  for_each                       = toset(var.private_endpoint_rules_sql_server)
  provider                       = databricks
  network_connectivity_config_id = local.ncc_id
  resource_id                    = each.value
  group_id                       = "sqlServer"

  depends_on = [time_sleep.wait_10_min_for_ncc_config]
}

locals {
  unapproved_private_endpoints_sql = {
    for k, v in databricks_mws_ncc_private_endpoint_rule.sql_server : k => v
    if v.connection_state == "PENDING"
  }
}


# Get Private endpoint connection from sql server

data "azapi_resource_list" "private_endpoint_connections_sql" {
  for_each               = databricks_mws_ncc_private_endpoint_rule.sql_server
  type                   = "Microsoft.Sql/servers/privateEndpointConnections@2021-05-01-preview"
  parent_id              = each.value.resource_id
  response_export_values = ["value"]

  depends_on = [databricks_mws_ncc_private_endpoint_rule.sql_server]
}



# Approve the private endpoint
resource "azapi_update_resource" "approval_sql_server" {
  for_each  = local.unapproved_private_endpoints_sql
  type      = "Microsoft.Sql/servers/privateEndpointConnections@2021-05-01-preview"
  name      = [for v in jsondecode(data.azapi_resource_list.private_endpoint_connections_sql[each.key].output).value : v.name if strcontains(v.properties.privateEndpoint.id, each.value.endpoint_name)][0]
  parent_id = each.value.resource_id

  body = jsonencode({
    properties = {
      privateLinkServiceConnectionState = {
        description = "Approved via Terraform"
        status      = "Approved"
      }
    }
  })

  depends_on = [databricks_mws_ncc_private_endpoint_rule.sql_server]
}

resource "databricks_mws_ncc_private_endpoint_rule" "mysql" {
  for_each                       = toset(var.private_endpoint_rules_mysql)
  provider                       = databricks
  network_connectivity_config_id = local.ncc_id
  resource_id                    = each.value
  group_id                       = "mysqlServer"

  depends_on = [time_sleep.wait_10_min_for_ncc_config]
}

# Get Private endpoint connection from MySQL server

locals {
  unapproved_private_endpoints_mysql = {
    for k, v in databricks_mws_ncc_private_endpoint_rule.mysql : k => v
    if v.connection_state == "PENDING"
  }
}

data "azapi_resource_list" "private_endpoint_connections_mysql" {
  for_each               = databricks_mws_ncc_private_endpoint_rule.mysql
  type                   = "Microsoft.DBforMySQL/servers/privateEndpointConnections@2018-06-01"
  parent_id              = each.value.resource_id
  response_export_values = ["value"]

  depends_on = [databricks_mws_ncc_private_endpoint_rule.mysql]
}

# Approve the private endpoint

resource "azapi_update_resource" "approval_mysql" {
  for_each  = local.unapproved_private_endpoints_mysql
  type      = "Microsoft.DBforMySQL/servers/privateEndpointConnections@2018-06-01"
  name      = [for v in jsondecode(data.azapi_resource_list.private_endpoint_connections_mysql[each.key].output).value : v.name if strcontains(v.properties.privateEndpoint.id, each.value.endpoint_name)][0]
  parent_id = each.value.resource_id

  body = jsonencode({
    properties = {
      privateLinkServiceConnectionState = {
        description = "Approved via Terraform"
        status      = "Approved"
      }
    }
  })

  depends_on = [databricks_mws_ncc_private_endpoint_rule.mysql]
}


resource "validation_warning" "private_endpoint_rules" {
  condition = databricks_mws_ncc_private_endpoint_rule.storage != null || databricks_mws_ncc_private_endpoint_rule.sql_server != null || databricks_mws_ncc_private_endpoint_rule.mysql != null
  summary   = "Update storage network connectivity config"
  details   = <<CONDITION
    Private endpoint rules have been created. Please remember to include the subnets
    associated with the network connectivity config in the security group of the
    storage account, SQL server, or MySQL server.
  CONDITION
}