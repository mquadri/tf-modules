backend_address_pools = {
  pool1 = {
    name      = "backend-pool-1"
    addresses = ["10.0.0.4"]
  }
}

backend_http_settings = {
  setting1 = {
    name                  = "http-setting-1"
    protocol              = "Http"
    port                  = 80
    cookie_based_affinity = "Disabled"
  }
}

frontend_ports = {
  port1 = {
    name = "frontend-port-1"
    port = 80
  }
}

gateway_ip_configuration = {
  name = "gateway-ip-config-1"
}

subnet_name = "default"
vnet_name   = "testingvnet"
subnet_rg   = "rg-for-subnet"

http_listeners = {
  listener1 = {
    name = "http-listener-1"
    # frontend_ip_configuration_name = "frontend-ip-1"
    frontend_port_name = "frontend-port-1"
    protocol           = "Http"
  }
}

location = "East US"
name     = "example-app-gateway"

request_routing_rules = {
  rule1 = {
    name                       = "rule-1"
    rule_type                  = "Basic"
    http_listener_name         = "http-listener-1" # Correct attribute name
    backend_address_pool_name  = "backend-pool-1"
    backend_http_settings_name = "http-setting-1"
    priority                   = 1
  }
}

resource_group_name = "app-gateway-test1312"

waf_firewall_policy = {
  waf = {
    waf_name                = "appgwtest1313"
    waf_resource_group_name = "app-gateway-test1312"
  }
}

create_public_ip = true

sku = {
  name     = "WAF_v2" # Change this to WAF_v2
  tier     = "WAF_v2" # Make sure the tier matches
  capacity = 2
}

tags = {
  environment = "Production"
  owner       = "Team XYZ"
}

# Define frontend IP configurations
frontend_ip_configuration_private = {
  name                          = "frontend-ip-1"
  private_ip_address            = "10.0.0.10" # Use your desired private IP address
  private_ip_address_allocation = "Static"
}
