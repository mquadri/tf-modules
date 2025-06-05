# tflint-ignore: terraform_required_providers
# terraform {
#   required_version = ">=0.13"
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#     }
#   }
# }

locals {
  naming = "${var.resourcetype}${var.appname}${var.env}"
  name   = var.name != null ? var.name : "${local.naming}${var.additionalcontext}"
  tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    costDivision        = var.costDivision
    costRegion          = var.location
    costVP              = var.costVP
    environment         = var.env
    costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
    appFunction         = var.appFunction
    monthlyBudget       = var.monthlyBudget
    costbaseline        = var.costbaseline #(year resource created)
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
  }
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "storageaccount" {
  name                              = local.name
  resource_group_name               = data.azurerm_resource_group.this.name
  location                          = var.location
  account_tier                      = var.account_tier
  account_kind                      = var.account_kind
  access_tier                       = "Hot"
  account_replication_type          = var.account_replication_type
  public_network_access_enabled     = false
  allow_nested_items_to_be_public   = false
  is_hns_enabled                    = var.is_hsn_enabled
  infrastructure_encryption_enabled = var.sa_infrastructure_encryption_enabled
  default_to_oauth_authentication   = true
  tags                              = local.tags
  min_tls_version                   = var.min_tls_version

  lifecycle {
    # Validate the is_hns_enabled needs to be true when account_tier is Standard or when account_tier is Premium and account_kind is BlockBlobStorage
    precondition {
      condition     = (var.is_hsn_enabled ? (var.account_tier == "Standard" || (var.account_tier == "Premium" && var.account_kind == "BlockBlobStorage")) : true)
      error_message = "This can only be true when account_tier is Standard or when account_tier is Premium and account_kind is BlockBlobStorage. Current value is ${var.is_hsn_enabled}"
    }
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "dlfs" {
  name               = "sadlfs${local.naming}${var.additionalcontext}"
  storage_account_id = azurerm_storage_account.storageaccount.id
}

resource "azurerm_private_endpoint" "registry_pe" {
  name                = "pe-${local.naming}-${var.additionalcontext}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.this.name
  subnet_id           = var.subnet_id
  tags                = local.tags

  private_service_connection {
    name                           = "psc-${local.naming}-${var.additionalcontext}"
    private_connection_resource_id = azurerm_storage_account.storageaccount.id
    is_manual_connection           = false
    subresource_names              = ["dfs"]
  }

  private_dns_zone_group {
    name                 = "pe-${local.naming}-${var.additionalcontext}"
    private_dns_zone_ids = [var.private_dns_zone_ids]
  }
}
resource "azurerm_private_endpoint" "additional_pe" {
  count = length(var.additional_private_endpoints)

  name                = "pe-${var.additional_private_endpoints[count.index].subresource_name}-${local.naming}-${var.additionalcontext}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.this.name
  subnet_id           = var.subnet_id
  tags                = local.tags

  private_service_connection {
    name                           = "psc-${var.additional_private_endpoints[count.index].subresource_name}-${local.naming}-${var.additionalcontext}"
    private_connection_resource_id = azurerm_storage_account.storageaccount.id
    is_manual_connection           = false
    subresource_names              = [var.additional_private_endpoints[count.index].subresource_name]
  }

  private_dns_zone_group {
    name                 = "pe-${var.additional_private_endpoints[count.index].subresource_name}-${local.naming}-${var.additionalcontext}"
    private_dns_zone_ids = [var.additional_private_endpoints[count.index].private_dns_zone_id]
  }
}


