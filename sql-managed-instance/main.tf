data "azurerm_key_vault" "kv" {
  count               = var.administrator_login != null ? 1 : 0
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

resource "random_password" "administrator_password" {
  count            = var.administrator_login != null ? 1 : 0
  length           = 12
  lower            = true
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
  min_upper        = 2
  override_special = "_"
  special          = true
  upper            = true
}

resource "azurerm_key_vault_secret" "this" {
  count           = var.administrator_login != null ? 1 : 0
  name            = "${local.naming}-password"
  value           = random_password.administrator_password[0].result
  key_vault_id    = data.azurerm_key_vault.kv[0].id
  content_type    = "Azure USER PASS secret"
  expiration_date = timeadd(timestamp(), "8760h")
}

module "avm-res-sql-managedinstance" {
  source                                  = "Azure/avm-res-sql-managedinstance/azurerm"
  version                                 = "0.1.0"
  location                                = var.location
  name                                    = "sqldb-${local.naming}-${var.additionalcontext}"
  resource_group_name                     = var.resource_group_name
  diagnostic_settings                     = var.diagnostic_settings
  enable_telemetry                        = var.enable_telemetry
  lock                                    = var.lock
  managed_identities                      = var.managed_identities
  private_endpoints                       = var.private_endpoints
  private_endpoints_manage_dns_zone_group = var.private_endpoints_manage_dns_zone_group
  role_assignments                        = var.role_assignments
  tags                                    = merge(local.mandatory_tags, try(var.tags, {}))
  databases                               = var.databases
  failover_group                          = var.failover_group
  administrator_login                     = var.administrator_login
  administrator_login_password            = var.administrator_login != null ? random_password.administrator_password[0].result : null
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
}