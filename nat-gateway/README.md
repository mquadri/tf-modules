
# NAT Gateway Module

This Terraform module deploys and manages NAT Gateways within an Azure environment. The configuration details for each NAT Gateway are provided in the `natgateways` variable, and the module offers several outputs that allow you to access the deployed resources and their associated properties.

## Module Configuration

### `main.tf`

```hcl
module "avm-res-network-natgateway" {
  source  = "Azure/avm-res-network-natgateway/azurerm"
  version = "0.2.0"

  for_each = var.natgateways

  # required
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # optional
  enable_telemetry        = each.value.enable_telemetry
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  lock                    = each.value.lock
  public_ip_configuration = each.value.public_ip_configuration
  public_ip_prefix_length = each.value.public_ip_prefix_length
  public_ips              = each.value.public_ips
  role_assignments        = each.value.role_assignments
  sku_name                = each.value.sku_name
  subnet_associations     = each.value.subnet_associations
  tags                    = each.value.tags
  timeouts                = each.value.timeouts
  zones                   = each.value.zones
}
```

### `variables.tf`

```hcl
variable "natgateways" {
  description = <<DESCRIPTION
Map of NAT Gateway configurations. Each key represents a unique NAT Gateway identifier, and the value contains the configuration details for the NAT Gateway.
DESCRIPTION
  type = map(object({
    location                = string
    name                    = string
    resource_group_name     = string
    enable_telemetry        = optional(bool, true)
    idle_timeout_in_minutes = optional(number, null)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    public_ip_configuration = optional(object({
      allocation_method       = optional(string, "Static")
      ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
      ddos_protection_plan_id = optional(string)
      domain_name_label       = optional(string)
      idle_timeout_in_minutes = optional(number, 30)
      inherit_tags            = optional(bool, false)
      ip_version              = optional(string, "IPv4")
      lock_level              = optional(string, null)
      sku                     = optional(string, "Standard")
      sku_tier                = optional(string, "Regional")
      tags                    = optional(map(string), null)
      zones                   = optional(list(string), ["1", "2", "3"])
    }), {
      allocation_method       = "Static"
      ddos_protection_mode    = "VirtualNetworkInherited"
      idle_timeout_in_minutes = 30
      ip_version              = "IPv4"
      sku                     = "Standard"
      sku_tier                = "Regional"
      zones                   = ["1", "2", "3"]
    })
    public_ip_prefix_length = optional(number, 0)
    public_ips = optional(map(object({
      name = string
    })), {})
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    sku_name = optional(string, null)
    subnet_associations = optional(map(object({
      resource_id = string
    })), {})
    tags = optional(map(string), null)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), null)
    zones = optional(set(string), null)
  }))
  default = {}
}
```

### `providers.tf`

```hcl
terraform {
  required_version = ">= 1.6, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.6, <= 3.114.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

### `output.tf`

```hcl
output "natgateway_public_ip_prefix_values" {
  description = "The CIDRs provisioned for the public IP prefixes of all NAT Gateways."
  value       = { for key, mod in module.avm-res-network-natgateway : key => mod.public_ip_prefix_value }
}

output "natgateway_resources" {
  description = "The NAT Gateway resources for all instances."
  value       = { for key, mod in module.avm-res-network-natgateway : key => mod.resource }
}

output "natgateway_resource_ids" {
  description = "The IDs of the NAT Gateway resources for all instances."
  value       = { for key, mod in module.avm-res-network-natgateway : key => mod.resource_id }
}

output "natgateway_combined_output" {
  description = "Combined output of NAT Gateway public IP prefixes, resources, and resource IDs."
  value = {
    public_ip_prefix_values = { for key, mod in module.avm-res-network-natgateway : key => mod.public_ip_prefix_value }
    resources               = { for key, mod in module.avm-res-network-natgateway : key => mod.resource }
    resource_ids            = { for key, mod in module.avm-res-network-natgateway : key => mod.resource_id }
  }
}
```

## Outputs

This module provides the following outputs:

- **`natgateway_public_ip_prefix_values`**: A map containing the CIDRs provisioned for the public IP prefixes of all NAT Gateways.
- **`natgateway_resources`**: A map containing the NAT Gateway resources for all instances.
- **`natgateway_resource_ids`**: A map containing the IDs of the NAT Gateway resources for all instances.
- **`natgateway_combined_output`**: A combined output containing the public IP prefixes, resources, and resource IDs of all NAT Gateways.

## Usage Example

The following example demonstrates how to use the module:

```hcl
module "nat_gateway" {
  source = "../"
  natgateways = var.natgateways
}

output "combined_nat_gateway_output" {
  value = module.nat_gateway.natgateway_combined_output
}
```

## Requirements

- Terraform version >= 1.6 and < 2.0.
- `azurerm` provider version >= 3.6 and <= 3.114.0.
