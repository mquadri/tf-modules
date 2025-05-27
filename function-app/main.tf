/**
  * Obtained the information from the URLs:
  * https://learn.microsoft.com/en-us/samples/azure-samples/azure-functions-flex-consumption-samples/terraform-based-deployment/
  * https://github.com/azure-samples/azure-functions-flex-consumption-samples/tree/main/IaC/terraform
  *
  * It is assumed that the resource group is already present
  */

data "azurerm_resource_group" "group" {
  name = lower(var.resourceGroupName)
}

resource "azapi_resource" "serverFarm" {
  type                      = "Microsoft.Web/serverfarms@2023-12-01"
  schema_validation_enabled = false
  location                  = var.location
  name                      = local.AppPlanName
  parent_id                 = data.azurerm_resource_group.group.id
  body                      = var.server_farm_body
}

module "functionApp_storage" {
  source = "../storage-account"

  count                                = var.create_storageAccount ? 1 : 0
  location                             = var.location
  resource_group_name                  = var.resourceGroupName
  tags                                 = var.tags
  name                                 = var.storageAccountName
  appname                              = var.appnameStorage
  env                                  = var.env
  additionalcontext                    = var.additionalcontext
  resourcetype                         = "st"
  appid                                = var.appid
  costAppOwnerManager                  = var.costAppOwnerManager
  costCostCenter                       = var.costCostCenter
  costbaseline                         = var.costbaseline
  costBudgetOwner                      = var.costBudgetOwner
  costVP                               = var.costVP
  costAppOwnerTech                     = var.costAppOwnerTech
  private_endpoints                    = var.storageAccountPrivateEndpoints
  sa_infrastructure_encryption_enabled = var.sa_infrastructure_encryption_enabled
  shared_access_key_enabled            = var.shared_access_key_enabled
  app_id                               = var.appid
  environment                          = var.env
  msftmigration                        = var.msftmigration
  tables                               = var.tables
}

module "functionApp_storageContainer" {
  source                 = "../storage-account-container"
  storage_container_name = local.storageContainerName
  storage_account_name   = var.storageAccountName
  depends_on             = [module.functionApp_storage, module.functionApp_resources_rbac_assignment]
}

module "functionApp_logAnalytics" {
  source = "../log-analytics-ws"

  location                                           = var.location
  resource_group_name                                = var.resourceGroupName
  appname                                            = var.malName
  env                                                = var.env
  additionalcontext                                  = var.additionalcontext
  log_analytics_workspace_sku                        = "PerGB2018"
  log_analytics_workspace_retention_in_days          = 30
  app_id                                             = var.appid
  environment                                        = var.env
  msftmigration                                      = var.msftmigration
  log_analytics_workspace_internet_ingestion_enabled = var.internet_ingestion_enabled
}

module "functionApp_appInsights" {
  source = "../app-insight"

  resource_group_name          = var.resourceGroupName
  appinsight_name              = local.applicationInsightsName
  log_analytics_workspace_name = module.functionApp_logAnalytics.name
  log_rg_name                  = var.resourceGroupName
  internet_ingestion_enabled   = var.internet_ingestion_enabled
  internet_query_enabled       = true
  diagnostics_settings_name    = local.diagnosticsName
  location                     = var.location

  depends_on    = [module.functionApp_logAnalytics.resource]
  app_id        = var.appid
  environment   = var.env
  msftmigration = var.msftmigration
}

locals {
  blobStorageAndContainer = "https://${var.storageAccountName}.blob.core.windows.net/${local.storageContainerName}"
}

resource "azurerm_user_assigned_identity" "function_app_identity" {
  count               = var.user_identity_name != null ? 1 : 0
  name                = var.user_identity_name
  resource_group_name = var.resourceGroupName
  location            = var.location
}

