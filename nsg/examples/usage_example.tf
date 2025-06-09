# Example usage of the NSG module
module "nsg_example" {
  source = "../" # Points to the parent NSG module directory
  # Required variables
  name                = "example-nsg"
  resource_group_name = azurerm_resource_group.example_rg.name
  location            = azurerm_resource_group.example_rg.location

  # Example security rules (customize as needed)
  security_rules = {
    "allow_rdp_from_myip" = {
      name                       = "AllowRDP_From_MyIP" # Be restrictive with RDP
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "203.0.113.0/24" # IMPORTANT: Change this to your IP!
      destination_address_prefix = "*"
      description                = "Allow RDP from specific IP range"
    }
    "allow_web_inbound" = {
      name                       = "AllowWebInbound"
      priority                   = 250
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443" # HTTPS
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
      description                = "Allow HTTPS traffic from internet"
    }
    "deny_all_outbound_example" = {
      name                       = "DenyAllOutboundExample" # Example of an outbound rule
      priority                   = 500
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "*" # Any protocol
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      description                = "Example deny all outbound rule"
    }
  }
  msftmigration = var.msftmigration
  app_id        = var.app_id
  environment   = var.environment
  tags = {
    Environment = "Example"
    Purpose     = "NSGUsageExample"
    Owner       = "DevOps Team"
  }
}

# It's good practice to define a resource group for the example if it doesn't exist
resource "azurerm_resource_group" "example_rg" {
  name     = "example-rg-nsg"
  location = "eastus" # Or the location you prefer

  tags = {
    Environment = "Example"
    Purpose     = "NSG Example Resource Group"
  }
}

# Output values for reference
output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = module.nsg_example.resource_id
}

output "nsg_name" {
  description = "The name of the Network Security Group"
  value       = module.nsg_example.name
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.example_rg.name
}
