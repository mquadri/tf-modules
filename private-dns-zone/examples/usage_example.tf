module "private_dns_zone_example" {
  source = "../" 
  // Add required variables here based on the module's variables.tf
  // mal_id = "example-mal-id" // Assuming mal_id would be a standard variable
  // resource_group_name = "example-rg"
  // zone_name = "example.myprivatedns.com" 
  //
  // // Optional: Link to a VNet
  // // virtual_network_links = {
  // //   "myVnetLink" = {
  // //     virtual_network_id = "replace_with_actual_vnet_id"
  // //     registration_enabled = false 
  // //   }
  // // }
  //
  // // Optional: Add some records
  // // a_records = {
  // //   "host1" = {
  // //     ttl = 300
  // //     records = ["10.1.0.5"]
  // //   }
  // //   "host2" = {
  // //     ttl = 300
  // //     records = ["10.1.0.6"]
  // //   }
  // // }
  //
  // // Refer to the module's variables.tf and documentation for detailed inputs
  // // regarding record types (A, AAAA, CNAME, MX, PTR, SRV, TXT) and VNet links.
}
