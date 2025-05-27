module "avm-res-web-site" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "0.11.0"

  kind                     = "webapp"
  name                     = local.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  os_type                  = var.os_type
  service_plan_resource_id = var.service_plan_resource_id

  all_child_resources_inherit_lock               = var.all_child_resources_inherit_lock
  all_child_resources_inherit_tags               = var.all_child_resources_inherit_tags
  app_settings                                   = var.app_settings
  application_insights                           = var.application_insights
  auth_settings                                  = var.auth_settings
  auth_settings_v2                               = var.auth_settings_v2
  auto_heal_setting                              = var.auto_heal_setting
  backup                                         = var.backup
  builtin_logging_enabled                        = var.builtin_logging_enabled
  client_affinity_enabled                        = var.client_affinity_enabled
  client_certificate_enabled                     = var.client_certificate_enabled
  client_certificate_exclusion_paths             = var.client_certificate_exclusion_paths
  client_certificate_mode                        = var.client_certificate_mode
  connection_strings                             = var.connection_strings
  content_share_force_disabled                   = var.content_share_force_disabled
  custom_domains                                 = var.custom_domains
  daily_memory_time_quota                        = var.daily_memory_time_quota
  diagnostic_settings                            = var.diagnostic_settings
  enable_application_insights                    = var.enable_application_insights
  enable_telemetry                               = var.enable_telemetry
  enabled                                        = var.enabled
  ftp_publish_basic_authentication_enabled       = var.ftp_publish_basic_authentication_enabled
  functions_extension_version                    = var.functions_extension_version
  https_only                                     = var.https_only
  key_vault_reference_identity_id                = var.key_vault_reference_identity_id
  lock                                           = var.lock
  logs                                           = var.logs
  managed_identities                             = var.managed_identities
  private_endpoints                              = var.private_endpoints
  private_endpoints_inherit_lock                 = var.private_endpoints_inherit_lock
  private_endpoints_manage_dns_zone_group        = var.private_endpoints_manage_dns_zone_group
  public_network_access_enabled                  = var.public_network_access_enabled
  role_assignments                               = var.role_assignments
  site_config                                    = var.site_config
  sticky_settings                                = var.sticky_settings
  storage_account_access_key                     = var.storage_account_access_key
  storage_account_name                           = var.storage_account_name
  storage_key_vault_secret_id                    = var.storage_key_vault_secret_id
  storage_shares_to_mount                        = var.storage_shares_to_mount
  storage_uses_managed_identity                  = var.storage_uses_managed_identity
  tags                                           = local.tags
  timeouts                                       = var.timeouts
  virtual_network_subnet_id                      = var.virtual_network_subnet_id
  webdeploy_publish_basic_authentication_enabled = var.webdeploy_publish_basic_authentication_enabled
  zip_deploy_file                                = var.zip_deploy_file
}

resource "azurerm_app_service_virtual_network_swift_connection" "function_app_vnet" {
  count          = var.swift_connection_subnet_id != null ? 1 : 0
  app_service_id = module.avm-res-web-site.resource_id
  subnet_id      = var.swift_connection_subnet_id

  depends_on = [module.avm-res-web-site]
}
