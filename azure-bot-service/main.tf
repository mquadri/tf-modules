resource "azurerm_bot_service_azure_bot" "this" {
  name                = local.name
  resource_group_name = var.resource_group_name
  location            = var.location
  microsoft_app_id    = var.microsoft_app_id
  sku                 = var.sku

  public_network_access_enabled = var.public_network_access_enabled

  tags = local.tags
}

module "private-endpoint-setup" {
  source                         = "../private-endpoint"
  for_each                       = var.enable_private_endpoint == true ? { this = var.enable_private_endpoint } : {}
  appname                        = var.appname
  env                            = var.env
  domain_name                    = var.domain_name
  resource_group_name            = var.resource_group_name
  a_records                      = var.a_records
  aaaa_records                   = var.aaaa_records
  cname_records                  = var.cname_records
  enable_telemetry               = var.enable_telemetry
  mx_records                     = var.mx_records
  ptr_records                    = var.ptr_records
  soa_record                     = var.soa_record
  srv_records                    = var.srv_records
  tags                           = local.tags
  txt_records                    = var.txt_records
  virtual_network_links          = var.virtual_network_links
  private_endpoints              = var.private_endpoints
  location                       = data.azurerm_resource_group.rg_vnet.location
  subscription_id                = var.subscription_id
  virtual_network_rg             = var.virtual_network_rg
  virtual_network_name           = var.virtual_network_name
  pe_subnet_name                 = var.pe_subnet_name
  private_connection_resource_id = azurerm_bot_service_azure_bot.this.id
  dns_zone_id                    = var.dns_zone_id
  create_dns_zone                = var.create_dns_zone
  additionalcontext              = var.additionalcontext
  depends_on                     = [azurerm_bot_service_azure_bot.this]
}

#--------------------------------------------------------------
# Diagnostics Settings
#--------------------------------------------------------------

module "diagnostics-setting-setup" {
  source                         = "../diagnostic-setting"
  for_each                       = var.enable_diagnostic_setting == true ? { this = var.enable_diagnostic_setting } : {}
  resource_id                    = azurerm_bot_service_azure_bot.this.id
  diagnostics_settings_name      = var.diagnostics_settings_name
  log_categories                 = var.log_categories
  excluded_log_categories        = var.excluded_log_categories
  metric_categories              = var.metric_categories
  logs_destinations_ids          = var.logs_destinations_ids
  log_analytics_destination_type = var.log_analytics_destination_type
  depends_on                     = [azurerm_bot_service_azure_bot.this]
}