resource "azapi_resource" "functionApps" {
  type                      = "Microsoft.Web/sites@2023-12-01"
  schema_validation_enabled = false
  location                  = var.location
  name                      = local.AppName
  parent_id                 = data.azurerm_resource_group.group.id
  body = {
    kind = "functionapp,linux",
    identity = var.user_identity_name != null ? {
      type = "UserAssigned",
      userAssignedIdentities = {
        (azurerm_user_assigned_identity.function_app_identity[0].id) = {}
      }
      } : {
      type                   = "SystemAssigned",
      userAssignedIdentities = null
    }
    properties = {
      serverFarmId        = azapi_resource.serverFarm.id,
      httpsOnly           = var.https_traffic_only_enabled,
      publicNetworkAccess = var.public_network_access_enabled ? "Enabled" : "Disabled",
      functionAppConfig = var.server_farm_body.sku.tier == "FlexConsumption" ? {
        deployment = {
          storage = {
            type  = "blobContainer",
            value = local.blobStorageAndContainer,
            authentication = var.user_identity_name != null ? {
              type                           = "UserAssignedIdentity"
              userAssignedIdentityResourceId = azurerm_user_assigned_identity.function_app_identity[0].id
              } : {
              type = "SystemAssignedIdentity"
            }
          }
        },
        scaleAndConcurrency = {
          maximumInstanceCount = var.maximumInstanceCount,
          instanceMemoryMB     = var.instanceMemoryMB
        },
        runtime = {
          name    = var.functionAppRuntime,
          version = var.functionAppRuntimeVersion
        }
      } : null,
      siteConfig = {
        # https://learn.microsoft.com/en-us/azure/azure-functions/functions-app-settings
        appSettings = var.server_farm_body.sku.tier == "FlexConsumption" ? [
          {
            name  = "APPLICATIONINSIGHTS_CONNECTION_STRING",
            value = module.functionApp_appInsights.connection_string
          },
          {
            name  = "AzureWebJobsStorage__accountName",
            value = var.storageAccountName
          },
          {
            name  = "AzureWebJobsStorage__blobServiceUri",
            value = "https://${var.storageAccountName}.blob.core.windows.net"
          },
          {
            name  = "AzureWebJobsStorage__clientId",
            value = var.user_identity_name != null ? data.azurerm_user_assigned_identity.function_app_identity[0].client_id : null
          },
          {
            name  = "AzureWebJobsStorage__credential",
            value = var.user_identity_name != null ? "managedidentity" : null
          },
          {
            name  = "FUNCTIONS_EXTENSION_VERSION",
            value = var.functionAppWorkerRuntime
          }
          ] : [
          {
            name  = "APPLICATIONINSIGHTS_CONNECTION_STRING",
            value = module.functionApp_appInsights.connection_string
          },
          {
            name  = "AzureWebJobsStorage__accountName",
            value = data.azurerm_storage_account.blob_storage.name
          },
          {
            name  = "AzureWebJobsStorage",
            value = var.user_identity_name == null ? data.azurerm_storage_account.blob_storage.primary_blob_connection_string : null
          },
          {
            name  = "WEBSITE_RUN_FROM_PACKAGE_BLOB_MI_RESOURCE_ID",
            value = var.user_identity_name != null ? azurerm_user_assigned_identity.function_app_identity[0].id : null
          },
          {
            name  = "FUNCTIONS_WORKER_RUNTIME",
            value = var.functionAppRuntime
          },
          {
            name  = "FUNCTIONS_EXTENSION_VERSION",
            value = var.functionAppWorkerRuntime
          }
        ],
        linuxFxVersion          = var.server_farm_body.sku.tier != "FlexConsumption" ? "${var.functionAppRuntime}|${var.functionAppRuntimeVersion}" : null
        functionsRuntimeVersion = var.server_farm_body.sku.tier != "FlexConsumption" ? var.functionAppWorkerRuntime : null
        cors                    = var.cors_allowed_origins != null ? { allowedOrigins = var.cors_allowed_origins } : null
      }
    }
  }
  tags       = var.tags
  depends_on = [azapi_resource.serverFarm, module.functionApp_appInsights.resource, module.functionApp_storage, module.functionApp_storageContainer]
}


resource "azurerm_app_service_virtual_network_swift_connection" "function_app_vnet" {
  count          = var.swift_connection_subnet != null ? 1 : 0
  app_service_id = azapi_resource.functionApps.id
  subnet_id      = var.swift_connection_subnet

  depends_on = [azapi_resource.functionApps]
}

data "azurerm_linux_function_app" "fn_wrapper" {
  name                = azapi_resource.functionApps.name
  resource_group_name = var.resourceGroupName
}

data "azurerm_user_assigned_identity" "function_app_identity" {
  count               = var.user_identity_name != null ? 1 : 0
  name                = azurerm_user_assigned_identity.function_app_identity[0].name
  resource_group_name = var.resourceGroupName
  depends_on          = [azurerm_user_assigned_identity.function_app_identity]
}

data "azurerm_storage_account" "blob_storage" {
  name                = var.storageAccountName
  resource_group_name = var.resourceGroupName
  depends_on          = [module.functionApp_storage]
}


# System User
module "functionApp_service_rbac_assignment_system" {
  count   = var.user_identity_name == null ? 1 : 0
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.2.0"

  role_definitions = {
    storage = {
      name = "Storage Blob Data Owner"
    }

    functionApp = {
      name = var.functionAppRBAC
    }
  }

  user_assigned_managed_identities_by_principal_id = {
    fun1 = data.azurerm_linux_function_app.fn_wrapper.identity[0].principal_id
  }

  groups_by_display_name = {
    functionAppGroup = var.functionAppAccessADgroup
  }

  role_assignments_for_resource_groups = {
    role1 = {
      resource_group_name = var.resourceGroupName
      subscription_id     = var.subscriptionId
      role_assignments = {
        role_assignments_1 = {
          role_definition = "functionApp"
          groups          = ["functionAppGroup"]
        }
      }
    }
  }

