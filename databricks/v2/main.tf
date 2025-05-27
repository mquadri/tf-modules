locals {
  sa_appname = replace(var.appname, "-", "")
}

resource "azurerm_subnet" "public" {
  name = var.mgmt-public-snet_name

  resource_group_name  = data.azurerm_resource_group.vnet-rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.mgmt_address_prefixes

  delegation {
    name = "databricks-del-mgmt-${local.naming}"

    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
      ]
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

resource "azurerm_subnet" "private" {
  name                 = var.int-private-snet_name
  resource_group_name  = data.azurerm_resource_group.vnet-rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.int_address_prefixes

  delegation {
    name = "databricks-del-int-${local.naming}"

    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
      ]
      name = "Microsoft.Databricks/workspaces"
    }
  }
}


resource "azurerm_network_security_group" "databricks" {
  name                = "nsg-databricks-${var.appname}-${var.env}-${var.additionalcontext}"
  location            = data.azurerm_resource_group.vnet-rg.location
  resource_group_name = data.azurerm_resource_group.vnet-rg.name
  tags                = local.tags
}


resource "azurerm_route_table" "databricks" {
  name                = "rt-databricks-${var.appname}-${var.env}-${var.additionalcontext}"
  location            = data.azurerm_resource_group.vnet-rg.location
  resource_group_name = data.azurerm_resource_group.vnet-rg.name
  tags                = local.tags
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.databricks.id
  depends_on                = [azurerm_subnet.private]
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.databricks.id
  depends_on                = [azurerm_subnet.public]
}

resource "azurerm_subnet_route_table_association" "private" {
  subnet_id      = azurerm_subnet.private.id
  route_table_id = azurerm_route_table.databricks.id
  depends_on     = [azurerm_subnet.private]
}

resource "azurerm_subnet_route_table_association" "public" {
  subnet_id      = azurerm_subnet.public.id
  route_table_id = azurerm_route_table.databricks.id
  depends_on     = [azurerm_subnet.public]
}

resource "azurerm_databricks_workspace" "db-ws" {
  name                                  = "db-ws-${local.naming}"
  resource_group_name                   = data.azurerm_resource_group.db-rg.name
  location                              = var.location
  sku                                   = var.db_sku
  managed_resource_group_name           = "mg-db-${local.naming}"
  customer_managed_key_enabled          = false
  public_network_access_enabled         = false
  network_security_group_rules_required = "NoAzureDatabricksRules"
  infrastructure_encryption_enabled     = false
  custom_parameters {
    no_public_ip                                         = true
    public_subnet_name                                   = azurerm_subnet.public.name
    private_subnet_name                                  = azurerm_subnet.private.name
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.public.id
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.private.id
    storage_account_name                                 = "sta${local.sa_appname}${var.env}${var.additionalcontext}"
    storage_account_sku_name                             = "Standard_GRS"
    virtual_network_id                                   = data.azurerm_virtual_network.vnet.id
    machine_learning_workspace_id                        = var.machine_learning_workspace_id
  }
  tags = local.tags
  depends_on = [
    azurerm_subnet_network_security_group_association.private,
    azurerm_subnet_network_security_group_association.public
  ]
}

resource "azurerm_private_endpoint" "databricks-appui" {
  name                = "pe-appui-${local.naming}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.db-rg.name
  subnet_id           = data.azurerm_subnet.pe.id
  tags                = local.tags

  private_service_connection {
    name                           = "psc-appui-${local.naming}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.db-ws.id
    subresource_names              = ["databricks_ui_api"]
  }
  private_dns_zone_group {
    name                 = "db-appui-${local.naming}-${var.additionalcontext}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.db_dns_zone.id]
  }
}
resource "azurerm_private_dns_cname_record" "appui" {
  name                = var.workspace_cname
  zone_name           = data.azurerm_private_dns_zone.db_dns_zone.name
  resource_group_name = data.azurerm_private_dns_zone.db_dns_zone.resource_group_name
  ttl                 = 300
  record              = azurerm_databricks_workspace.db-ws.workspace_url
  provider            = azurerm.management
}
