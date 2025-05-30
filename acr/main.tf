locals {
  # Updated local.naming to use var.environment (assuming var.env is deprecated)
  # and var.app_id (assuming var.appid is deprecated for naming too, using var.appname as per original)
  naming = "${var.resourcetype}${var.appname}${var.environment}${var.location}" # Changed var.env to var.environment

  tags = merge(
    {
      app_id        = var.app_id        # Uses the new mandatory var.app_id
      environment   = var.environment   # Uses the new mandatory var.environment
      msftmigration = var.msftmigration # Uses the new mandatory var.msftmigration
      mal_id        = var.mal_id        # Uses the new var.mal_id
      # Any other fixed default tags defined by Lumen can be added here.
      # e.g. provisioned_by = "Terraform" (if this is standard and not from AVM)
    },
    var.tags # User-provided custom tags from the new var.tags map
  )
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name) # Ensure resource_group_name is defined or handled if null
  location = var.location
  tags     = local.tags # Apply consistent tags to the RG if created by the module
}

module "avm-res-containerregistry-registry" {
  source                        = "Azure/avm-res-containerregistry-registry/azurerm"
  version                       = "0.3.1" # Consider making this version configurable
  location                      = var.location
  # Updated to use var.acr_name_override and the modified local.naming
  name                          = coalesce(var.acr_name_override, "${local.naming}${var.additionalcontext}")
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  export_policy_enabled         = var.export_policy_enabled
  tags                          = local.tags # Pass the merged tags to the AVM module
  georeplications               = var.georeplications
  private_endpoints             = var.private_endpoints
  diagnostic_settings           = var.diagnostic_settings
}