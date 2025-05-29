# Terraform Module: app-gateway

## Description
[To be filled based on module specifics: Provide a brief overview of the Application Gateway module and its purpose. What kind of gateway does it create (e.g., WAF, standard)? What problems does it solve?]

## Prerequisites
[To be filled based on module specifics: List any dependencies, required permissions, or pre-existing infrastructure needed to use this module. e.g., Azure provider configured, specific virtual network and subnets, public IP addresses, certificates if applicable.]

## Usage
[To be filled based on module specifics: Provide a simple example of how to use the module. Include any required variables.]

```terraform
module "my_app_gateway" {
  source = "[source_path_or_registry_link]" // e.g., "./modules/app-gateway" or "Azure/app-gateway/azurerm"

  // Required Variables
  // resource_group_name = var.resource_group_name
  // location            = var.location
  // app_gateway_name    = "my আগw"
  // sku_name            = "Standard_v2" // or WAF_v2
  // subnet_id           = data.azurerm_subnet.my_subnet.id
  // mal_id              = var.mal_id
  
  // Frontend IP Configurations, Ports, Listeners, Backend Pools, HTTP Settings, Rules etc.
  // ... (These are highly specific to App Gateway and would need detailed input definitions)

  // Optional Variables
  // tags = {}
  // ...
}
```

## Inputs

| Name                | Description                                                                 | Type   | Default | Required |
| ------------------- | --------------------------------------------------------------------------- | ------ | ------- | :------: |
| `mal_id`            | The Management Abstraction Layer (MAL) ID for tagging and identification.   | `string` | `null`  |   yes    |
| `resource_group_name` | [To be filled: Name of the resource group.]                                 | `string` |         |   yes    |
| `location`          | [To be filled: Azure region where resources will be deployed.]              | `string` |         |   yes    |
| `app_gateway_name`  | [To be filled: Name of the Application Gateway.]                            | `string` |         |   yes    |
| `sku_name`          | [To be filled: SKU for the Application Gateway (e.g. Standard_v2, WAF_v2).] | `string` |         |   yes    |
| `subnet_id`         | [To be filled: ID of the subnet to deploy the Application Gateway into.]    | `string` |         |   yes    |
| `tags`              | [To be filled: A map of tags to assign to the resources.]                   | `map(string)` | `{}`    |    no    |
// Add other module-specific variables for frontend IPs, ports, listeners, backend pools, rules, etc.

## Outputs

| Name   | Description                                                              |
| ------ | ------------------------------------------------------------------------ |
| `id`   | [To be filled: The ID of the created Application Gateway.]               |
| `name` | [To be filled: The name of the created Application Gateway.]             |
| `frontend_ip_configurations` | [To be filled: Details of the frontend IP configurations.] |
// Add other module-specific outputs

## Examples
[To be filled: Provide links to example usage in the `examples/` directory or inline more complex scenarios if applicable.]
- See `examples/usage_example.tf` for a basic deployment.
- Submodules for `v2` and `v3` might have their own examples.

## Contributing
[To be filled: Explain how others can contribute to this module. e.g., Fork the repo, create a branch, submit a PR. Link to contribution guidelines if available.]

## Provider Requirements

| Name    | Version |
| ------- | ------- |
| azurerm | ~> 3.0  |
| // Add other providers |         |

## Module Dependencies
[To be filled: List any other Terraform modules this module depends on.]
