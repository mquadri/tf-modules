# Terraform Module: private-endpoint

## Description
[To be filled based on module specifics: Provide a brief overview of the Private Endpoint module. Explain that it creates a network interface in a specified subnet to connect privately to Azure PaaS services (or services fronted by Azure Private Link).]

## Prerequisites
[To be filled based on module specifics: List any dependencies, required permissions, or pre-existing infrastructure. e.g., Azure provider configured, existing Virtual Network and Subnet with private endpoint network policies disabled, ID of the resource to connect to, group ID (sub-resource) of the target resource.]

## Usage
[To be filled based on module specifics: Provide a simple example of how to use the module.]

```terraform
module "my_private_endpoint" {
  source = "[source_path_or_registry_link]" // e.g., "./modules/private-endpoint"

  // Required Variables
  // resource_group_name          = var.resource_group_name
  // location                     = var.location
  // private_endpoint_name        = "my-pe"
  // subnet_id                    = data.azurerm_subnet.my_subnet.id
  // private_link_service_id    = data.azurerm_storage_account.example.id // ID of the service to connect to
  // private_link_subresource_name = "blob" // e.g., blob, sqlServer, vault, etc.
  // mal_id                       = var.mal_id

  // Optional Variables
  // tags = {}
  // private_dns_zone_group_name = "default"
  // private_dns_zone_ids        = [data.azurerm_private_dns_zone.example.id]
  // ...
}
```

## Inputs

| Name                        | Description                                                                 | Type          | Default | Required |
| --------------------------- | --------------------------------------------------------------------------- | ------------- | ------- | :------: |
| `mal_id`                    | The Management Abstraction Layer (MAL) ID for tagging and identification.   | `string`      | `null`  |   yes    |
| `resource_group_name`       | [To be filled: Name of the resource group for the Private Endpoint.]        | `string`      |         |   yes    |
| `location`                  | [To be filled: Azure region where the Private Endpoint will be deployed.]   | `string`      |         |   yes    |
| `private_endpoint_name`     | [To be filled: Name of the Private Endpoint resource.]                      | `string`      |         |   yes    |
| `subnet_id`                 | [To be filled: ID of the subnet where the Private Endpoint's NIC will be created.] | `string`      |         |   yes    |
| `private_link_service_id` | [To be filled: Resource ID of the service to which the private endpoint should connect.] | `string`      |         |   yes    |
| `private_link_subresource_name` | [To be filled: The sub-resource name from the Private Link service that this Private Endpoint should connect to (e.g., 'blob', 'sqlServer').] | `string`   |         |   yes    |
| `tags`                      | [To be filled: A map of tags to assign to the Private Endpoint.]            | `map(string)` | `{}`    |    no    |
| `private_dns_zone_group_name` | [To be filled: Name of the Private DNS Zone Group to create (if managing DNS).]| `string`      | `null`  |    no    |
| `private_dns_zone_ids`      | [To be filled: List of Private DNS Zone IDs to link with the endpoint (if managing DNS).]| `list(string)`| `[]`    |    no    |
// Add other module-specific variables

## Outputs

| Name   | Description                                                              |
| ------ | ------------------------------------------------------------------------ |
| `id`   | [To be filled: The ID of the created Private Endpoint.]                  |
| `name` | [To be filled: The name of the created Private Endpoint.]                |
| `nic_id` | [To be filled: The ID of the Network Interface created by the Private Endpoint.] |
// Add other module-specific outputs

## Examples
[To be filled: Provide links to example usage in the `examples/` directory.]
- See `examples/usage_example.tf` for a basic deployment.

## Contributing
[To be filled: Explain how others can contribute to this module.]

## Provider Requirements

| Name    | Version |
| ------- | ------- |
| azurerm | ~> 3.0  |
| // Add other providers |         |

## Module Dependencies
[To be filled: List any other Terraform modules this module depends on.]
