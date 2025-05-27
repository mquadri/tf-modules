# Azure Palo Alto Virtual Network Appliance and Next Generation Firewall

This module deploys and manages Palo Alto resources in Azure, including the Virtual Network Appliance and the Next Generation Firewall with Panorama and routing intent

## Features

This module includes:
- Deployment of a Palo Alto Virtual Network Appliance (NVA).
- Deployment of a Palo Alto Next Generation Firewall configured with Panorama.
- Configuration of a Virtual Hub Routing Intent with dynamic routing policies to direct traffic to the firewall.

## Example Usage

Here is an example of how to use this module in your Terraform configuration:

```hcl
module "palo_alto" {
  source         = "../"
  firewall       = var.firewall
  routing_intent = var.routing_intent
  nva            = var.nva
}
```

## Requirements

The following requirements are needed by this module:

- [terraform](https://www.terraform.io) (>= 1.5.0)
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) (~> 3.105)
- [random](https://registry.terraform.io/providers/hashicorp/random/latest/docs) (~> 3.5)

## Providers

The following providers are used by this module:

- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) (~> 3.105)
- [random](https://registry.terraform.io/providers/hashicorp/random/latest/docs) (~> 3.5)

## Resources

The following resources are used by this module:

- [azurerm_palo_alto_virtual_network_appliance](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/palo_alto_virtual_network_appliance)
- [azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/palo_alto_next_generation_firewall_virtual_hub_panorama)
- [azurerm_virtual_hub_routing_intent](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_routing_intent)

## Required Inputs

The following input variables are required:

### `nva`

Description: Configuration for Palo Alto Virtual Network Appliance.

Type:
```hcl
map(object({
  name    = string
  region  = string
  vhub_id = string
}))
```

### `firewall`

Description: Configuration for Palo Alto Next Generation Firewall with Panorama.

Type:
```hcl
map(object({
  name                = string
  region              = string
  vhub_id             = string
  resource_group_name = string
  public_ip_id        = string
  panorama_config     = string
}))
```

### `routing_intent`

Description: Configuration for Virtual Hub Routing Intent with multiple routing policies.

Type:
```hcl
map(object({
  name            = string
  vhub_id         = string
  region          = string
  routing_policies = list(object({
    policy_name  = string
    destinations = list(string)
  }))
}))
```

## Outputs

The following outputs are exported:

### `palo_alto_deployment_summary`

Description: Summary of all deployed Palo Alto resources, including NVAs, Firewalls, and Routing Intents with dynamic policies.

This output provides a detailed map with the following structure:

- **`nvas`**: Map of Palo Alto Virtual Network Appliance details, including:
  - `name`: The name of the NVA.

- **`firewalls`**: Map of Palo Alto Next Generation Firewall details, including:
  - `name`: The name of the firewall.
  - `resource_group_name`: Resource group of the firewall.
  - `location`: Azure region of the firewall.

- **`routing_intents`**: Map of Virtual Hub Routing Intent details, including:
  - `name`: The name of the routing intent.
  - `policies`: List of routing policies, each with:
    - `policy_name`: The name of the routing policy.

## Tags

The resources created by this module support optional tags. You can specify tags by including a `tags` variable in your configuration.
