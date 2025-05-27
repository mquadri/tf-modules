output "workspace_id" {
  value       = azurerm_synapse_workspace.workspace.id
  description = "ID of the synapse Workspace."
}

output "workspace_connectivity_endpoints" {
  value       = azurerm_synapse_workspace.workspace.connectivity_endpoints
  description = "list of Connectivity endpoints for the synapse Workspace."
}

output "workspace_identity" {
  value       = azurerm_synapse_workspace.workspace.identity
  description = "Service Principal associated with the Managed Service Identity of the synapse Workspace."
}

output "admin_username" {
  description = "The administrator username for the synapse Workspace."
  value       = var.administrator_login != null ? var.administrator_login : random_string.username.result
}

output "admin_password" {
  description = "The administrator password for the synapse Workspace."
  value       = random_password.password.result
  sensitive   = true
}

output "credentials_secret" {
  description = "The secret ID for the credentials stored in the key vault."
  value       = azurerm_key_vault_secret.synw_pwd.name
}

output "synapse_dev_private_endpoint_connection" {
  value = azurerm_private_endpoint.pe_dev.private_service_connection
}

output "synapse_sql_private_endpoint_connection" {
  value = azurerm_private_endpoint.pe_sql.private_service_connection
}

output "synapse_sqlondemand_private_endpoint_connection" {
  value = azurerm_private_endpoint.pe_sqlondemand.private_service_connection
}



output "sql_pool_id" {
  value       = azurerm_synapse_sql_pool.sql_pool.id
  description = "ID of the Synapse SQL Pool."
}



output "private_link_hub_web_id" {
  value       = azurerm_synapse_private_link_hub.syn_web.id
  description = "ID of the Synapse Private Link Hub for web."
}

output "synapse_web_private_endpoint_connection" {
  value = azurerm_private_endpoint.pe_web.private_service_connection
}
