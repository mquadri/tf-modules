# Complete example demonstrating all features of the ACR module

# Provider configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.89.0"
    }
  }
  required_version = ">= 1.0.0, < 2.0.0"
}

provider "azurerm" {
  features {}
}

# Resource group for all resources
resource "azurerm_resource_group" "example" {
  name     = "rg-acr-example-complete"
  location = "eastus2"
  tags = {
    Example = "Complete ACR Module Demo"
  }
}

# Virtual network for private endpoints
resource "azurerm_virtual_network" "example" {
  name                = "vnet-acr-example"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Subnet for private endpoints
resource "azurerm_subnet" "endpoints" {
  name                 = "snet-endpoints"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]

  # Required for private endpoints
  # private_endpoint_network_policies_enabled = true
}

# Private DNS Zone for ACR
resource "azurerm_private_dns_zone" "acr" {
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.example.name
}

# Link the private DNS zone to the virtual network
resource "azurerm_private_dns_zone_virtual_network_link" "acr" {
  name                  = "link-to-vnet"
  resource_group_name   = azurerm_resource_group.example.name
  private_dns_zone_name = azurerm_private_dns_zone.acr.name
  virtual_network_id    = azurerm_virtual_network.example.id
  registration_enabled  = false
}

# Log Analytics Workspace for diagnostics
resource "azurerm_log_analytics_workspace" "example" {
  name                = "law-acr-example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# ACR Module with all features
module "acr" {
  source = "../../acr" # Path to the module

  # Basic configurations
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  acr_name_override   = "acrexamplecomplete"

  # SKU and access settings
  sku                           = "Premium" # Required for many advanced features
  admin_enabled                 = false
  public_network_access_enabled = false
  anonymous_pull_enabled        = false
  export_policy_enabled         = true

  # Mandatory tags
  app_id        = "APP0001"
  environment   = "DEV"
  msftmigration = "Phase1"
  mal_id        = "MAL12345"

  # Additional tags
  tags = {
    Owner       = "ACR Team"
    Application = "Container Registry Demo"
    CostCenter  = "123456"
  }

  # Private endpoints configuration
  private_endpoints = {
    "endpoint1" = {
      name                            = "pe-acr-example"
      private_service_connection_name = "psc-acr-example"
      private_dns_zone_group_name     = "pdzg-acr-example"
      location                        = azurerm_resource_group.example.location
      resource_group_name             = azurerm_resource_group.example.name
      subnet_resource_id              = azurerm_subnet.endpoints.id
      private_dns_zone_resource_ids   = [azurerm_private_dns_zone.acr.id]
    }
  }

  # Diagnostic settings
  diagnostic_settings = {
    "diag1" = {
      name                  = "diag-acr-example"
      log_categories        = []
      log_groups            = ["allLogs"]
      metric_categories     = ["AllMetrics"]
      workspace_resource_id = azurerm_log_analytics_workspace.example.id
    }
  }

  # Enable network rules
  enable_network_rules        = true
  network_rule_default_action = "Deny"
  network_rule_ip_rules = [
    {
      action   = "Allow"
      ip_range = "203.0.113.0/24"
    }
  ]
  network_rule_virtual_network_rules = [
    {
      action    = "Allow"
      subnet_id = azurerm_subnet.endpoints.id
    }
  ]

  # Enable retention policy
  enable_retention_policy = true
  retention_policy_days   = 14

  # Enable content trust
  enable_content_trust = true

  # Enable quarantine policy
  enable_quarantine_policy = true

  # Georeplications (Premium SKU only)
  georeplications = [
    {
      location                = "westus2"
      zone_redundancy_enabled = true
    }
  ]
}

# Outputs for the example
output "acr_name" {
  description = "The name of the Azure Container Registry"
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "The login server URL for the ACR"
  value       = module.acr.acr_login_server
}

output "acr_resource_id" {
  description = "The resource ID of the ACR"
  value       = module.acr.acr_resource_id
}

output "private_endpoint_id" {
  description = "The resource ID of the private endpoint"
  value       = values(module.acr.private_endpoints)[0].id
}
