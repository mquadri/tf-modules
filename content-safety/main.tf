module "avm-res-cognitiveservices-account" {
  source  = "Azure/avm-res-cognitiveservices-account/azurerm"
  version = "0.2.1"

  kind                = "ContentSafety"
  location            = var.location
  name                = local.name
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  custom_question_answering_search_service_id  = var.custom_question_answering_search_service_id
  custom_question_answering_search_service_key = var.custom_question_answering_search_service_key
  custom_subdomain_name                        = var.custom_subdomain_name
  customer_managed_key                         = var.customer_managed_key
  diagnostic_settings                          = var.diagnostic_settings
  dynamic_throttling_enabled                   = var.dynamic_throttling_enabled
  enable_telemetry                             = var.enable_telemetry
  fqdns                                        = var.fqdns
  local_auth_enabled                           = var.local_auth_enabled
  lock                                         = var.lock
  managed_identities                           = var.managed_identities
  network_acls                                 = var.network_acls
  outbound_network_access_restricted           = var.outbound_network_access_restricted
  private_endpoints                            = var.private_endpoints
  private_endpoints_manage_dns_zone_group      = var.private_endpoints_manage_dns_zone_group
  public_network_access_enabled                = var.public_network_access_enabled
  qna_runtime_endpoint                         = var.qna_runtime_endpoint
  role_assignments                             = var.role_assignments
  storage                                      = var.storage
  tags                                         = local.tags
  timeouts                                     = var.timeouts
}