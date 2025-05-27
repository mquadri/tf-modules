name                = "sample name"
resource_group_name = "rg-name"
location            = "your-location"

enable_telemetry       = true
copy_paste_enabled     = true
file_copy_enabled      = false
sku                    = "Developer"
ip_connect_enabled     = true
scale_units            = 4
shareable_link_enabled = true
tunneling_enabled      = true
kerberos_enabled       = true

virtual_network = {
  "vnet" = {
    vnet_name                = "your-vnet"
    vnet_resource_group_name = "your-rg"
  }
}


public_ip = {
  "pip" = {
    name                          = "testpip"
    public_ip_name                = "pubipbastion"
    public_ip_resource_group_name = "your-rg"
  }
}
