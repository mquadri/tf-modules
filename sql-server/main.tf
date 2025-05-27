resource "random_string" "username" {
  length  = 20
  special = false
}

resource "random_password" "password" {
  length           = 32
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  special          = true
  override_special = "!@#$%*()-_=+[]{}:?"
}

resource "azurerm_key_vault_secret" "sql_pwd" {
  name            = "${local.naming}-pwd-${var.additionalcontext}"
  value           = random_password.password.result
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  content_type    = "Azure USER PASS secret ${var.appname} "
  expiration_date = timeadd(timestamp(), "8760h")
  tags = {
    type     = "username",
    username = random_string.username.result
  }

}

resource "azurerm_mssql_server" "sql_srv" {
  name                          = "srv-${local.naming}-${var.additionalcontext}"
  resource_group_name           = data.azurerm_resource_group.rg.name
  location                      = var.location
  version                       = var.sql_server_version
  administrator_login           = var.administrator_login != null ? var.administrator_login : random_string.username.result
  administrator_login_password  = random_password.password.result
  tags                          = local.tags
  public_network_access_enabled = false
  minimum_tls_version           = "1.2"

  azuread_administrator {
    login_username = var.ad_grp_sql_admin_name
    object_id      = var.ad_grp_sql_admin_id
  }

}

resource "azurerm_maintenance_configuration" "mc" {
  name                = "sql-mc-${local.naming}-${var.additionalcontext}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  scope               = "SQLDB"
  tags                = local.tags
}

resource "azurerm_private_endpoint" "pe" {
  name                = "pe-${local.naming}-${var.additionalcontext}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = var.subnet_id
  tags                = local.tags

  private_service_connection {
    name                           = "psc-${local.naming}-${var.additionalcontext}"
    private_connection_resource_id = azurerm_mssql_server.sql_srv.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }

  private_dns_zone_group {
    name                 = "pe-${local.naming}-${var.additionalcontext}"
    private_dns_zone_ids = [var.private_dns_zone_ids]
  }
}
