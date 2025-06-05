module "load_balancer_example" {
  source = "../"
  // Add required variables here based on the module's variables.tf
  // mal_id = "example-mal-id" // Assuming mal_id would be a standard variable
  // resource_group_name = "example-rg"
  // location = "eastus"
  // load_balancer_name = "example-lb"
  // sku = "Standard"
  // frontend_ip_configuration_name = "publicFrontendIP"
  // public_ip_address_id = "replace_with_actual_public_ip_id" // or use private IP settings via subnet_id
  //
  // Note: Load Balancer configuration can be complex and requires defining:
  // - Backend Address Pools
  // - Health Probes
  // - Load Balancing Rules
  // - Inbound NAT Rules (optional)
  // Refer to the module's variables.tf and documentation for detailed inputs.
}
