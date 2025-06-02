module "nsg_example" {
  source = "../" // Points to the parent NSG module directory
  // Add required variables here based on the module's variables.tf
  // mal_id = "example-mal-id"
  // resource_group_name = "example-rg"    // Ensure this RG exists
  // location            = "eastus"        // Or use var.location from calling module
  // nsg_name            = "myExampleNsg"
  //
  // // Example security rules (customize as needed)
  // security_rules = [
  //   {
  //     name                       = "AllowRDP_From_MyIP" // Be restrictive with RDP
  //     priority                   = 200
  //     direction                  = "Inbound"
  //     access                     = "Allow"
  //     protocol                   = "Tcp"
  //     source_port_range          = "*"
  //     destination_port_range     = "3389"
  //     source_address_prefix      = "YOUR_HOME_OR_OFFICE_IP" // IMPORTANT: Change this!
  //     destination_address_prefix = "*"
  //   },
  //   {
  //     name                       = "AllowWebInbound"
  //     priority                   = 250
  //     direction                  = "Inbound"
  //     access                     = "Allow"
  //     protocol                   = "Tcp"
  //     source_port_range          = "*"
  //     destination_port_range     = "443" // HTTPS
  //     source_address_prefix      = "Internet"
  //     destination_address_prefix = "*"
  //   },
  //   {
  //     name                       = "DenyAllOutboundExample" // Example of an outbound rule
  //     priority                   = 500
  //     direction                  = "Outbound"
  //     access                     = "Deny"
  //     protocol                   = "*" // Any protocol
  //     source_port_range          = "*"
  //     destination_port_range     = "*"
  //     source_address_prefix      = "*"
  //     destination_address_prefix = "*"
  //   }
  // ]
  //
  // tags = {
  //   Environment = "Example"
  //   Purpose     = "NSGUsageExample"
  // }
}

// Required provider configuration (can be in a separate providers.tf)
// terraform {
//   required_providers {
//     azurerm = {
//       source  = "hashicorp/azurerm"
//       version = "~> 3.0"
//     }
//   }
// }

// provider "azurerm" {
//   features {}
//   // subscription_id = "your_subscription_id" // Optional: if not set by environment variables
//   // client_id       = "your_client_id"
//   // client_secret   = "your_client_secret"
//   // tenant_id       = "your_tenant_id"
// }

// It's good practice to define a resource group for the example if it doesn't exist
// resource "azurerm_resource_group" "example_rg" {
//   name     = "example-rg-nsg"
//   location = "eastus" // Or the location you prefer
// }
