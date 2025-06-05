# Terraform Module: acr (Azure Container Registry) - LUMEN Audit

## Description
This Terraform module serves as a wrapper for the official Azure AVM module (`Azure/avm-res-containerregistry-registry/azurerm`) for deploying Azure Container Registries.
The primary value-add of this wrapper is [To be filled: e.g., to enforce specific Lumen-standard tagging, simplify the interface for common use cases, or integrate specific default configurations like disabling public access and admin user by default.]

This module will create an Azure Container Registry instance. It can optionally create a new Resource Group or deploy the ACR into an existing one.

## Prerequisites
- Azure Provider configured.
- If deploying private endpoints (via the `private_endpoints` variable), ensure you have:
    - An existing Virtual Network and Subnet.
    - The subnet must have `private_endpoint_network_policies` disabled.
    - If using private DNS integration, existing Private DNS Zones might be required, or they can be created separately.

## Usage
```terraform
module "my_acr" {
  source = "[source_path_or_registry_link]" // e.g., "./modules/acr" or specific Git source

  resource_group_name = "my-rg"
  location            = "eastus"

  # Naming inputs (used if acr_name_override is not set)
  appname             = "myapplication"
  environment         = "PROD" // Or TEST, DEV, etc.

  # Mandatory Tagging Inputs
  app_id              = "APP0001"
  msftmigration       = "N/A" // Or specific migration tag
  mal_id              = "MAL12345"

  # ACR Specific Configuration
  sku                           = "Standard" // Basic, Standard, or Premium
  admin_enabled                 = false
  public_network_access_enabled = false // Recommended to be false

  # Optional: User-defined tags
  tags = {
    CostCenter = "CC123"
    Project    = "ProjectPhoenix"
  }

  # For private endpoints, diagnostic settings, georeplications, refer to variables.tf
  # and the examples/ directory.
}
```

## Tagging Strategy
This module applies a set of standard tags and merges them with any user-provided tags.
- **Mandatory Tags (passed as variables):** `app_id`, `environment`, `msftmigration`, `mal_id`.
- **Custom Tags:** Additional tags can be supplied via the `tags` map variable.
These tags are applied to the ACR instance and the resource group if created by this module. The `local.tags` block in `main.tf` defines how these are merged. [Audit Note: The audit recommended simplifying deprecated individual tag variables in `variables.tf` in a future breaking change, relying on the `tags` map and specific new mandatory tags.]

## Inputs

| Name                        | Description                                                                 | Type          | Default      | Required |
| --------------------------- | --------------------------------------------------------------------------- | ------------- | ------------ | :------: |
| `resource_group_name`       | Name of the resource group.                                                 | `string`      |              |   yes    |
| `location`                  | Azure region for deployment.                                                | `string`      |              |   yes    |
| `acr_name_override`         | Optional. Specific name for the ACR. If null, name is generated.            | `string`      | `null`       |    no    |
| `create_resource_group`     | If true, creates the resource group.                                        | `bool`        | `false`      |    no    |
| `sku`                       | ACR SKU (`Basic`, `Standard`, `Premium`).                                   | `string`      | `Standard`   |    no    |
| `admin_enabled`             | Enable admin user.                                                          | `bool`        | `false`      |    no    |
| `public_network_access_enabled` | Enable public network access.                                           | `bool`        | `false`      |    no    |
| `anonymous_pull_enabled`    | Enable anonymous pull (Premium SKU only).                                   | `bool`        | `false`      |    no    |
| `export_policy_enabled`     | Enable export policy.                                                       | `bool`        | `true`       |    no    |
| `app_id`                    | Application ID tag.                                                         | `string`      |              |   yes    |
| `environment`               | Environment tag (PROD, TEST, DEV, etc.).                                    | `string`      |              |   yes    |
| `msftmigration`             | Microsoft migration tag.                                                    | `string`      |              |   yes    |
| `mal_id`                    | MAL ID tag.                                                                 | `string`      |              |   yes    |
| `tags`                      | Additional custom tags.                                                     | `map(string)` | `{}`         |    no    |
| `resourcetype`              | Resource type for auto-naming (if `acr_name_override` is null).             | `string`      | `"acr"`      |    no    |
| `appname`                   | Application name for auto-naming.                                           | `string`      | `"defaultapp"`|    no    |
| `additionalcontext`         | Additional context for auto-naming.                                         | `string`      | `"01"`       |    no    |
| `private_endpoints`         | Map of private endpoint configurations. See `variables.tf`.                 | `map(object(...))` | `{}`      |    no    |
| `diagnostic_settings`       | Map of diagnostic settings. See `variables.tf`.                             | `map(object(...))` | `{}`      |    no    |
| `georeplications`           | List of geo-replication configurations (Premium SKU). See `variables.tf`.   | `list(object(...))`| `[]`      |    no    |

## Outputs

| Name                  | Description                                                                                          |
| --------------------- | ---------------------------------------------------------------------------------------------------- |
| `acr_id`              | The globally unique ID of the Azure Container Registry.                                                |
| `acr_name`            | The name of the Azure Container Registry.                                                            |
| `acr_login_server`    | The login server hostname of the Azure Container Registry. (Note: This was proposed for addition).     |
| `private_endpoints`   | A map of private endpoint objects created for the ACR.                                               |
| `acr_resource_id`     | (Original output name for ID) Azure Container registry Resource ID.                                    |

*(Note on Outputs: An attempt to update `outputs.tf` to standardize `acr_id` and add `acr_login_server` failed during the audit enhancement process. The outputs listed reflect current state and proposed additions.)*

## Examples
See the `examples/` directory for detailed usage, including deployment with private endpoints and private DNS zone integration. A new `usage_example.tf` will be added for a simpler base case.

## Contributing
[To be filled: Standard contribution guidelines. e.g., Fork the repository, create a feature branch, submit a Pull Request. Mention any specific testing or linting requirements.]

## Provider Requirements
The module requires the following providers:
- `azurerm` (version ~> 3.0)
- `validation` (version ~> 1.1.1)
(Audit Note: `required_providers.tf` was found to be well-configured.)

## Module Dependencies
This module directly wraps the `Azure/avm-res-containerregistry-registry/azurerm` AVM module.
