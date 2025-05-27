#Network Security Group
module "nsg" {
  source              = "../../nsg"
  location            = var.location
  name                = var.nsg_config.name
  resource_group_name = var.nsg_config.resource_group_name
  app_id              = var.app_id
  environment         = var.environment
  diagnostic_settings = var.nsg_config.diagnostic_settings
  enable_telemetry    = var.nsg_config.enable_telemetry
  lock                = var.nsg_config.lock
  role_assignments    = var.nsg_config.role_assignments
  tags                = var.nsg_config.tags
  timeouts            = var.nsg_config.timeouts
  msftmigration       = var.msftmigration
}


#  Log Analytics Workspace
module "law" {
  source                                                = "../../log-analytics-ws"
  resource_group_name                                   = var.law_config.resource_group_name
  location                                              = var.location
  additional_identities                                 = var.law_config.additional_identities
  monitor_private_link_scope                            = var.law_config.monitor_private_link_scope
  monitor_private_link_scoped_service_name              = var.law_config.monitor_private_link_scoped_service_name
  log_analytics_workspace_local_authentication_disabled = var.law_config.local_authentication_disabled
  log_analytics_workspace_internet_ingestion_enabled    = var.law_config.internet_ingestion_enabled
  log_analytics_workspace_internet_query_enabled        = var.law_config.internet_query_enabled
  log_analytics_workspace_sku                           = var.law_config.sku
  log_analytics_workspace_retention_in_days             = var.law_config.retention_in_days
  private_endpoints                                     = var.law_config.private_endpoints
  appname                                               = var.appname
  env                                                   = var.env
  additionalcontext                                     = var.law_config.additionalcontext
  app_id                                                = var.app_id
  environment                                           = var.environment
  msftmigration                                         = var.msftmigration
}


# Key Vault

module "keyvault" {
  source                          = "../../key-vault"
  location                        = var.location
  appname                         = var.appname
  env                             = var.env
  additionalcontext               = var.key_vault_config.additionalcontext
  resource_group_name             = var.key_vault_config.resource_group_name
  enabled_for_template_deployment = var.key_vault_config.enabled_for_template_deployment
  enabled_for_deployment          = var.key_vault_config.enabled_for_deployment
  sku_name                        = var.key_vault_config.sku_name
  soft_delete_enabled             = var.key_vault_config.soft_delete_enabled
  soft_delete_retention_days      = var.key_vault_config.soft_delete_retention_days
  subnet_id                       = var.key_vault_config.pe_subnet_id
  private_dns_zone_ids            = var.key_vault_config.private_dns_zone_ids
  rbac_enabled                    = var.key_vault_config.rbac_enabled
  access_policies                 = var.key_vault_config.access_policies
  existing_name                   = var.key_vault_config.existing_name
  endpoint_location               = var.key_vault_config.pe_location
  diagnostic_settings             = var.key_vault_config.diagnostic_settings
  enable_telemetry                = var.key_vault_config.enable_telemetry
  keys                            = var.key_vault_config.keys
  network_role_assignments        = var.key_vault_config.network_role_assignments
  role_assignments                = var.key_vault_config.role_assignments
  secrets                         = var.key_vault_config.secrets
  secrets_value                   = var.key_vault_config.secrets_value
  network_interface_name          = var.key_vault_config.network_interface_name
  app_id                          = var.app_id
  environment                     = var.environment
  msftmigration                   = var.msftmigration
}
