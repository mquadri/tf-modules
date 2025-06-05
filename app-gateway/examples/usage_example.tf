module "app_gateway_main_example" {
  source = "../" // Assuming this example is for the main app-gateway module
  // Add required variables here based on the module's variables.tf
  // mal_id = "example-mal-id" // Assuming mal_id would be a standard variable
  // resource_group_name = "example-rg"
  // location = "eastus"
  // app_gateway_name = "example-agw"
  // sku_name = "Standard_v2"
  // subnet_id = "replace_with_actual_subnet_id"
  //
  // Note: App Gateway requires extensive configuration for:
  // - Frontend IP Configurations (Public/Private)
  // - Frontend Ports
  // - Backend Address Pools
  // - HTTP Settings (Probes, etc.)
  // - Listeners (linking Frontend IP/Port to Backend Pool via HTTP Setting)
  // - Request Routing Rules
  // - WAF Configuration (if WAF SKU)
  // - SSL Certificates
  // Refer to the module's variables.tf and documentation for detailed inputs.
}
