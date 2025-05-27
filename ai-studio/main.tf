// AzAPI AIServices
resource "azapi_resource" "AIServicesResource" {
  type      = "Microsoft.CognitiveServices/accounts@2023-10-01-preview"
  name      = "ais-${local.naming}"
  location  = var.location
  parent_id = var.resource_group_id

  identity {
    type = "SystemAssigned"
  }

  body = jsonencode({
    name = "ais-${local.naming}"
    properties = {
      //restore = true
      customSubDomainName = "ais-${local.naming}"
      apiProperties = {
        statisticsEnabled = false
      }
      publicNetworkAccess = local.publicNetworkAccess
      disableLocalAuth    = var.disable_local_auth
      networkAcls : {
        defaultAction : "Allow"
        bypass : "AzureServices"
      }
    }
    kind = "AIServices"
    sku = {
      capacity = var.sku_capacity
      family   = var.sku_family
      name     = var.sku_name
      size     = var.sku_size
      tier     = var.sku_tier
    }
  })
  tags = local.tags

  response_export_values = ["*"]
}

// Azure AI Hub
resource "azapi_resource" "hub" {
  type      = "Microsoft.MachineLearningServices/workspaces@2024-04-01-preview"
  name      = "hub-${local.naming}"
  location  = var.location
  parent_id = var.resource_group_id

  identity {
    type = "SystemAssigned"
  }

  body = jsonencode({
    properties = {
      description         = "Azure AI hub: hub-${local.naming}"
      friendlyName        = "hub-${local.naming}"
      storageAccount      = var.storage_account_id
      keyVault            = data.azurerm_key_vault.kv.id
      publicNetworkAccess = local.publicNetworkAccess
      managedNetwork = {
        isolationMode = var.manage_network_isolation_mode
        # outboundRules = {
        #   {customized property} = {
        #     category = "string"
        #     status = "string"
        #     type = "string"
        #     // For remaining properties, see OutboundRule objects
        #   }
        # }
        # status = {
        #   sparkReady = bool
        #   status = "string"
        # }
      }
      systemDatastoresAuthMode = var.system_datastores_auth_mode

      /* Optional: To enable these field, the corresponding dependent resources need to be uncommented.
      applicationInsight = azurerm_application_insights.appi.id
      containerRegistry = azurerm_container_registry.cr.id
      */

      /*Optional: To enable Customer Managed Keys, the corresponding 
      encryption = {
        status = var.encryption_status
        keyVaultProperties = {
            keyVaultArmId = data.azurerm_key_vault.kv.id
            keyIdentifier = var.cmk_keyvault_key_uri
        }
      }
      */

    }
    kind = "Hub"
  })
  tags = local.tags
}

// Azure AI Project
resource "azapi_resource" "project" {
  type      = "Microsoft.MachineLearningServices/workspaces@2024-04-01-preview"
  name      = "proj-${local.naming}"
  location  = var.location
  parent_id = var.resource_group_id

  identity {
    type = "SystemAssigned"
  }

  body = jsonencode({
    properties = {
      description         = "Azure AI Project: proj-${local.naming}"
      friendlyName        = "proj-${local.naming}"
      hubResourceId       = azapi_resource.hub.id
      publicNetworkAccess = local.publicNetworkAccess
    }
    kind = "Project"
  })
  tags = local.tags
}

// AzAPI AI Services Connection
resource "azapi_resource" "AIServicesConnection" {
  type      = "Microsoft.MachineLearningServices/workspaces/connections@2024-04-01-preview"
  name      = "aisc-${local.naming}"
  parent_id = azapi_resource.hub.id

  body = jsonencode({
    properties = {
      category      = "AIServices",
      target        = jsondecode(azapi_resource.AIServicesResource.output).properties.endpoint,
      authType      = "AAD",
      isSharedToAll = true,
      metadata = {
        ApiType    = "Azure",
        ResourceId = azapi_resource.AIServicesResource.id
      }
    }
  })
  response_export_values = ["*"]
}

/* The following resources are OPTIONAL.
// APPLICATION INSIGHTS
resource "azurerm_application_insights" "appi" {
  name                = "appi=${local.naming}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  application_type    = "web"
}

// CONTAINER REGISTRY
resource "azurerm_container_registry" "cr" {
  name                     = "cr-${local.naming}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = var.location
  sku                      = "premium"
  admin_enabled            = true
}
*/

module "private-endpoint-hub-setup" {
  source                         = "../private-endpoint"
  for_each                       = var.enable_private_endpoint == true ? { this = var.enable_private_endpoint } : {}
  appname                        = var.appname
  env                            = var.env
  domain_name                    = var.domain_name
  resource_group_name            = var.resource_group_name
  a_records                      = var.a_records
  aaaa_records                   = var.aaaa_records
  cname_records                  = var.cname_records
  enable_telemetry               = var.enable_telemetry
  mx_records                     = var.mx_records
  ptr_records                    = var.ptr_records
  soa_record                     = var.soa_record
  srv_records                    = var.srv_records
  tags                           = local.tags
  txt_records                    = var.txt_records
  virtual_network_links          = var.virtual_network_links
  private_endpoints              = var.private_endpoints_hub
  location                       = data.azurerm_virtual_network.vnet.location
  subscription_id                = var.subscription_id
  virtual_network_rg             = var.virtual_network_rg
  virtual_network_name           = var.virtual_network_name
  pe_subnet_name                 = var.pe_subnet_name
  private_connection_resource_id = azapi_resource.hub.id
  dns_zone_id                    = var.dns_zone_id
  create_dns_zone                = var.create_dns_zone
  additionalcontext              = var.additionalcontext
  app_id                         = var.app_id
  environment                    = var.environment
  msftmigration                  = var.msftmigration
  depends_on                     = [azapi_resource.hub]
}

module "private-endpoint-ais-setup" {
  source                         = "../private-endpoint"
  for_each                       = var.enable_private_endpoint == true ? { this = var.enable_private_endpoint } : {}
  appname                        = var.appname
  env                            = var.env
  domain_name                    = var.domain_name
  resource_group_name            = var.resource_group_name
  a_records                      = var.a_records
  aaaa_records                   = var.aaaa_records
  cname_records                  = var.cname_records
  enable_telemetry               = var.enable_telemetry
  mx_records                     = var.mx_records
  ptr_records                    = var.ptr_records
  soa_record                     = var.soa_record
  srv_records                    = var.srv_records
  tags                           = local.tags
  txt_records                    = var.txt_records
  virtual_network_links          = var.virtual_network_links
  private_endpoints              = var.private_endpoints_ais
  location                       = data.azurerm_virtual_network.vnet.location
  subscription_id                = var.subscription_id
  virtual_network_rg             = var.virtual_network_rg
  virtual_network_name           = var.virtual_network_name
  pe_subnet_name                 = var.pe_subnet_name
  private_connection_resource_id = azapi_resource.AIServicesResource.id
  dns_zone_id                    = var.dns_zone_id
  create_dns_zone                = var.create_dns_zone
  additionalcontext              = var.additionalcontext
  app_id                         = var.app_id
  environment                    = var.environment
  msftmigration                  = var.msftmigration
  depends_on                     = [azapi_resource.AIServicesResource]
}
