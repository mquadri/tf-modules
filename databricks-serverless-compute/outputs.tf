output "network_connectivity_config_id" {
  value       = local.ncc_id
  description = "Network Connectivity Config ID"
}

output "private_endpoint_storage_rules" {
  value = {
    for k, v in databricks_mws_ncc_private_endpoint_rule.storage : k => {
      resource_id      = v.resource_id
      group_id         = v.group_id
      rule_id          = v.id
      endpoint_name    = v.endpoint_name
      connection_state = v.connection_state
    }
  }
}

output "private_endpoint_sql_server_rules" {
  value = {
    for k, v in databricks_mws_ncc_private_endpoint_rule.sql_server : k => {
      resource_id      = v.resource_id
      group_id         = v.group_id
      rule_id          = v.id
      endpoint_name    = v.endpoint_name
      connection_state = v.connection_state
    }
  }
}

output "private_endpoint_mysql_rules" {
  value = {
    for k, v in databricks_mws_ncc_private_endpoint_rule.mysql : k => {
      resource_id      = v.resource_id
      group_id         = v.group_id
      rule_id          = v.id
      endpoint_name    = v.endpoint_name
      connection_state = v.connection_state
    }
  }
}


output "ncc_data" {
  value = {
    ncc_id      = local.ncc_id,
    ncc_name    = local.ncc_name,
    ncc_subnets = local.ncc_subnets

  }

}