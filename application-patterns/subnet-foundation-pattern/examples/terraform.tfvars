new_subnet = {
  "subnet-1" = {
    location                 = "eastus2"
    resourcetype             = "subnet"
    appid                    = "app-id"
    appname                  = "test-name"
    env                      = "test"
    additionalcontext        = "01"
    vnet_resource_group_name = "sql-mi-rg"
    vnet_name                = "test-subnet-vnet"
    service_endpoint_list    = ["Microsoft.Sql", "Microsoft.Storage"]
    address_prefix           = "10.0.0.0/28"
    subnet_delegations = {
      "MicrosoftSql" = {
        name    = "Microsoft.Sql/managedInstances"
        actions = ["Microsoft.Sql/managedInstances"]
      }
    }
    name                                          = "test-subnet"
    default_outbound_access_enabled               = true
    private_endpoint_network_policies             = "Enabled"
    private_link_service_network_policies_enabled = true
    subscription_id                               = ""
    virtual_network = {
      resource_id = ""
    }
  },

  "subnet-2" = {
    location                 = "eastus2"
    resourcetype             = "subnet"
    appid                    = "app-id"
    appname                  = "test-name"
    env                      = "test"
    additionalcontext        = "01"
    vnet_resource_group_name = "sql-mi-rg"
    vnet_name                = "test-subnet-vnet"
    service_endpoint_list    = ["Microsoft.Sql", "Microsoft.Storage"]
    address_prefix           = "10.0.16.0/28"
    subnet_delegations = {
      "MicrosoftSql" = {
        name    = "Microsoft.Sql/managedInstances"
        actions = ["Microsoft.Sql/managedInstances"]
      }
    }
    name                                          = "test-subnet-02"
    default_outbound_access_enabled               = true
    private_endpoint_network_policies             = "Enabled"
    private_link_service_network_policies_enabled = true
    subscription_id                               = ""
    virtual_network = {
      resource_id = ""
    }
  }
}


application_resource_groups = {
  rg1 = {
    name              = "rg-app-vnet1"
    appid             = "test"
    appname           = "test"
    resourcetype      = "rg"
    env               = "nonprod"
    location          = "eastus2"
    additionalcontext = "01"
    migration         = "Yes"
    app_id            = "test"
    environment       = "SANDBOX"
  }
}


nsg_association = {
  nsg1 = {
    nsg_name                 = "test-nsg"
    nsg_resource_group       = "sql-mi-rg"
    subnet_name              = "test-subnet"
    vnet_name                = "test-subnet-vnet"
    vnet_resource_group_name = "sql-mi-rg"
  },
  nsg2 = {
    nsg_name                 = "test-nsg"
    nsg_resource_group       = "sql-mi-rg"
    subnet_name              = "test-subnet-02"
    vnet_name                = "test-subnet-vnet"
    vnet_resource_group_name = "sql-mi-rg"
  }
}
