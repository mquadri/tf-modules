module "subnet_simple_example" {
  source = "../" // Points to the parent module directory
  // Add required variables here based on the module's variables.tf
  // mal_id = "example-mal-id"
  // resource_group_name = "example-rg"    // Ensure this RG exists
  // vnet_name           = "example-vnet"  // Ensure this VNet exists in the RG
  // subnet_name         = "mySimpleSubnet"
  // address_prefixes    = ["10.0.100.0/24"]
  //
  // // Optional: Associate an NSG (ensure NSG exists and its ID is provided)
  // // network_security_group_id = "/subscriptions/your_sub_id/resourceGroups/example-rg/providers/Microsoft.Network/networkSecurityGroups/example-nsg"
  //
  // // Optional: Add service endpoints
  // // service_endpoints = ["Microsoft.Storage"]
  //
  // // Refer to the module's variables.tf and documentation for more complex configurations
  // // like delegations, route tables, etc. The 'complete' example in this directory
  // // showcases more advanced usage.
}
