backup_vault_config = {
  vault_name = "test2024"
  resource_group_name = "testrg2024"
  location = "eastus2"
  #cross_region_restore_enabled = true
  datastore_type = "VaultStore"
  managed_identity_type = "SystemAssigned"
  redundancy = "GeoRedundant"
}

vault_policies = {
  "policy1" = {
    backup_policy_name = "testpolicy2"
    default_backup_repeating_time_interval = "R/2024-12-22T00:00:00Z/P1W" #weekly backup starting 22ndDec at 12 AM UTC
    retention_rules = [
      {
        absolute_criteria = "FirstOfWeek"
        duration = "P12W"
        name = "FirstSuccessfulBackupOfTheWeek"
        priority = 10
        datastore_type = "VaultStore"
    }
    ]
  }
}
