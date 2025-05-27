prod_network_deploy = {
  vnet1 = {
    name = "vnet-test-platform-test-eus2-02"
    app_id                   = "test"
    appname                  = "test"
    resourcetype             = "vnet"
    env                      = "prod"
    environment              = "PROD"
    msftmigration            = "Yes"
    location                 = "eastus2"
    additionalcontext        = "02"
    vnet_resource_group_name = "rg-vnet1"
    address_space            = ["192.168.0.0/16"]
    enable_telemetry         = false
    subnets = {

      ssdaps = {
        resourcetype                      = "snet-ssdaps"
        additionalcontext                 = "01"
        name                              = "snet-ssdaps-test-eus2-01"
        address_prefixes                  = ["192.168.0.0/28"]
        private_endpoint_network_policies = "Enabled"
        default_outbound_access_enabled   = true
        enable_telemetry                  = false
      },
      ssdaps2 = {
        resourcetype                      = "snet-ssdaps2"
        additionalcontext                 = "01"
        name                              = "snet-ssdaps2-test-eus2-01"
        address_prefixes                  = ["192.168.1.0/28"]
        private_endpoint_network_policies = "Enabled"
        default_outbound_access_enabled   = true
        enable_telemetry                  = false
      }
    }
  },
  vnet2 = {
    name = "vnet2-test-platform-test-eus2-02"
    app_id                   = "test"
    appname                  = "test"
    resourcetype             = "vnet"
    env                      = "prod"
    environment              = "PROD"
    msftmigration            = "Yes"
    location                 = "eastus2"
    additionalcontext        = "02"
    vnet_resource_group_name = "rg-vnet1"
    address_space            = ["192.158.0.0/16"]
    enable_telemetry         = false

    subnets = {

      ssdaps01 = {
        resourcetype                      = "snet-ssdaps01"
        additionalcontext                 = "01"
        name                              = "snet-ssdaps01-test-eus2-01"
        address_prefixes                  = ["192.158.0.0/28"]
        private_endpoint_network_policies = "Enabled"
        default_outbound_access_enabled   = true
        enable_telemetry                  = false
      },
      ssdaps02 = {
        resourcetype                      = "snet-ssdaps02"
        additionalcontext                 = "01"
        name                              = "snet-ssdaps02-test-eus2-01"
        address_prefixes                  = ["192.158.1.0/28"]
        private_endpoint_network_policies = "Enabled"
        default_outbound_access_enabled   = true
        enable_telemetry                  = false
      }
    }
  }
}


