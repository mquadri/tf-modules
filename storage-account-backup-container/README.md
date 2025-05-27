
# Azure Backup Container Storage Account Module

This Terraform module helps manage the registration of storage account containers for Azure Backup using the `azurerm_backup_container_storage_account` resource. It allows you to configure the backup protection for Azure storage accounts and associate them with a recovery vault.

## **Requirements**

| Requirement           | Version |
|-----------------------|---------|
| Terraform             | >= 1.1   |
| AzureRM Provider      | >= 3.0   |

## **Usage**

### **Example Configuration**

```hcl
module "backup_container_storage_account" {
  source = "./modules/backup_container_storage_account"

  storage_accounts = var.storage_accounts
}
```

### **Input Variables**

| Name                      | Type                                                                                      | Description                                                     | Default |
|---------------------------|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------|---------|
| `storage_accounts`         | `map(object({ resource_group_name = string, recovery_vault_name = string, storage_account_name = string }))` | A map of storage accounts to be protected with their configurations | n/a     |

#### Example input in `deploy.tfvars`:

```hcl
storage_accounts = {
  storage_1 = {
    resource_group_name   = "example-rg"
    recovery_vault_name   = "example-recovery-vault"
    storage_account_name  = "examplestorageaccount1"
  }
  storage_2 = {
    resource_group_name   = "example-rg"
    recovery_vault_name   = "example-recovery-vault"
    storage_account_name  = "examplestorageaccount2"
  }
}
```

### **Output Variables**

| Name                          | Description                                 |
|-------------------------------|---------------------------------------------|
| `registered_backup_containers` | A map of registered backup containers with their details, such as storage account name and resource group. |

### **Outputs Example**

```hcl
output "registered_backup_containers" {
  description = "A map of registered backup containers"
  value = {
    for key, container in azurerm_backup_container_storage_account.this :
    key => {
      id                   = container.id
      storage_account_name = container.storage_account_name
      resource_group_name  = container.resource_group_name
      recovery_vault_name  = container.recovery_vault_name
    }
  }
}
```

### **Providers**

This module uses the AzureRM provider to manage the backup container storage accounts. The provider configuration is expected to be handled outside this module (e.g., in your root configuration).

