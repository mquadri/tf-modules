module "private_endpoint_example" {
  source = "../" 
  // Add required variables here based on the module's variables.tf
  // mal_id = "example-mal-id" // Assuming mal_id would be a standard variable
  // resource_group_name = "example-rg"
  // location = "eastus"
  // private_endpoint_name = "example-pe"
  // subnet_id = "replace_with_actual_subnet_id"
  // private_link_service_id = "replace_with_target_resource_id" // e.g., ID of a storage account, key vault, etc.
  // private_link_subresource_name = "blob" // or "vault", "sqlServer" etc. - this depends on the target service
  //
  // Note: Private Endpoint creation might also involve Private DNS Zone configuration
  // for name resolution, which is not shown in this basic example.
  // Refer to the module's variables.tf and documentation for detailed inputs.
}
