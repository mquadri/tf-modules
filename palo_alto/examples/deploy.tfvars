nva = {
  "eastus" = {
    name    = "nva-eastus"
    region  = "eastus"
    vhub_id = "/subscriptions/subs/resourceGroups/rg/providers/Microsoft.Network/virtualHubs/vhub-eastus"
  },
  "westus" = {
    name    = "nva-westus"
    region  = "westus"
    vhub_id = "/subscriptions/subs/resourceGroups/rg/providers/Microsoft.Network/virtualHubs/vhub-westus"
  }
}

firewall = {
  "eastus" = {
    name                = "fw-eastus"
    resource_group_name = "rg-eastus"
    region              = "eastus"
    vhub_id             = "/subscriptions/subs/resourceGroups/rg/providers/Microsoft.Network/virtualHubs/vhub-eastus"
    public_ip_id        = "/subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/rg-eastus/providers/Microsoft.Network/publicIPAddresses/fw-pip-eastus"
    panorama_config     = "bXkgc3RyaW5n"
  },
  "westus" = {
    name                = "fw-westus"
    resource_group_name = "rg-westus"
    region              = "westus"
    vhub_id             = "/subscriptions/subs/resourceGroups/rg/providers/Microsoft.Network/virtualHubs/vhub-westus"
    public_ip_id        = "/subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/rg-westus/providers/Microsoft.Network/publicIPAddresses/fw-pip-westus"
    panorama_config     = "bXkgc3RyaW5n"
  }
}

routing_intent = {
  "eastus" = {
    name            = "routing-intent-eastus"
    region          = "eastus"
    vhub_id         = "/subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/rg-eastus/providers/Microsoft.Network/virtualHubs/vhub-eastus"
    routing_policies = [
      {
        policy_name  = "policy-eastus-1"
        destinations = ["10.1.0.0/16", "10.2.0.0/16"]
      },
      {
        policy_name  = "policy-eastus-2"
        destinations = ["10.5.0.0/16", "10.6.0.0/16"]
      }
    ]
  },
  "westus" = {
    name            = "routing-intent-westus"
    region          = "westus"
    vhub_id         = "/subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/rg-westus/providers/Microsoft.Network/virtualHubs/vhub-westus"
    routing_policies = [
      {
        policy_name  = "policy-westus-1"
        destinations = ["10.3.0.0/16", "10.4.0.0/16"]
      },
      {
        policy_name  = "policy-westus-2"
        destinations = ["10.7.0.0/16", "10.8.0.0/16"]
      }
    ]
  }
}
