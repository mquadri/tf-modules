# Azure Container Registry Terraform Module

## Description
This module deploys an Azure Container Registry (ACR) with configurable features and security settings. It provides a secure and scalable way to store container images for your applications deployed on Azure. The module follows Lumen's security and tagging requirements while allowing for customization.

## Prerequisites
- Azure subscription
- Terraform 1.0.0 or higher
- Azure provider 3.89.0 or higher
- A resource group (can be created by the module if needed)
- For private endpoints: Virtual network and subnet with proper configurations
- For encryption with Key Vault: Key Vault with proper access policies

## Architecture
![Azure Container Registry Architecture](https://docs.microsoft.com/en-us/azure/container-registry/media/container-registry-concepts/acr-concepts.png)

## Features
- Deploys a Basic, Standard, or Premium ACR instance
- Optional resource group creation
- Secure network configuration with private endpoints
- Support for geo-replication (Premium SKU only)
- Diagnostic settings configuration
- Content trust policy (Premium SKU only)
- Network rules (Premium SKU only)
- Retention policy (Premium SKU only)
- Quarantine policy (Premium SKU only)
- Customer-managed encryption keys (Premium SKU only)
- Standardized tagging

## Usage

### Basic Usage
```hcl
module "acr" {
  source              = "git::https://github.com/CenturyLink/tf-modules--azurerm-tf-modules.git//acr"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  
  # Naming inputs
  appname           = "myapp"
  environment       = "DEV"
  
  # Mandatory tags
  app_id            = "APP0001"
  msftmigration     = "Phase1"
  mal_id            = "MAL12345"
  
  # ACR settings
  sku               = "Standard"
  admin_enabled     = false
}
```

### Premium ACR with Private Endpoint and Network Rules
```hcl
module "acr" {
  source                        = "git::https://github.com/CenturyLink/tf-modules--azurerm-tf-modules.git//acr"
  resource_group_name           = "my-resource-group"
  location                      = "eastus"
  
  # Naming inputs
  appname                       = "myapp"
  environment                   = "PROD"
  
  # Mandatory tags
  app_id                        = "APP0001"
  msftmigration                 = "Phase1"
  mal_id                        = "MAL12345"
  
  # ACR settings
  sku                           = "Premium"
  admin_enabled                 = false
  public_network_access_enabled = false
  
  # Private endpoint
  private_endpoints = {
    "endpoint1" = {
      name                          = "pe-acr-prod"
      private_service_connection_name = "psc-acr-prod"
      private_dns_zone_group_name   = "pdzg-acr-prod"
      location                      = "eastus"
      resource_group_name           = "my-resource-group"
      subnet_resource_id            = "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"
      private_dns_zone_resource_ids = ["/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/my-resource-group/providers/Microsoft.Network/privateDnsZones/privatelink.azurecr.io"]
    }
  }
  
  # Network rules
  enable_network_rules = true
  network_rule_default_action = "Deny"
  network_rule_ip_rules = [
    {
      action   = "Allow"
      ip_range = "203.0.113.0/24"
    }
  ]
}
```

## Variables

### Required Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| resource_group_name | Name of the resource group where Azure Container Registry will be deployed | string | |
| location | The Azure region where the Azure Container Registry and associated resources will be deployed | string | |
| app_id | The Application ID for tagging purposes | string | |
| environment | The environment (PROD, TEST, DEV, etc.) for tagging purposes | string | |
| msftmigration | The Microsoft migration tag value | string | |
| mal_id | The MAL ID for tagging purposes | string | |

### Optional Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| acr_name_override | Specifies the name of the container registry (generated if not set) | string | null |
| create_resource_group | When set to true, a new resource group will be created | bool | false |
| sku | The SKU of the Azure Container Registry | string | "Standard" |
| admin_enabled | Specifies whether the admin user is enabled for the ACR | bool | false |
| public_network_access_enabled | Whether public network access is enabled for the ACR | bool | false |
| anonymous_pull_enabled | Specifies whether anonymous pull is enabled | bool | false |
| export_policy_enabled | Specifies whether export policy is enabled | bool | true |
| resourcetype | Resource type abbreviation for naming ACR | string | "acr" |
| appname | Application name for naming ACR | string | "defaultapp" |
| additionalcontext | Additional context for naming ACR | string | "01" |
| tags | A map of additional, user-defined tags to assign to resources | map(string) | {} |
| georeplications | A list of geo-replication configurations for the Container Registry | list(object) | [] |
| private_endpoints | A map of private endpoint configurations | map(object) | {} |
| diagnostic_settings | A map of diagnostic settings configurations | map(object) | {} |
| enable_encryption | Enables encryption at rest for the container registry | bool | false |
| enable_retention_policy | Enables retention policy for the container registry | bool | false |
| enable_content_trust | Enables content trust for the container registry | bool | false |
| enable_network_rules | Enables network rules for the container registry | bool | false |
| enable_quarantine_policy | Enables quarantine policy for the container registry | bool | false |
| enable_encryption_with_key_vault | Enables encryption with Key Vault for the container registry | bool | false |
| encryption_key_vault_key_id | The ID of the Key Vault key used for encryption | string | null |
| encryption_identity_client_id | The client ID of the identity used for encryption | string | null |
| network_rule_default_action | The default action when no network rule matches | string | "Deny" |
| network_rule_ip_rules | List of IP CIDR blocks allowed to access the Container Registry | list(object) | [] |
| network_rule_virtual_network_rules | List of virtual network subnet IDs allowed to access the Container Registry | list(object) | [] |
| retention_policy_days | The number of days to retain images for | number | 7 |

## Outputs
| Name | Description |
|------|-------------|
| acr_resource_id | Azure Container registry Resource ID |
| acr_name | Azure Container registry Name |
| acr_login_server | The URL that can be used to log into the container registry |
| acr_admin_username | The Admin Username for the Container Registry if admin_enabled is true |
| acr_admin_password | The Admin Password for the Container Registry if admin_enabled is true |
| private_endpoints | Azure Container registry Private endpoints |
| resource_group_name | The name of the resource group in which resources are created |
| network_rule_set | Network rule set for the container registry if configured |
| tags_applied | The tags applied to the Container Registry |

## Contributing
Please review the [Terraform Module Catalog Criterion](../Azure_Terraform_Module_Catalog_Criterion.txt) for guidelines on contributions.

## Additional Notes
- Premium SKU is required for private endpoints, geo-replication, and advanced network features
- For production workloads, it's recommended to use private endpoints and disable public network access
- Always follow Lumen's security requirements and tagging standards
