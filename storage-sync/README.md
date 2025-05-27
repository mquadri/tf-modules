
# Azure Storage Sync Service Terraform Configuration

This Terraform configuration creates and manages Azure Storage Sync Services and Storage Sync Groups using the `azurerm` provider.

## Resources Managed
- **Storage Sync Services**: Uses the `azurerm_storage_sync` resource to create the sync service.
- **Storage Sync Groups**: Uses the `azurerm_storage_sync_group` resource to create the sync group within the sync service.

## Requirements

- Terraform 1.7 or later.
- Azure Subscription with appropriate permissions to create resources.

## Providers

The following providers are required:
- `azapi`: Provides access to the Azure API.
- `azurerm`: For managing Azure resources such as Storage Sync Services and Groups.
- `modtm`: For use of template variables in resources.
- `random`: For generating random values.

## Variables

### `storage_sync_services`
A map of `Storage Sync Services` to create. Each entry must include the following keys:
- `resource_group_name`: Name of the resource group for the sync service.
- `location`: Location of the sync service.
- `incoming_traffic_policy`: optional string, defaults to "AllowAllTraffic"
- `tags`: Optional tags for the sync service.

```hcl
variable "storage_sync_services" {
  description = "A map of Storage Sync Services to create"
  type = map(object({
    resource_group_name = string
    location            = string
    incoming_traffic_policy  = optional(string, "AllowAllTraffic")
    tags                = optional(map(string), {})
  }))
}
```

### `storage_sync_groups`
A map of `Storage Sync Groups` to create (optional). Each entry must contain:
- `name`: Name of the sync group.
- `storage_sync_name`: Name of the storage sync service associated with the sync group.

```hcl
variable "storage_sync_groups" {
  description = "A map of Storage Sync Groups to create (optional)"
  type = map(object({
    name                = string
    storage_sync_name   = string
  }))
  default = {}
}
```


## Outputs

- **all_storage_sync_info**: A comprehensive output providing information about all created Storage Sync Services and Groups.

```hcl
output "all_storage_sync_info" {
  description = "All information about the created Storage Sync Services, Storage Sync Groups, and Server Endpoints"
  value = {
    storage_sync_services = { 
      for k, v in azurerm_storage_sync.this : k => {
        id   = v.id
        name = v.name
      }
    },
    storage_sync_groups = {
      for k, v in azurerm_storage_sync_group.this : k => {
        id       = v.id
        name     = v.name
        storage_sync_id = v.storage_sync_id
      }
    }
  }
}
```

## Example Usage

```hcl
module "storage_sync" {
  source = "./path_to_module"

  storage_sync_services = {
    sync1 = {
      resource_group_name = "rg-avd-05"
      location            = "East US"
      tags                = { "env" = "prod" }
    }
  }

  storage_sync_groups = {
    group1 = {
      name              = "sync-group-1"
      storage_sync_name = "sync1"
    }
  }
}
```