
subscription_id = ""
vwan_vhub = {
  "vwan-deploy-1" = {
    allow_branch_to_branch_traffic = true
    location                       = "eastus2"
    resource_group_name            = "rg-avm-vwan-test"
    virtual_wan_name               = "vwan-test-1"
    create_resource_group          = true
    type                           = "Standard"
    virtual_wan_tags = {
      resourcetype        = "user-identity"
      appid               = "ap01"
      appname             = "infra"
      env                 = "dev"
      costcostcenter      = "test"
      costvp              = "VP"
      costappownertech    = "owner"
      costappownermanager = "Manager"
      costbudgetowner     = "budget owner"
      costdivision        = "IT"
      appfunction         = "exmaple general Prod Subscription"
      costbaseline        = "2024"
      costallocation      = "sharedcost"
      monthlybudget       = "1000"
      managed_by          = "own"
      additionalcontext   = "01"
    }
    virtual_hubs = {
      "vhub_1" = {
        name           = "vhub-vwan-test-1"
        location       = "EastUS2"
        resource_group = "rg-avm-vwan-test"
        address_prefix = "10.120.0.0/23"
        tags = {
          resourcetype        = "user-identity"
          appid               = "ap01"
          appname             = "infra"
          env                 = "dev"
          costcostcenter      = "test"
          costvp              = "VP"
          costappownertech    = "owner"
          costappownermanager = "Manager"
          costbudgetowner     = "budget owner"
          costdivision        = "IT"
          appfunction         = "exmaple general Prod Subscription"
          costbaseline        = "2024"
          costallocation      = "sharedcost"
          monthlybudget       = "1000"
          managed_by          = "own"
          additionalcontext   = "01"
        }
      },
      "vhub_2" = {
        name           = "vhub-vwan-test-2"
        location       = "CentralUS"
        resource_group = "rg-avm-vwan-test"
        address_prefix = "10.121.0.0/23"
        tags = {
          resourcetype        = "user-identity"
          appid               = "ap01"
          appname             = "infra"
          env                 = "dev"
          costcostcenter      = "test"
          costvp              = "VP"
          costappownertech    = "owner"
          costappownermanager = "Manager"
          costbudgetowner     = "budget owner"
          costdivision        = "IT"
          appfunction         = "exmaple general Prod Subscription"
          costbaseline        = "2024"
          costallocation      = "sharedcost"
          monthlybudget       = "1000"
          managed_by          = "own"
          additionalcontext   = "01"
        }
      }
    }
    virtual_network_connections = {
      "vnet_int1" = {
        name                      = "test-vnet-connection-1"
        virtual_hub_key           = "vhub_1"
        remote_virtual_network_id = ""
        internet_security_enabled = true
      },
      "vnet_int2" = {
        name                      = "test-vnet-connection-2"
        virtual_hub_key           = "vhub_2"
        remote_virtual_network_id = ""
        internet_security_enabled = true
      }
    }
  }
}  