  role_assignments_for_resources = {
    role2 = {
      resource_name       = var.storageAccountName
      resource_group_name = var.resourceGroupName
      role_assignments = {
        role_assignments_2 = {
          role_definition = "storage"
          any_principals  = ["fun1"]
        }
      }
    }
  }
  depends_on = [azapi_resource.functionApps, module.functionApp_storage]
}

# UAI
module "functionApp_service_rbac_assignment_uai" {
  count   = var.user_identity_name != null ? 1 : 0
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.2.0"

  role_definitions = {
    storage1 = {
      name = "Storage Blob Data Owner"
    }
    storage2 = {
      name = "Storage Account Contributor"
    }
    storage3 = {
      name = "Storage Queue Data Contributor"
    }
    storage4 = {
      name = "Storage Table Data Contributor"
    }
    functionApp = {
      name = var.functionAppRBAC
    }
  }

  user_assigned_managed_identities_by_principal_id = {
    fun1 = data.azurerm_user_assigned_identity.function_app_identity[0].principal_id
  }

  groups_by_display_name = {
    functionAppGroup = var.functionAppAccessADgroup
  }

  role_assignments_for_resource_groups = {
    role1 = {
      resource_group_name = var.resourceGroupName
      subscription_id     = var.subscriptionId
      role_assignments = {
        role_assignments_1 = {
          role_definition = "functionApp"
          groups          = ["functionAppGroup"]
        }
      }
    }
  }

  role_assignments_for_resources = {
    role2 = {
      resource_name       = var.storageAccountName
      resource_group_name = var.resourceGroupName
      role_assignments = {
        role_assignments_1 = {
          role_definition = "storage1"
          any_principals  = ["fun1"]
        }
        role_assignments_2 = {
          role_definition = "storage2"
          any_principals  = ["fun1"]
        }
        role_assignments_3 = {
          role_definition = "storage3"
          any_principals  = ["fun1"]
        }
        role_assignments_4 = {
          role_definition = "storage4"
          any_principals  = ["fun1"]
        }
      }
    }
  }
  depends_on = [azapi_resource.functionApps, module.functionApp_storage, azurerm_user_assigned_identity.function_app_identity]
}

#AD GROUP
module "functionApp_resources_rbac_assignment" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.2.0"

  role_definitions = {
    storage1 = {
      name = "Storage Blob Data Contributor"
    }
    storage2 = {
      name = "Storage Queue Data Contributor"
    }
    app_insights = {
      name = "Monitoring Reader"
    }
    log_analytics = {
      name = "Log Analytics Reader"
    }
    reader = {
      name = "Reader"
    }
  }

  groups_by_display_name = {
    functionAppGroup = var.functionAppAccessADgroup
  }

  role_assignments_for_resources = {
    role2 = {
      resource_name       = var.storageAccountName
      resource_group_name = var.resourceGroupName
      role_assignments = {
        role_assignments_1 = {
          role_definition = "storage1"
          groups          = ["functionAppGroup"]
        }
        role_assignments_2 = {
          role_definition = "storage2"
          groups          = ["functionAppGroup"]
        }
      }
    }
    role3 = {
      resource_name       = local.applicationInsightsName
      resource_group_name = var.resourceGroupName
      role_assignments = {
        role_assignments_1 = {
          role_definition = "app_insights"
          groups          = ["functionAppGroup"]
        }
        role_assignments_2 = {
          role_definition = "reader"
          groups          = ["functionAppGroup"]
        }
      }
    }
    role4 = {
      resource_name       = module.functionApp_logAnalytics.name
      resource_group_name = var.resourceGroupName
      role_assignments = {
        role_assignments_1 = {
          role_definition = "log_analytics"
          groups          = ["functionAppGroup"]
        }
      }
    }
  }
  depends_on = [module.functionApp_storage, module.functionApp_appInsights, module.functionApp_logAnalytics]
}
resource "azurerm_private_endpoint" "function_app" {
  count = var.functionAppPrivateEndpoint != null ? 1 : 0

  name                = var.functionAppPrivateEndpoint.name
  location            = var.location
  resource_group_name = var.functionAppPrivateEndpoint.resource_group_name
  subnet_id           = var.functionAppPrivateEndpoint.subnet_resource_id

  private_service_connection {
    name                           = var.functionAppPrivateEndpoint.private_service_connection_name
    private_connection_resource_id = azapi_resource.functionApps.id
    is_manual_connection           = false
    subresource_names              = var.functionAppPrivateEndpoint.subresource_names
  }

  private_dns_zone_group {
    name                 = var.functionAppPrivateEndpoint.private_dns_zone_group_name
    private_dns_zone_ids = var.functionAppPrivateEndpoint.private_dns_zone_resource_ids
  }

  depends_on = [azapi_resource.functionApps]
}