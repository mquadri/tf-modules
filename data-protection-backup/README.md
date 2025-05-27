
# Azure Data Protection Backup Module

This Terraform module helps manage the deployment  of a backup vault and a list of backup policies defined as part of the configuration using the `azurerm_data_protection_backup_vault` and `azurerm_data_protection_backup_policy_blob_storage` resource respectively. It allows you to configure various retention rules in a backup policy to backup Blob Storage containers in a storage account.

## **Requirements**

| Requirement           | Version |
|-----------------------|---------|
| Terraform             | >= 1.1   |
| AzureRM Provider      | >= 3.6   |

## **Usage**

### **Example Configuration**

```hcl
module "data_protection_backup_vault" {
  source = "./modules/data_protection_backup"

  backup_vault_config = var.backup_vault_config
  blob_storage_backup_policy_config = var.vault_policies
}
```

### **Input Variables**

| Name                      | Type                                                                                      | Description                                                     | Default |
|---------------------------|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------|---------|
| `backup_vault_config`         | `object({ vault_name = string, resource_group_name = string, location = string, redundancy = string, datastore_type = string, managed_identity_type = string , cross_region_restore_enabled = optional(bool), tags = optional(map(string)) })` | An object definining the backup vault configurations | n/a     |
| `vault_policies`         | `map(object({ backup_policy_name = string, operational_default_retention_duration = optional(string), vault_default_retention_duration = optional(string),default_backup_repeating_time_interval = optional(string), retention_rules = optional(list(object({name = string, absolute_criteria = string, priority = string, duration = string }))) }))` | An object definining the backup policies configurations | n/a     |

#### Example input in `deploy.tfvars`:

```hcl
backup_vault_config = {
  vault_name = "test2024"
  resource_group_name = "testrg2024"
  datastore_type = "VaultStore"
  managed_identity_type = "SystemAssigned"
  location = "eastus2"
  cross_region_restore_enabled = true
  redundancy = "GeoRedundant"
}

vault_policies = {
  "policy1" = {
    backup_policy_name = "testpolicy2"
    default_backup_repeating_time_interval = "R/2024-12-22T00:00:00Z/P1W"
    retention_rules = [
      {
        absolute_criteria = "FirstOfWeek"
        duration = "P12W"
        name = "FirstSuccessfulBackupOfTheWeek"
        priority = 10
      }
    ]
  }
}
```
### **Providers**

This module uses the AzureRM provider to manage the data protection backup vault and its blob storage backup policy. The provider configuration is expected to be handled outside this module (e.g., in your root configuration).
