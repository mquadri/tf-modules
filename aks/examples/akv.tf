locals {
  akv_role_assigments = {
    "akv-admin" = {
      role_definition_id_or_name = "Key Vault Administrator"
      principal_id               = "6f05960f-d159-4380-be3f-a08be559590f" ## azad.ccoe.contributor
    },
    "akv-ccoe-reader" = {
      role_definition_id_or_name = "Key Vault Secrets Officer"
      principal_id               = "6f05960f-d159-4380-be3f-a08be559590f"
    },
    "akv-spn-secrets-user" = {
      role_definition_id_or_name = "Key Vault Secrets User"
      principal_id               = data.azuread_group.aks_cluster_admin_group.id
    }
    "aks-umi-kv-admin" = {
      role_definition_id_or_name = "Key Vault Administrator"
      principal_id               = module.aks.aks_spn.principal_id
    }
  }
}


module "akv" {
  source                     = "github.com/CenturyLink/tf-modules-azure//key-vault?ref=2.8.0"
  appid                      = local.hca_tags.appid
  appname                    = "lumenshared"
  resourcetype               = "akv"
  costAppOwnerManager        = local.hca_tags.costAppOwnerManager
  costAppOwnerTech           = local.hca_tags.costAppOwnerTech
  costBudgetOwner            = local.hca_tags.costBudgetOwner
  costCostCenter             = local.hca_tags.costAppOwnerManager
  costDivision               = local.hca_tags.costDivision
  costVP                     = local.hca_tags.costVP
  env                        = local.hca_tags.env
  costAllocation             = local.hca_tags.costAllocation
  appFunction                = local.hca_tags.appFunction
  monthlyBudget              = local.hca_tags.monthlyBudget
  costbaseline               = "2024"
  location                   = "centralus"
  additionalcontext          = "01"
  resource_group_name        = data.terraform_remote_state.subscription_config.outputs.resource-group_services.name
  private_dns_zone_ids       = data.azurerm_private_dns_zone.kv.id
  subnet_id                  = data.terraform_remote_state.networking.outputs.enablement_shared_subnet_services.id
  tenant_id                  = var.tenant_id
  sku_name                   = "standard"
  role_assignments           = local.akv_role_assigments
  soft_delete_retention_days = 90

  providers = {
    azurerm = azurerm.main
  }
}
