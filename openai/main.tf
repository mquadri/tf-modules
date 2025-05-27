data "azurerm_key_vault" "key_vault" {
  count               = var.enable_encryption ? 1 : 0
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

resource "azurerm_cognitive_account" "this" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = var.sku
  public_network_access_enabled = var.public_network_access_enabled # Disabled to conform with the Security GuardRails
  dynamic_throttling_enabled    = var.dynamic_throttling_enabled
  fqdns                         = var.fqdns
  local_auth_enabled            = var.local_auth_enabled    # Disabled to conform with the Security GuardRails
  custom_subdomain_name         = var.custom_subdomain_name # Required if network acl is set
  tags                          =  merge(local.mandatory_tags, try(var.tags,{}))

  network_acls {
    default_action = var.network_acls_default_action
    ip_rules       = var.network_acls_ip_rules
    dynamic "virtual_network_rules" {
      for_each = var.network_acls_virtual_network_rules
      content {
        subnet_id                            = virtual_network_rules.value.subnet_id
        ignore_missing_vnet_service_endpoint = virtual_network_rules.value.ignore_missing_vnet_service_endpoint
      }
    }
  }

  dynamic "customer_managed_key" {
    for_each = var.enable_encryption ? [resource.azurerm_key_vault_key.cmk[0]] : []
    content {
      key_vault_key_id   = customer_managed_key.value.id
      identity_client_id = module.user_managed_identity_setup.client_id[0]
    }
  }

  identity {
    type         = var.identity_type
    identity_ids = var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned" ? local.userIdentities : null
  }

  dynamic "storage" {
    for_each = var.storage != null ? [var.storage] : []
    content {
      storage_account_id = storage.value.storage_account_id
      identity_client_id = storage.value.identity_client_id
    }
  }

  lifecycle {
    prevent_destroy = true
  }
  depends_on = [module.user_managed_identity_setup, module.role_assignments]
}

resource "azapi_resource" "content_filtering" {
  for_each   = var.content_filtering
  type       = "Microsoft.CognitiveServices/accounts/raiPolicies@2024-06-01-preview"
  name       = each.key
  parent_id  = azurerm_cognitive_account.this.id
  depends_on = [azurerm_cognitive_account.this]

  schema_validation_enabled = false

  body = jsonencode({
    properties = {
      basePolicyName   = each.value.basePolicyName
      mode             = each.value.mode
      contentFilters   = each.value.contentFilters,
      customBlocklists = each.value.customBlocklists
    }
  })
}
resource "azurerm_key_vault_key" "cmk" {
  count           = var.enable_encryption ? 1 : 0
  name            = "cmk-${local.naming}-${var.additionalcontext}"
  key_vault_id    = data.azurerm_key_vault.key_vault[0].id
  key_type        = "RSA"
  key_size        = 2048
  key_opts        = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  expiration_date = local.cmk_expire_date
  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }
    expire_after         = "P2Y"
    notify_before_expiry = "P90D"
  }
}

resource "azurerm_cognitive_account_customer_managed_key" "cmk" {
  count                = var.customer_managed_key != null ? 1 : 0
  cognitive_account_id = azurerm_cognitive_account.this.id
  key_vault_key_id     = var.customer_managed_key.key_vault_key_id
  identity_client_id   = var.customer_managed_key.identity_client_id
  depends_on           = [azurerm_cognitive_account.this]
}

resource "azurerm_cognitive_deployment" "this" {
  for_each             = var.azurerm_cognitive_deployment
  name                 = each.value.name
  cognitive_account_id = azurerm_cognitive_account.this.id

  model {
    format  = each.value.model.format
    name    = each.value.model.name
    version = each.value.model.version
  }
  scale {
    type     = each.value.sku.name
    capacity = each.value.sku.capacity
  }
  rai_policy_name = each.value.rai_policy_name
}

module "user_managed_identity_setup" {
  source                = "../user-assigned-identity"
  location              = var.location
  resource_group_name   = var.resource_group_name
  managed_identity      = var.managed_identity
  rg_role_assignments   = var.rg_role_assignments
  create_resource_group = var.create_resource_group
  appid                 = var.appid
  appname               = var.appname
  resourcetype          = var.resourcetype
  costAppOwnerManager   = var.costappownermanager
  costAppOwnerTech      = var.costappownertech
  costBudgetOwner       = var.costbudgetowner
  costCostCenter        = var.costcostcenter
  costDivision          = var.costdivision
  costVP                = var.costvp
  env                   = var.env
  costAllocation        = var.costallocation
  appFunction           = var.appfunction
  monthlyBudget         = var.monthlybudget
  costbaseline          = var.costbaseline
  additionalcontext     = var.additionalcontext
  managed_by            = var.managed_by
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
  tags                           = merge(local.mandatory_tags, try(var.tags,{}))
  txt_records                    = var.txt_records
  virtual_network_links          = var.virtual_network_links
  private_endpoints              = var.private_endpoints
  location                       = var.location
  subscription_id                = var.subscription_id
  virtual_network_rg             = var.virtual_network_rg
  virtual_network_name           = var.virtual_network_name
  pe_subnet_name                 = var.pe_subnet_name
  private_connection_resource_id = azurerm_cognitive_account.this.id
  dns_zone_id                    = var.dns_zone_id
  create_dns_zone                = var.create_dns_zone
  additionalcontext              = var.additionalcontext
  depends_on                     = [azurerm_cognitive_account.this]
}

