name                = "nsg-1"
location            = "eastus2"
resource_group_name = "test-rg"
security_rules = {
  "rule01" = {
    name                       = "rule-1"
    access                     = "Deny"
    destination_address_prefix = "*"
    destination_port_range     = "80-88"
    direction                  = "Outbound"
    priority                   = 100
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
  },
  "rule02" = {
    name                       = "rule-2"
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_ranges    = ["80", "443"]
    direction                  = "Inbound"
    priority                   = 200
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }
}