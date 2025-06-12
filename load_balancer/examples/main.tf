locals {
  # tflint-ignore: terraform_unused_declarations
  naming = "${var.appname}${var.env}"
}

# This is required for resource modules
# Creates a resource group
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# Creates a virtual network
data "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.this.name
}

# tflint-ignore: terraform_unused_declarations
data "azurerm_subnet" "this" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_virtual_network.this.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.this.name
}

data "azurerm_log_analytics_workspace" "this" {
  name                = var.log_analytics_workspace
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_role_definition" "this" {
  name = var.builtin_role
}
data "azurerm_client_config" "this" {}

module "loadbalancer" {
  source                     = "../"
  enable_telemetry           = var.enable_telemetry
  name                       = var.name
  location                   = data.azurerm_resource_group.this.location
  resource_group_name        = data.azurerm_resource_group.this.name
  frontend_ip_configurations = var.frontend_ip_configurations
  diagnostic_settings = {
    diagnostic_settings_1 = {
      name                  = var.diagnostic_settings_name
      workspace_resource_id = data.azurerm_log_analytics_workspace.this.id
    }
  }
  role_assignments = {
    role_assignment_1 = {
      role_definition_id_or_name = data.azurerm_role_definition.this.name
      principal_id               = data.azurerm_client_config.this.object_id
    }
  }
  /*
backend_address_pools = {
    pool1 = {
      name = "myBackendPool"
    }
  }

  backend_address_pool_addresses = {
    address1 = {
      name                             = "${azurerm_network_interface.example_1.name}-ipconfig1" # must be unique if multiple addresses are used
      backend_address_pool_object_name = "pool1"
      ip_address                       = azurerm_network_interface.example_1.private_ip_address
      virtual_network_resource_id      = azurerm_virtual_network.example.id
    }
  }

  # Health Probe(s)
  lb_probes = {
    tcp1 = {
      name     = "myHealthProbe"
      protocol = "Tcp"
    }
  }

  # Load Balaner rule(s)
  lb_rules = {
    http1 = {
      name                           = "myHTTPRule"
      frontend_ip_configuration_name = "myFrontend"

      backend_address_pool_object_names = ["pool1"]
      protocol                          = "Tcp"
      frontend_port                     = 80
      backend_port                      = 80

      probe_object_name = "tcp1"

      idle_timeout_in_minutes = 15
      enable_tcp_reset        = true
    }
  }
  */

  app_id        = var.app_id
  msftmigration = var.msftmigration
  environment   = var.environment

}