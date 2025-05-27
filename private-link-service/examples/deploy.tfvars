resource_group_name = "your-rg" # "<resource_group_name>"

private_link_services = {
  pls1 = {
    name                                        = "privatelinkservice"                                                                                                                           # "<private_link_service_name>"
    frontend_ip_config_name                     = "LoadBalancerFrontEnd"                                                                                                                         # "<lb_frontend_name>"
    subnet_id                                   = "/subscriptions/subs/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/your-vnet/subnets/your-subnet-name"                         # "<subnet_id>"
    private_ip_address                          = null                                                                                                                                           # "<private_ip_address>"
    private_ip_address_version                  = "IPv4"                                                                                                                                         # "<private_ip_address_version>"
    visibility_subscription_ids                 = null                                                                                                                                           # <["00000000-0000-0000-0000-000000000000"]>
    load_balancer_frontend_ip_configuration_ids = ["/subscriptions/subs/resourceGroups/your-rg/providers/Microsoft.Network/loadBalancers/your-lb/frontendIPConfigurations/LoadBalancerFrontEnd"] # <["00000000-0000-0000-0000-000000000000"]>
    auto_approval_subscription_ids              = null
    enable_proxy_protocol                       = false         # <-- Add this attribute if needed
    lb_resource_group                           = "your-rg"     # <-- Add this attribute if needed
    loadbalancer_name                           = "your-lb"     # <-- Add this attribute if needed
    location                                    = "your-loc"    # <-- Add this attribute if needed
    networking_resource_group                   = "your-rg"     # <-- Add this attribute if needed
    pls_resource_group                          = "your-rg"     # <-- Add this attribute if needed
    subnet_name                                 = "your-subnet" # <-- Add this attribute if needed
    vnet_name                                   = "your-vnet"   # <-- Add this attribute if needed
  }
}

private_link_services_tags = {
  iac = "Terraform"
  env = "UAT"
}