network_resource_groups = {
  rg1 = {
    name              = "rg-vnet1"
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


liftshift_network_deploy = {
  vnet1 = {
    name = "vnet-test-ls1-test-eus2-02"
    app_id                   = "test"
    appname                  = "test"
    resourcetype             = "vnet"
    env                      = "prod"
    environment              = "PROD"
    msftmigration            = "Yes"
    location                 = "eastus2"
    additionalcontext        = "02"
    vnet_resource_group_name = "rg-app-vnet1"
    address_space            = ["192.148.0.0/16"]
    enable_telemetry         = false

    subnets = {
      liftshift1 = {
        resourcetype                      = "snet-liftshift1"
        additionalcontext                 = "01"
        name                              = "snet-liftshift1-test-eus2-01"
        address_prefixes                  = ["192.148.0.0/28"]
        private_endpoint_network_policies = "Enabled"
        default_outbound_access_enabled   = true
        enable_telemetry                  = false
      },
      liftshift2 = {
        resourcetype                      = "snet-liftshift2"
        additionalcontext                 = "01"
        name                              = "snet-liftshift2-test-eus2-01"
        address_prefixes                  = ["192.148.1.0/28"]
        private_endpoint_network_policies = "Enabled"
        default_outbound_access_enabled   = true
        enable_telemetry                  = false
      }
    }
  },
  vnet2 = {
    name = "vnet2-test-ls2-test-eus2-02"
    app_id                   = "test"
    appname                  = "test"
    resourcetype             = "vnet"
    env                      = "prod"
    environment              = "PROD"
    msftmigration            = "Yes"
    location                 = "eastus2"
    additionalcontext        = "02"
    vnet_resource_group_name = "rg-app-vnet1"
    address_space            = ["192.138.0.0/16"]
    enable_telemetry         = false

    subnets = {
      liftshift3 = {
        resourcetype                      = "snet-liftshift3"
        additionalcontext                 = "01"
        name                              = "snet-liftshift3-test-eus2-01"
        address_prefixes                  = ["192.138.0.0/28"]
        private_endpoint_network_policies = "Enabled"
        default_outbound_access_enabled   = true
        enable_telemetry                  = false
      },
      liftshift4 = {
        resourcetype                      = "snet-liftshift4"
        additionalcontext                 = "01"
        name                              = "snet-liftshift4-test-eus2-01"
        address_prefixes                  = ["192.138.1.0/28"]
        private_endpoint_network_policies = "Enabled"
        default_outbound_access_enabled   = true
        enable_telemetry                  = false
      }
    }
  }
}

nsg_association = {
  nsg1 = {
    nsg_name                 = "test-nsg-1"
    nsg_resource_group       = "rg-vnet1"
    subnet_name              = "snet-ssdaps-test-eus2-01"
    vnet_name                = "vnet-test-platform-test-eus2-02"
    vnet_resource_group_name = "rg-vnet1"
  },
  nsg2 = {
    nsg_name                 = "test-nsg-1"
    nsg_resource_group       = "rg-vnet1"
    subnet_name              = "snet-ssdaps2-test-eus2-01"
    vnet_name                = "vnet-test-platform-test-eus2-02"
    vnet_resource_group_name = "rg-vnet1"
  },
  nsg3 = {
    nsg_name                 = "test-nsg-1"
    nsg_resource_group       = "rg-vnet1"
    subnet_name              = "snet-ssdaps01-test-eus2-01"
    vnet_name                = "vnet2-test-platform-test-eus2-02"
    vnet_resource_group_name = "rg-vnet1"
  },
  nsg4 = {
    nsg_name                 = "test-nsg-1"
    nsg_resource_group       = "rg-vnet1"
    subnet_name              = "snet-ssdaps02-test-eus2-01"
    vnet_name                = "vnet2-test-platform-test-eus2-02"
    vnet_resource_group_name = "rg-vnet1"
  },
  nsg5 = {
    nsg_name                 = "app-nsg-2"
    nsg_resource_group       = "rg-app-vnet1"
    subnet_name              = "snet-liftshift1-test-eus2-01"
    vnet_name                = "vnet-test-ls1-test-eus2-02"
    vnet_resource_group_name = "rg-app-vnet1"
  },
  nsg6 = {
    nsg_name                 = "app-nsg-2"
    nsg_resource_group       = "rg-app-vnet1"
    subnet_name              = "snet-liftshift2-test-eus2-01"
    vnet_name                = "vnet-test-ls1-test-eus2-02"
    vnet_resource_group_name = "rg-app-vnet1"
  },
  nsg7 = {
    nsg_name                 = "app-nsg-2"
    nsg_resource_group       = "rg-app-vnet1"
    subnet_name              = "snet-liftshift3-test-eus2-01"
    vnet_name                = "vnet2-test-ls2-test-eus2-02"
    vnet_resource_group_name = "rg-app-vnet1"
  },
  nsg8 = {
    nsg_name                 = "app-nsg-2"
    nsg_resource_group       = "rg-app-vnet1"
    subnet_name              = "snet-liftshift4-test-eus2-01"
    vnet_name                = "vnet2-test-ls2-test-eus2-02"
    vnet_resource_group_name = "rg-app-vnet1"
  },
}
