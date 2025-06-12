# Terraform Module: nsg (Network Security Group)

## Description
[To be filled based on module specifics: Provide a brief overview of the Network Security Group (NSG) module. Explain that it creates an Azure NSG and can be used to define a list of allowed and denied traffic rules to and from Azure resources.]

## Prerequisites
[To be filled based on module specifics: List any dependencies, required permissions, or pre-existing infrastructure. e.g., Azure provider configured, Resource Group.]

## Usage
[To be filled based on module specifics: Provide a simple example of how to use the module, including how to define security rules.]

```terraform
module "my_nsg" {
  source = "[source_path_or_registry_link]" // e.g., "./modules/nsg"

  // Required Variables
  // resource_group_name = var.resource_group_name
  // location            = var.location
  // nsg_name            = "my-nsg"
  // mal_id              = var.mal_id

  // Optional Variables
  // tags = {}
  // security_rules = [
  //   {
  //     name                       = "AllowSSH"
  //     priority                   = 100
  //     direction                  = "Inbound"
  //     access                     = "Allow"
  //     protocol                   = "Tcp"
  //     source_port_range          = "*"
  //     destination_port_range     = "22"
  //     source_address_prefix      = "Internet"
  //     destination_address_prefix = "*"
  //   },
  //   {
  //     name                       = "AllowHttp"
  //     priority                   = 110
  //     direction                  = "Inbound"
  //     access                     = "Allow"
  //     protocol                   = "Tcp"
  //     source_port_range          = "*"
  //     destination_port_range     = "80"
  //     source_address_prefix      = "Internet"
  //     destination_address_prefix = "*"
  //   }
  // ]
  // ...
}
```

## Inputs

| Name                  | Description                                                                 | Type          | Default | Required |
| --------------------- | --------------------------------------------------------------------------- | ------------- | ------- | :------: |
| `mal_id`              | The Management Abstraction Layer (MAL) ID for tagging and identification.   | `string`      | `null`  |   yes    |
| `resource_group_name` | [To be filled: Name of the Resource Group for the NSG.]                     | `string`      |         |   yes    |
| `location`            | [To be filled: Azure region where the NSG will be deployed.]                | `string`      |         |   yes    |
| `nsg_name`            | [To be filled: Name of the Network Security Group.]                         | `string`      |         |   yes    |
| `tags`                | [To be filled: A map of tags to assign to the NSG.]                         | `map(string)` | `{}`    |    no    |
| `security_rules`      | [To be filled: A list of security rule objects to apply to the NSG. Each object defines parameters like name, priority, direction, access, protocol, port ranges, and address prefixes.] | `list(any)`   | `[]`    |    no    |
// Add other module-specific variables

## Outputs

| Name   | Description                                                              |
| ------ | ------------------------------------------------------------------------ |
| `id`   | [To be filled: The ID of the created Network Security Group.]            |
| `name` | [To be filled: The name of the created Network Security Group.]          |
// Add other module-specific outputs

## Examples
[To be filled: Provide links to example usage in the `examples/` directory.]
- See `examples/usage_example.tf` for a basic deployment with custom rules.

## Contributing
[To be filled: Explain how others can contribute to this module.]

## Provider Requirements

| Name    | Version |
| ------- | ------- |
| azurerm | ~> 3.0  |
| // Add other providers |         |

## Module Dependencies
[To be filled: List any other Terraform modules this module depends on.]
