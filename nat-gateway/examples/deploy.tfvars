natgateways = {
  natgw1 = {
    location                = "East US"
    name                    = "nat-gateway-1"
    resource_group_name     = "rg-test"
    enable_telemetry        = true
    idle_timeout_in_minutes = 15
    public_ip_configuration = {
      allocation_method       = "Static"
      ddos_protection_mode    = "VirtualNetworkInherited"
      idle_timeout_in_minutes = 30
      ip_version              = "IPv4"
      sku                     = "Standard"
      sku_tier                = "Regional"
      tags = {
        environment = "prod"
        app         = "web-app"
      }
    }
    public_ips = {
      public_ip1 = {
        name = "natgw1-public-ip-1"
      }
    }
    sku_name = "Standard"
    subnet_associations = {
      subnet1 = {
        resource_id = "/subscriptions/subs/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/testing-nat/subnets/default"
      }
    }
    tags = {
      environment = "prod"
      app         = "web-app"
    }
  }

}
