locals {
  # Updated local.naming to use var.environment and var.app_id
  naming = "${var.resourcetype}${var.appname}${var.environment}${var.location}"

  tags = merge(
    {
      app_id        = var.app_id
      environment   = var.environment
      msftmigration = var.msftmigration
      mal_id        = var.mal_id
      ManagedBy     = "terraform"
      CreatedOn     = formatdate("YYYY-MM-DD", timestamp())
    },
    var.tags
  )
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = local.tags
}

module "avm-res-containerregistry-registry" {
  source                        = "Azure/avm-res-containerregistry-registry/azurerm"
  version                       = "0.3.1"
  location                      = var.location
  name                          = coalesce(var.acr_name_override, "${local.naming}${var.additionalcontext}")
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  export_policy_enabled         = var.export_policy_enabled
  tags                          = local.tags
  georeplications               = var.georeplications
  private_endpoints             = var.private_endpoints
  diagnostic_settings           = var.diagnostic_settings

  # Optional feature configurations
  network_rule_set = local.network_rule_set
  retention_policy = local.retention_policy
  # trust_policy      = local.trust_policy
  # quarantine_policy = local.quarantine_policy
  # encryption        = local.enable_features.encryption_with_key_vault ? local.encryption_config.encryption : null

  # Additional configurations available through the AVM module
  role_assignments = var.sku == "Premium" ? {
    storage_blob_data_contributor = {
      role_definition_id_or_name = "Storage Blob Data Contributor"
      principal_ids              = [data.azurerm_client_config.current.object_id]
    }
  } : {}
}

# Get current client configuration for role assignments
data "azurerm_client_config" "current" {}