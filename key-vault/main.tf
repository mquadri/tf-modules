module "avm-res-keyvault-vault" {
  source   = "Azure/avm-res-keyvault-vault/azurerm"
  version  = "0.9.1"
  location = var.location
  name     = "kv-${appname}-${environment}-${location}-${additionalcontext}"
  #name                            = var.existing_name != null ? var.existing_name : "kv${local.naming}${var.additionalcontext}"
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  diagnostic_settings             = var.diagnostic_settings
  enable_telemetry                = var.enable_telemetry
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = var.enabled_for_template_deployment
  keys                            = var.keys
  network_acls = {
    bypass         = "AzureServices"
    default_action = "Deny"
  }

  private_endpoints = {
    registry_pe = {
      name                            = var.existing_name != null ? "pe-${var.existing_name}" : "pe-kv${local.naming}-${var.additionalcontext}"
      role_assignments                = var.network_role_assignments
      tags                            = local.tags
      subnet_resource_id              = var.subnet_id
      private_dns_zone_group_name     = var.existing_name != null ? "pe-${var.existing_name}" : "pe-kv${local.naming}-${var.additionalcontext}"
      private_dns_zone_resource_ids   = [var.private_dns_zone_ids]
      private_service_connection_name = var.existing_name != null ? "psc-${var.existing_name}" : "psc-kv${local.naming}-${var.additionalcontext}"
      network_interface_name          = var.network_interface_name
      location                        = var.endpoint_location != null ? var.endpoint_location : var.location
      resource_group_name             = var.resource_group_name
    }
  }

  public_network_access_enabled = false
  purge_protection_enabled      = true
  role_assignments              = local.role_assignments
  secrets                       = var.secrets
  secrets_value                 = var.secrets_value
  sku_name                      = var.sku_name
  soft_delete_retention_days    = var.soft_delete_retention_days
  tags                          = local.tags
}
