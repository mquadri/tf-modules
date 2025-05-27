enable_telemetry           = false
name                       = "example-azure-firewall"
resource_group_name        = "example-tesing"
policy_resource_group_name = "test-rg"
location                   = "eastus"
firewall_sku_tier          = "Standard"
firewall_sku_name          = "AZFW_VNet"
firewall_zones             = ["1", "2", "3"]
firewall_policy_name       = "example-azure-firewall-policy"
public_ip = {
  pip = {
    name                          = "testpip"
    public_ip_name                = "test-ip"
    public_ip_resource_group_name = "example-tesing"

  }
}

public_ip_management = {
  pip = {
    name                          = "managementpip"
    public_ip_name                = "test-management-ip"
    public_ip_resource_group_name = "example-tesing"

  }
}
virtual_network = {
  vnet = {
    vnet_name                = "example-vnet"
    vnet_resource_group_name = "example-tesing"

  }
}

virtual_network_management = {
  vnet = {
    vnet_name                = "example-vnet"
    vnet_resource_group_name = "example-tesing"

  }
}

