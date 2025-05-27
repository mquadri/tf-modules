# CMK preparation
resource "azurerm_user_assigned_identity" "cmkid" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = "umi-${local.naming}-${var.additionalcontext}"
  tags                = local.tags
}

resource "azurerm_role_assignment" "cmkrole" {
  for_each             = toset(["Key Vault Crypto User", "Key Vault Crypto Service Encryption User", "Key Vault Crypto Officer", "Key Vault Crypto Service Release User"])
  scope                = data.azurerm_key_vault.key_vault.id
  role_definition_name = each.value
  principal_id         = azurerm_user_assigned_identity.cmkid.principal_id
}

resource "azurerm_key_vault_access_policy" "keyvaultpermissions" {
  count           = var.akv_policies_deploy ? 1 : 0
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  object_id       = azurerm_user_assigned_identity.cmkid.principal_id
  tenant_id       = azurerm_user_assigned_identity.cmkid.tenant_id
  key_permissions = ["Get", "WrapKey", "UnwrapKey"]
}


resource "azurerm_key_vault_key" "cmk" {
  name            = "cmk-${local.naming}-${var.additionalcontext}"
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  key_type        = "RSA-HSM"
  key_size        = 2048
  key_opts        = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  expiration_date = local.cmk_expire_date
  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }

    expire_after         = "P2Y"
    notify_before_expiry = "P90D"
  }


  depends_on = [
    azurerm_role_assignment.cmkrole
  ]
}




resource "azurerm_data_factory" "adf" {
  name                            = "adf-${local.naming}-${var.additionalcontext}"
  location                        = var.location
  resource_group_name             = data.azurerm_resource_group.rg.name
  managed_virtual_network_enabled = false
  public_network_enabled          = false
  tags                            = local.tags

  identity {
    type         = local.identity_type
    identity_ids = local.userIdentities
  }
  dynamic "github_configuration" {
    for_each = var.github_configuration != null ? var.github_configuration : {}
    content {
      account_name       = "CenturyLink"
      branch_name        = github_configuration.value.branch_name
      git_url            = "https://github.com"
      repository_name    = github_configuration.value.repository_name
      root_folder        = github_configuration.value.root_folder
      publishing_enabled = github_configuration.value.publishing_enabled
    }
  }

  dynamic "global_parameter" {
    for_each = var.global_parameters
    content {
      name  = global_parameter.value.name
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }

  }
  # Temporary Disable CMK
  # customer_managed_key_id          = azurerm_key_vault_key.cmk.id
  # customer_managed_key_identity_id = azurerm_user_assigned_identity.cmkid.id

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }

}

# Add Access Policy to Key Vault
resource "azurerm_key_vault_access_policy" "SystemAssigned_Policy" {
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_key_vault.key_vault.tenant_id

  # Service Principal
  object_id = azurerm_data_factory.adf.identity[0].principal_id

  secret_permissions = [
    "Get",
    "List"
  ]

}

resource "azurerm_private_endpoint" "datafactory" {
  name                = "pe-adf-${azurerm_data_factory.adf.name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.pe.id
  tags                = local.tags

  private_service_connection {
    name                           = "psc-df-${azurerm_data_factory.adf.name}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_data_factory.adf.id
    subresource_names              = ["dataFactory"]
  }
  private_dns_zone_group {
    name                 = "adf-${azurerm_data_factory.adf.name}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.adf_dns_zone.id]
  }
}

resource "azurerm_private_endpoint" "adf-portal" {
  count               = var.adf_portal_enabled ? 1 : 0
  name                = "pe-adf-portal-${azurerm_data_factory.adf.name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.pe.id
  tags                = local.tags

  private_service_connection {
    name                           = "psc-adf-portal-${azurerm_data_factory.adf.name}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_data_factory.adf.id
    subresource_names              = ["portal"]
  }
  private_dns_zone_group {
    name                 = "adf-portal-${azurerm_data_factory.adf.name}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.adf_portal_dns_zone.id]
  }

}

resource "azurerm_private_dns_a_record" "adf" {
  name                = azurerm_data_factory.adf.name
  zone_name           = data.azurerm_private_dns_zone.adf_dns_zone.name
  resource_group_name = data.azurerm_private_dns_zone.adf_dns_zone.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.datafactory.private_service_connection[0].private_ip_address]
  provider            = azurerm.management
}

resource "azurerm_private_dns_a_record" "adf-portal" {
  count               = var.adf_portal_enabled ? 1 : 0
  name                = azurerm_data_factory.adf.name
  zone_name           = data.azurerm_private_dns_zone.adf_portal_dns_zone.name
  resource_group_name = data.azurerm_private_dns_zone.adf_portal_dns_zone.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.adf-portal[0].private_service_connection[0].private_ip_address]
  provider            = azurerm.management
}

resource "azurerm_data_factory_linked_service_key_vault" "akv_linked" {
  count           = var.akv_linked_id_enabled ? 1 : 0
  name            = "adf-linked-akv-${azurerm_data_factory.adf.name}"
  data_factory_id = azurerm_data_factory.adf.id
  key_vault_id    = var.akv_linked_id
}

resource "azurerm_role_assignment" "storage_assigment" {
  count                = length(data.azurerm_storage_account.linked_sa)
  scope                = data.azurerm_storage_account.linked_sa[count.index].id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_data_factory.adf.identity[0].principal_id
}


resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "sa_datalake_linked" {
  count                    = length(data.azurerm_storage_account.linked_sa)
  name                     = "adf-linked-sa-${azurerm_data_factory.adf.name}-${data.azurerm_storage_account.linked_sa[count.index].name}"
  data_factory_id          = azurerm_data_factory.adf.id
  integration_runtime_name = azurerm_data_factory_integration_runtime_self_hosted.shir.name
  use_managed_identity     = true
  url                      = data.azurerm_storage_account.linked_sa[count.index].primary_dfs_endpoint

  depends_on = [time_sleep.wait_1_minutes_akv]
}

resource "azurerm_data_factory_linked_service_sql_server" "sql_linked_service" {
  count           = var.sql_linked_service != null ? 1 : 0
  name            = "adf-linked-sql-${azurerm_data_factory.adf.name}"
  data_factory_id = azurerm_data_factory.adf.id

  connection_string = local.connection_string
  key_vault_password {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.akv_linked[0].name
    secret_name         = var.sql_secret_name
  }

  depends_on = [time_sleep.wait_1_minutes_pass]
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "sql_linked_service" {
  count                    = var.sql_mi_linked_service != null ? 1 : 0
  name                     = "adf-linked-sql-${azurerm_data_factory.adf.name}"
  use_managed_identity     = true
  integration_runtime_name = azurerm_data_factory_integration_runtime_self_hosted.shir.name
  data_factory_id          = azurerm_data_factory.adf.id

  connection_string = local.mi_connection_string

  depends_on = [time_sleep.wait_1_minutes_id]
}
