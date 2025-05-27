output "server_id" {
  description = "The ID of this SQL server."
  value       = azurerm_mssql_server.sql_srv.id
}

output "server_name" {
  description = "The name of this SQL server."
  value       = azurerm_mssql_server.sql_srv.name
}

output "admin_username" {
  description = "The administrator username for this SQL server."
  value       = var.administrator_login != null ? var.administrator_login : random_string.username.result
}

output "admin_password" {
  description = "The administrator password for this SQL server."
  value       = random_password.password.result
  sensitive   = true
}

output "credentials_secret" {
  description = "The secret ID for the credentials stored in the key vault."
  value       = azurerm_key_vault_secret.sql_pwd.name
}

output "server_fqdn" {
  description = "The URI of this SQL server."
  value       = azurerm_mssql_server.sql_srv.fully_qualified_domain_name

}

