# Terraform Module: subnet

## Description
[To be filled based on module specifics: Provide a brief overview of the Subnet module. Explain that it creates an Azure Subnet within a specified Virtual Network and Resource Group. It can also configure Network Security Groups (NSGs), Route Tables, Service Endpoints, and Delegations.]

## Prerequisites
[To be filled based on module specifics: List any dependencies, required permissions, or pre-existing infrastructure. e.g., Azure provider configured, existing Virtual Network and Resource Group.]

## Usage
[To be filled based on module specifics: Provide a simple example of how to use the module.]

```terraform
module "my_subnet" {
  source = "[source_path_or_registry_link]" // e.g., "./modules/subnet"

  // Required Variables
  // resource_group_name  = data.azurerm_resource_group.my_rg.name
  // vnet_name            = data.azurerm_virtual_network.my_vnet.name
  // subnet_name          = "my-subnet"
  // address_prefixes     = ["10.0.1.0/24"]
  // mal_id               = var.mal_id

  // Optional Variables
  // tags = {}
  // network_security_group_id = data.azurerm_network_security_group.my_nsg.id
  // route_table_id            = data.azurerm_route_table.my_rt.id
  // service_endpoints         = ["Microsoft.Storage", "Microsoft.Sql"]
  // delegations = [{
  //   name = "myservicedelegation"
  //   service_delegation = {
  //     name    = "Microsoft.ContainerInstance/containerGroups"
  //     actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
  //   }
  // }]
  // ...
}
```

## Inputs

| Name                       | Description                                                                 | Type          | Default | Required |
| -------------------------- | --------------------------------------------------------------------------- | ------------- | ------- | :------: |
| `mal_id`                   | The Management Abstraction Layer (MAL) ID for tagging and identification.   | `string`      | `null`  |   yes    |
| `resource_group_name`      | [To be filled: Name of the Resource Group where the Virtual Network resides.] | `string`      |         |   yes    |
| `vnet_name`                | [To be filled: Name of the Virtual Network to create the subnet in.]        | `string`      |         |   yes    |
| `subnet_name`              | [To be filled: Name of the subnet to create.]                               | `string`      |         |   yes    |
| `address_prefixes`         | [To be filled: List of address prefixes for the subnet (e.g., ["10.0.1.0/24"]).] | `list(string)`|         |   yes    |
| `tags`                     | [To be filled: A map of tags to assign to the Subnet.]                      | `map(string)` | `{}`    |    no    |
| `network_security_group_id`| [To be filled: ID of the Network Security Group to associate with the subnet.]| `string`      | `null`  |    no    |
| `route_table_id`           | [To be filled: ID of the Route Table to associate with the subnet.]         | `string`      | `null`  |    no    |
| `service_endpoints`        | [To be filled: List of service endpoints to enable (e.g., ["Microsoft.Storage"]).] | `list(string)`| `[]`    |    no    |
| `delegations`              | [To be filled: List of delegation blocks for services like ACI, Azure DBs.] | `list(any)`   | `[]`    |    no    |
// Add other module-specific variables

## Outputs

| Name             | Description                                                              |
| ---------------- | ------------------------------------------------------------------------ |
| `id`             | [To be filled: The ID of the created Subnet.]                            |
| `name`           | [To be filled: The name of the created Subnet.]                          |
| `address_prefix` | [To be filled: The primary address prefix of the Subnet (if single prefix used, otherwise address_prefixes).] |
| `address_prefixes`| [To be filled: The list of address prefixes of the Subnet.]             |
// Add other module-specific outputs

## Examples
[To be filled: Provide links to example usage in the `examples/` directory.]
- See `examples/usage_example.tf` (to be created) or `examples/complete/` for a more detailed deployment.

## Contributing
[To be filled: Explain how others can contribute to this module.]

## Provider Requirements

| Name    | Version |
| ------- | ------- |
| azurerm | ~> 3.0  |
| // Add other providers |         |

## Module Dependencies
[To be filled: List any other Terraform modules this module depends on, e.g., a VNet module.]
