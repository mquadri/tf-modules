data "azurerm_key_vault" "cvo_kv" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_rg
}

data "azurerm_key_vault_secret" "refresh_token" {
  name         = var.secret_name_refresh_token
  key_vault_id = data.azurerm_key_vault.cvo_kv.id
}

data "azurerm_key_vault_secret" "subscription_id" {
  name         = var.secret_subscription_id
  key_vault_id = data.azurerm_key_vault.cvo_kv.id
}

data "azurerm_key_vault_secret" "svm_password" {
  name         = var.secret_name_svm
  key_vault_id = data.azurerm_key_vault.cvo_kv.id
}

data "azurerm_key_vault_secret" "client_id" {
  name         = var.secret_name_client
  key_vault_id = data.azurerm_key_vault.cvo_kv.id
}

data "azurerm_key_vault_secret" "workspace_id" {
  name         = var.secret_name_workspace
  key_vault_id = data.azurerm_key_vault.cvo_kv.id
}

data "azurerm_key_vault_secret" "saas_subscription_id" {
  name         = var.secret_name_saas
  key_vault_id = data.azurerm_key_vault.cvo_kv.id
}

data "azurerm_key_vault_secret" "nss_account" {
  name         = var.secret_name_nss
  key_vault_id = data.azurerm_key_vault.cvo_kv.id
}

resource "netapp-cloudmanager_cvo_azure" "cl_azure" {
  for_each = var.cvo_instances

  provider             = netapp-cloudmanager
  name                 = each.value.cvo_name
  location             = each.value.location
  subscription_id      = data.azurerm_key_vault_subscription_id.value
  subnet_id            = each.value.subnet_id
  vnet_id              = each.value.vnet_id
  vnet_resource_group  = each.value.vnet_resource_group
  data_encryption_type = each.value.data_encryption_type
  storage_type         = each.value.storage_type
  client_id            = data.azurerm_key_vault_secret.client_id.value
  svm_password         = data.azurerm_key_vault_secret.svm_password.value
  workspace_id         = data.azurerm_key_vault_secret.workspace_id.value
  capacity_tier        = each.value.capacity_tier
  tier_level           = each.value.tier_level
  writing_speed_state  = each.value.writing_speed_state
  is_ha                = each.value.is_ha
  ontap_version        = each.value.ontap_version
  instance_type        = each.value.instance_type
  license_type         = each.value.license_type
  saas_subscription_id = data.azurerm_key_vault_secret.saas_subscription_id.value
  nss_account          = data.azurerm_key_vault_secret.nss_account.value
}