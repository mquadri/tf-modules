data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                          = var.kv_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  enabled_for_disk_encryption   = true
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  public_network_access_enabled = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "List",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "random_password" "eus2" {
  length           = 20
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  special          = true
  override_special = "!@#$%&"
}

resource "azurerm_key_vault_secret" "example" {
  name            = "admin-password"
  value           = random_password.eus2.result
  expiration_date = timeadd(timestamp(), "8760h")
  key_vault_id    = azurerm_key_vault.example.id
}

module "sql-mi" {
  source                                  = "../"
  location                                = var.location
  additionalcontext                       = var.additionalcontext
  resource_group_name                     = var.resource_group_name
  diagnostic_settings                     = var.diagnostic_settings
  enable_telemetry                        = var.enable_telemetry
  lock                                    = var.lock
  tags                                    = var.tags
  managed_identities                      = var.managed_identities
  private_endpoints                       = var.private_endpoints
  private_endpoints_manage_dns_zone_group = var.private_endpoints_manage_dns_zone_group
  role_assignments                        = var.role_assignments
  databases                               = var.databases
  failover_group                          = var.failover_group
  administrator_login                     = var.administrator_login
  administrator_login_password            = random_password.eus2.result
  enable_advanced_threat_protection       = var.enable_advanced_threat_protection
  license_type                            = var.license_type
  sku_name                                = var.sku_name
  storage_size_in_gb                      = var.storage_size_in_gb
  subnet_id                               = var.subnet_id
  vcores                                  = var.vcores
  collation                               = var.collation
  dns_zone_partner_id                     = var.dns_zone_partner_id
  maintenance_configuration_name          = var.maintenance_configuration_name
  minimum_tls_version                     = var.minimum_tls_version
  proxy_override                          = var.proxy_override
  public_data_endpoint_enabled            = var.public_data_endpoint_enabled
  storage_account_type                    = var.storage_account_type
  timeouts                                = var.timeouts
  timezone_id                             = var.timezone_id
  transparent_data_encryption             = var.transparent_data_encryption
  active_directory_administrator          = var.active_directory_administrator
  security_alert_policy                   = var.security_alert_policy
  storage_account_resource_id             = var.storage_account_resource_id
  vulnerability_assessment                = var.vulnerability_assessment
  zone_redundant_enabled                  = var.zone_redundant_enabled
  resourcetype                            = var.resourcetype
  appid                                   = var.appid
  appname                                 = var.appname
  env                                     = var.env
  environment                             = var.environment
  msftmigration                           = var.msftmigration
}
