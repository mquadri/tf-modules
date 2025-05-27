
# Azure Backup Protected File Share Module

This Terraform module helps manage the registration of file shares for Azure Backup using the `azurerm_backup_protected_file_share` resource. It allows you to configure backup protection for Azure file shares, link them to a recovery vault, and specify the backup policy for the file share.

## **Requirements**

| Requirement           | Version |
|-----------------------|---------|
| Terraform             | >= 1.1   |
| AzureRM Provider      | >= 3.0   |

## **Usage**

### **Example Configuration**

```hcl
module "backup_protected_file_share" {
  source = "./modules/backup_protected_file_share"

  file_shares = var.file_shares
}
```

### **Input Variables**

| Name                      | Type                                                                                      | Description                                                     | Default |
|---------------------------|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------|---------|
| `file_shares`              | `map(object({ resource_group_name = string, recovery_vault_name = string, source_file_share_name = string, storage_account_name = string, backup_policy_name = string }))` | A map of file shares to be protected with their configurations | n/a     |

#### Example input in `deploy.tfvars`:

```hcl
file_shares = {
  file_share_1 = {
    resource_group_name     = "example-rg"
    recovery_vault_name     = "example-recovery-vault"
    source_file_share_name  = "fileshare1"
    storage_account_name    = "examplestorageaccount1"
    backup_policy_name      = "default-policy-1"
  }
  file_share_2 = {
    resource_group_name     = "example-rg"
    recovery_vault_name     = "example-recovery-vault"
    source_file_share_name  = "fileshare2"
    storage_account_name    = "examplestorageaccount2"
    backup_policy_name      = "default-policy-2"
  }
}
```

### **Output Variables**

| Name                          | Description                                 |
|-------------------------------|---------------------------------------------|
| `protected_file_share_ids` | A map of IDs for all protected file shares. |

### **Outputs Example**

```hcl
output "protected_file_share_ids" {
  description = "A map of IDs for all protected file shares."
  value       = module.backup_file_shares.protected_file_share_ids
}
```

### **Providers**

This module uses the AzureRM provider to manage the backup protected file shares. The provider configuration is expected to be handled outside this module (e.g., in your root configuration).

