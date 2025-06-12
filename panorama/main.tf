locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

# Generate Password for Panorama
# tflint-ignore: terraform_required_providers
resource "random_password" "this" {
  for_each         = var.panorama_instances
  length           = 20
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  special          = true
  override_special = "!@#$%&"
}

# Reference to an existing Key Vault
data "azurerm_key_vault" "this" {
  for_each            = var.panorama_instances
  name                = each.value.key_vault_name
  resource_group_name = each.value.key_vault_resource_group
  provider            = azurerm.keyVault
}

# Store Generated Password in Key Vault Secrets
resource "azurerm_key_vault_secret" "this" {
  for_each        = var.panorama_instances
  name            = each.value.name
  value           = random_password.this[each.key].result
  key_vault_id    = data.azurerm_key_vault.this[each.key].id
  content_type    = var.secret_content_type
  tags            = merge(local.mandatory_tags, try(var.secret_tags, {}))
  expiration_date = var.secret_expiration_date
  not_before_date = var.secret_not_before_date
  provider        = azurerm.keyVault
}

module "swfw-modules_panorama" {
  source   = "PaloAltoNetworks/swfw-modules/azurerm//modules/panorama"
  version  = "3.2.0"
  for_each = var.panorama_instances

  # Required variables
  resource_group_name = each.value.resource_group_name
  name                = each.value.name
  image               = each.value.image
  region              = each.value.region
  virtual_machine     = each.value.virtual_machine
  authentication = {
    username                        = each.value.authentication.username
    password                        = random_password.this[each.key].result
    disable_password_authentication = each.value.authentication.disable_password_authentication
    ssh_keys                        = each.value.authentication.ssh_keys
  }
  interfaces = each.value.interfaces

  # Optional variables
  logging_disks = each.value.logging_disks
  tags          = merge(local.mandatory_tags, try(each.value.tags, {}))
  providers = {
    azurerm = azurerm.main
  }
}