#Role assignment for Key Vault
module "role_assignments" {
  count            = var.enable_encryption ? 1 : 0
  source           = "Azure/avm-res-authorization-roleassignment/azurerm"
  version          = "0.1.0"
  depends_on       = [module.user_managed_identity_setup]
  enable_telemetry = false
  user_assigned_managed_identities_by_resource_group_and_name = try(var.identity_type, "UserAssigned") != "UserAssigned" ? null : {
    rsv_user_identity = {
      resource_group_name = module.user_managed_identity_setup.resource[0].resource_group_name
      name                = module.user_managed_identity_setup.resource[0].name
    }
  }
  role_definitions = local.role_definitions
  # system_assigned_managed_identities_by_display_name = try(var.identity_type, "SystemAssigned") != "SystemAssigned" ? null : {
  #   rsv_system_identity = azurerm_cognitive_account.this.identity[0].principal_id
  # }
  role_assignments_for_resources = {
    kv_role = {
      resource_name       = var.key_vault_name
      resource_group_name = var.key_vault_rg_name
      role_assignments = {
        role_assignment1 = {
          role_definition = "KeyVaultCryptoUser"
          # system_assigned_managed_identities = try(var.identity_type, "SystemAssigned") != "SystemAssigned" ? null : ["rsv_system_identity"]
          user_assigned_managed_identities = try(var.identity_type, "UserAssigned") != "UserAssigned" ? null : ["rsv_user_identity"]
        }
        role_assignment2 = {
          role_definition = "KeyVaultCryptoServiceEncryptionUser"
          # system_assigned_managed_identities = try(var.identity_type, "SystemAssigned") != "SystemAssigned" ? null : ["rsv_system_identity"]
          user_assigned_managed_identities = try(var.identity_type, "UserAssigned") != "UserAssigned" ? null : ["rsv_user_identity"]
        }
        role_assignment3 = {
          role_definition = "KeyVaultCryptoOfficer"
          # system_assigned_managed_identities = try(var.identity_type, "SystemAssigned") != "SystemAssigned" ? null : ["rsv_system_identity"]
          user_assigned_managed_identities = try(var.identity_type, "UserAssigned") != "UserAssigned" ? null : ["rsv_user_identity"]
        }
        role_assignment4 = {
          role_definition = "KeyVaultCryptoServiceReleaseUser"
          # system_assigned_managed_identities = try(var.identity_type, "SystemAssigned") != "SystemAssigned" ? null : ["rsv_system_identity"]
          user_assigned_managed_identities = try(var.identity_type, "UserAssigned") != "UserAssigned" ? null : ["rsv_user_identity"]
        }
      }
    }
  }
}

module "key-vault-access-policy-setup" {
  count  = var.enable_encryption ? 1 : 0
  source = "../key-vault-access-policy"

  key_vault_id = data.azurerm_key_vault.key_vault[0].id

  tenant_id = module.user_managed_identity_setup.tenant_id[0]
  object_id = module.user_managed_identity_setup.principal_id[0]

  secret_permissions      = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
  certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
  key_permissions         = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"]
  storage_permissions     = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
}

#--------------------------------------------------------------
# Diagnostics Settings
#--------------------------------------------------------------

module "diagnostics-setting-setup" {
  source                         = "../diagnostic-setting"
  for_each                       = var.enable_diagnostic_setting == true ? { this = var.enable_diagnostic_setting } : {}
  resource_id                    = azurerm_cognitive_account.this.id
  diagnostics_settings_name      = var.diagnostics_settings_name
  log_categories                 = var.log_categories
  excluded_log_categories        = var.excluded_log_categories
  metric_categories              = var.metric_categories
  logs_destinations_ids          = var.logs_destinations_ids
  log_analytics_destination_type = var.log_analytics_destination_type
  depends_on                     = [azurerm_cognitive_account.this]
}
