# Terraform Module: private-dns-zone

## Description
[To be filled based on module specifics: Provide a brief overview of the Private DNS Zone module. Explain that it creates an Azure Private DNS Zone, which can be used for custom DNS resolution within a Virtual Network. It can also be linked to VNETs for automatic registration of VM DNS records or resolution of records within the zone from the VNET.]

## Prerequisites
[To be filled based on module specifics: List any dependencies, required permissions, or pre-existing infrastructure. e.g., Azure provider configured, Resource Group.]

## Usage
[To be filled based on module specifics: Provide a simple example of how to use the module.]

```terraform
module "my_private_dns_zone" {
  source = "[source_path_or_registry_link]" // e.g., "./modules/private-dns-zone"

  // Required Variables
  // resource_group_name = var.resource_group_name
  // zone_name           = "myprivate.zone.com" // Or privatelink.blob.core.windows.net for PE scenarios
  // mal_id              = var.mal_id

  // Optional Variables
  // tags = {}
  // virtual_network_links = { // Example of VNET links
  //   "myvnetlink" = {
  //     virtual_network_id = data.azurerm_virtual_network.myvnet.id
  //     registration_enabled = false
  //   }
  // }
  // a_records = { // Example A records
  //   "myrecord" = {
  //     ttl     = 300
  //     records = ["10.0.0.5"]
  //   }
  // }
  // ... (add other record types like CNAME, TXT, etc.)
}
```

## Inputs

| Name                  | Description                                                                 | Type          | Default | Required |
| --------------------- | --------------------------------------------------------------------------- | ------------- | ------- | :------: |
| `mal_id`              | The Management Abstraction Layer (MAL) ID for tagging and identification.   | `string`      | `null`  |   yes    |
| `resource_group_name` | [To be filled: Name of the resource group for the Private DNS Zone.]        | `string`      |         |   yes    |
| `zone_name`           | [To be filled: Name of the Private DNS Zone (e.g., mycompany.local, privatelink.blob.core.windows.net).] | `string`      |         |   yes    |
| `tags`                | [To be filled: A map of tags to assign to the Private DNS Zone.]            | `map(string)` | `{}`    |    no    |
| `virtual_network_links` | [To be filled: A map of virtual network links to create. Key is link name, value contains virtual_network_id and registration_enabled flag.] | `any`       | `{}`    |    no    |
| `a_records`           | [To be filled: A map of A records to create. Key is record name, value contains ttl and list of records (IPs).] | `any`       | `{}`    |    no    |
| `cname_records`       | [To be filled: A map of CNAME records. Key is record name, value contains ttl and record (alias).] | `any`       | `{}`    |    no    |
| `txt_records`         | [To be filled: A map of TXT records. Key is record name, value contains ttl and list of record objects (each with a list of values).] | `any`       | `{}`    |    no    |
// Add other record types and module-specific variables

## Outputs

| Name   | Description                                                              |
| ------ | ------------------------------------------------------------------------ |
| `id`   | [To be filled: The ID of the created Private DNS Zone.]                  |
| `name` | [To be filled: The name of the created Private DNS Zone.]                |
| `number_of_record_sets` | [To be filled: The number of record sets in the zone.]   |
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
