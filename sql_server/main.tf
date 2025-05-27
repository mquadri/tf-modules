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
  name            = "${var.name}-password"
  value           = random_password.administrator_password[0].result
  key_vault_id    = data.azurerm_key_vault.kv[0].id
  content_type    = "Azure USER PASS secret"
  expiration_date = timeadd(timestamp(), "8760h")
}

# tfsec:ignore:azure-database-enable-audit
module "avm-res-sql-server" {
  source                                       = "Azure/avm-res-sql-server/azurerm"
  version                                      = "0.1.2"
  location                                     = var.location
  resource_group_name                          = var.resource_group_name
  server_version                               = var.server_version
  administrator_login                          = var.administrator_login
  administrator_login_password                 = var.administrator_login != null ? random_password.administrator_password[0].result : null
  azuread_administrator                        = var.azuread_administrator
  connection_policy                            = var.connection_policy
  databases                                    = var.databases
  diagnostic_settings                          = var.diagnostic_settings
  elastic_pools                                = var.elastic_pools
  enable_telemetry                             = var.enable_telemetry
  firewall_rules                               = var.firewall_rules
  lock                                         = var.lock
  managed_identities                           = var.managed_identities
  name                                         = var.name
  outbound_network_restriction_enabled         = var.outbound_network_restriction_enabled
  primary_user_assigned_identity_id            = var.primary_user_assigned_identity_id
  private_endpoints                            = var.private_endpoints
  public_network_access_enabled                = var.public_network_access_enabled
  role_assignments                             = var.role_assignments
  tags                                         = local.tags
  transparent_data_encryption_key_vault_key_id = var.transparent_data_encryption_key_vault_key_id
}

resource "azurerm_maintenance_configuration" "mc" {
  name                = "mc-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  scope               = "SQLDB"
  tags                = local.tags
}