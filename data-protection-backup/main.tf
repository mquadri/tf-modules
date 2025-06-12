locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

#---------------------------------------------------------
# Backup Vault resource creation
#----------------------------------------------------------
resource "azurerm_data_protection_backup_vault" "vault1" {
  name                = var.backup_vault_config.vault_name
  location            = var.backup_vault_config.location
  resource_group_name = var.backup_vault_config.resource_group_name
  datastore_type      = var.backup_vault_config.datastore_type
  redundancy          = var.backup_vault_config.redundancy
  #cross_region_restore_enabled = var.backup_vault_config.cross_region_restore_enabled
  tags = merge(local.mandatory_tags, try(var.backup_vault_config.tags, {}))

  identity {
    type = var.backup_vault_config.managed_identity_type
  }
}
#---------------------------------------------------------

#---------------------------------------------------------
# Blob Storage backup policy
#---------------------------------------------------------

resource "azurerm_data_protection_backup_policy_blob_storage" "blob_storage_backup_policy" {
  for_each                               = var.blob_storage_backup_policy_config != null ? var.blob_storage_backup_policy_config : {}
  name                                   = each.value.backup_policy_name
  vault_id                               = azurerm_data_protection_backup_vault.vault1.id
  operational_default_retention_duration = each.value.operational_default_retention_duration != null ? each.value.operational_default_retention_duration : "P30D"
  vault_default_retention_duration       = each.value.vault_default_retention_duration != null ? each.value.vault_default_retention_duration : "P360D"
  backup_repeating_time_intervals        = [each.value.default_backup_repeating_time_interval]


  dynamic "retention_rule" {
    for_each = each.value.retention_rules != null ? each.value.retention_rules : []
    content {
      name = retention_rule.value.name
      criteria {
        absolute_criteria = retention_rule.value.absolute_criteria
      }
      life_cycle {
        data_store_type = retention_rule.value.datastore_type
        duration        = retention_rule.value.duration
      }
      priority = retention_rule.value.priority
    }
  }
}
