data "azurerm_resource_group" "dec-rg" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "vnet-rg" {
  name = var.vnet_resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet-rg.name
}

data "azurerm_subnet" "pe" {
  name                 = var.pe_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

data "azurerm_private_dns_zone" "db_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.private_dns_rg
  provider            = azurerm.management
}

resource "azurerm_subnet" "private" {
  name                 = "snet-dec-int-${local.naming}"
  resource_group_name  = data.azurerm_resource_group.vnet-rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.int_address_prefixes

  delegation {
    name = "dec-int-${local.naming}"

    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
      ]
      name = "Microsoft.Kusto/clusters"
    }
  }
}


resource "azurerm_network_security_group" "dec" {
  name                = "nsg-dec-${var.appname}-${var.env}-${var.additionalcontext}"
  location            = data.azurerm_resource_group.vnet-rg.location
  resource_group_name = data.azurerm_resource_group.vnet-rg.name
  tags                = local.tags
}


resource "azurerm_route_table" "dec" {
  name                = "rt-dec-${var.appname}-${var.env}-${var.additionalcontext}"
  location            = data.azurerm_resource_group.vnet-rg.location
  resource_group_name = data.azurerm_resource_group.vnet-rg.name
  tags                = local.tags
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.dec.id
}

resource "azurerm_subnet_route_table_association" "private" {
  subnet_id      = azurerm_subnet.private.id
  route_table_id = azurerm_route_table.dec.id
}

resource "azurerm_kusto_cluster" "dec-cluster" {

  lifecycle {
    # If no optimized_auto_scale block is defined, then the capacity is required. ~> NOTE: If an optimized_auto_scale block is defined and no capacity is set, then the capacity is initially set to the value of minimum_instances.
    precondition {
      condition     = (var.optimized_auto_scale != null && var.capacity == null && var.optimized_auto_scale.minimum != null && var.optimized_auto_scale.maximum != null || var.optimized_auto_scale == null && var.capacity != null)
      error_message = <<EOF
      If no optimized_auto_scale block is defined, then the capacity is required.
      
      NOTE: If an optimized_auto_scale block is defined and no capacity is set, then the capacity is initially set to the value of minimum_instances.
      Current Values:
      optimized_auto_scale = ${try(var.optimized_auto_scale) == null ? "null" : "defined"}
      capacity = ${try(var.capacity) == null ? "null" : var.capacity}
      minimum_instances = ${try(var.optimized_auto_scale.minimum) == null ? "null" : var.optimized_auto_scale.minimum}
      maximum_instances = ${try(var.optimized_auto_scale.maximum) == null ? "null" : var.optimized_auto_scale.maximum}
      EOF
    }
  }


  disk_encryption_enabled = true
  location                = data.azurerm_resource_group.dec-rg.location
  name                    = "dec${replace(local.naming, "-", "")}"
  resource_group_name     = data.azurerm_resource_group.dec-rg.name
  tags                    = local.tags
  zones                   = var.zones
  identity {
    type         = "SystemAssigned, UserAssigned"
    identity_ids = var.user_identities
  }
  sku {
    name     = var.sku_name
    capacity = var.capacity
  }

  dynamic "optimized_auto_scale" {
    for_each = var.optimized_auto_scale != null ? [var.optimized_auto_scale] : []
    content {
      minimum_instances = optimized_auto_scale.value.minimum
      maximum_instances = optimized_auto_scale.value.maximum
    }
  }

  auto_stop_enabled           = var.auto_stop_enabled
  streaming_ingestion_enabled = var.streaming_ingestion_enabled

  public_network_access_enabled = var.public_network_access_enabled

  double_encryption_enabled = var.double_encryption_enabled

}


resource "azurerm_private_endpoint" "dec" {
  name                = "pe-dec-${local.naming}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.dec-rg.name
  subnet_id           = data.azurerm_subnet.pe.id
  tags                = local.tags

  private_service_connection {
    name                           = "psc-appui-${local.naming}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_kusto_cluster.dec-cluster.id
    subresource_names              = ["cluster"]
  }
  private_dns_zone_group {
    name                 = "dec-${local.naming}-${var.additionalcontext}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.db_dns_zone.id]
  }
}

resource "azurerm_private_dns_cname_record" "dec" {
  name                = var.workspace_cname
  zone_name           = data.azurerm_private_dns_zone.db_dns_zone.name
  resource_group_name = data.azurerm_private_dns_zone.db_dns_zone.resource_group_name
  ttl                 = 300
  record              = replace(azurerm_kusto_cluster.dec-cluster.uri, "https://", "")
}

resource "azurerm_private_dns_cname_record" "dec-ingestion" {
  name                = "ingestion-${var.workspace_cname}"
  zone_name           = data.azurerm_private_dns_zone.db_dns_zone.name
  resource_group_name = data.azurerm_private_dns_zone.db_dns_zone.resource_group_name
  ttl                 = 300
  record              = replace(azurerm_kusto_cluster.dec-cluster.data_ingestion_uri, "https://", "")
}
