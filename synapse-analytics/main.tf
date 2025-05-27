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

resource "azurerm_key_vault_secret" "synw_pwd" {
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

# ------ Synapse Workspace ------
resource "azurerm_synapse_workspace" "workspace" {
  name                                 = "${local.safe_naming}${var.additionalcontext}"
  resource_group_name                  = data.azurerm_resource_group.rg.name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id

  sql_administrator_login          = var.administrator_login != null ? var.administrator_login : random_string.username.result
  sql_administrator_login_password = random_password.password.result
  # OR customer_managed_key

  tags = local.tags

  managed_virtual_network_enabled = true
  managed_resource_group_name     = "${data.azurerm_resource_group.rg.name}-syn-managed"

  public_network_access_enabled = false

  # aad_admin {
  #   login     = var.aad_login.name
  #   object_id = var.aad_login.object_id
  #   tenant_id = var.aad_login.tenant_id
  # }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}

# Linking of DNS zones to Virtual Network
resource "azurerm_private_dns_zone_virtual_network_link" "zone_dev_link" {
  provider              = azurerm.management
  name                  = "vnet-link-dev-${local.naming}"
  resource_group_name   = data.azurerm_private_dns_zone.syn_dev_dns_zone.resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.syn_dev_dns_zone.name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "zone_sql_link" {
  provider              = azurerm.management
  name                  = "vnet-link-sql-${local.naming}"
  resource_group_name   = data.azurerm_private_dns_zone.syn_sql_dns_zone.resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.syn_sql_dns_zone.name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
}

resource "azurerm_private_endpoint" "pe_dev" {
  name                = "pe-syn-dev-${azurerm_synapse_workspace.workspace.name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.pe.id

  private_service_connection {
    name                           = "psc-syn-dev-${local.naming}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_synapse_workspace.workspace.id
    subresource_names              = ["dev"]
  }

  private_dns_zone_group {
    name                 = "syn-dev-${local.naming}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.syn_dev_dns_zone.id]
  }
}

resource "azurerm_private_endpoint" "pe_sql" {
  name                = "pe-syn-sql-${azurerm_synapse_workspace.workspace.name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.pe.id

  private_service_connection {
    name                           = "psc-syn-sql-${local.naming}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_synapse_workspace.workspace.id
    subresource_names              = ["sql"]
  }

  private_dns_zone_group {
    name                 = "syn-sql-${local.naming}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.syn_sql_dns_zone.id]
  }
}

resource "azurerm_private_endpoint" "pe_sqlondemand" {
  name                = "pe-syn-sqlondemand-${azurerm_synapse_workspace.workspace.name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.pe.id

  private_service_connection {
    name                           = "psc-syn_sqlondemand-${local.naming}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_synapse_workspace.workspace.id
    subresource_names              = ["sqlondemand"]
  }

  private_dns_zone_group {
    name                 = "syn-sqlondemand-${local.naming}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.syn_sql_dns_zone.id]
  }
}

# ------ Synapse SQL Dedicated Pool ------
resource "azurerm_synapse_sql_pool" "sql_pool" {
  name                 = "syndp${local.safe_naming}${var.additionalcontext}"
  synapse_workspace_id = azurerm_synapse_workspace.workspace.id
  sku_name             = var.syndp_sku_name
  create_mode          = "Default"
  storage_account_type = var.syndp_storage_account_type
  tags                 = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}


# ------ Synapse Private Link Hub ------
resource "azurerm_synapse_private_link_hub" "syn_web" {
  name                = "synplh${local.safe_naming}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  tags                = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}

resource "azurerm_private_endpoint" "pe_web" {
  name                = "pe-syn-web-${azurerm_synapse_private_link_hub.syn_web.name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.pe.id
  tags                = local.tags

  private_service_connection {
    name                           = "psc-syn-web-${local.naming}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_synapse_private_link_hub.syn_web.id
    subresource_names              = ["web"]
  }

  private_dns_zone_group {
    name                 = "syn-web-${local.naming}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.syn_web_dns_zone.id]
  }
}
