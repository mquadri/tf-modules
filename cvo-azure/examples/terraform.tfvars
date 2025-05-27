#role_definition_id = "/subscriptions/96886549-2c8b-4ef5-ab01-bcbe4787843f/providers/Microsoft.Authorization/roleDefinitions/3a9d8d5b-7964-482c-98d6-d9c3821d97a2"
keyvault_name = "cvo_keyvault_name"
keyvault_rg   = "cvo_keyvault_rg"

secret_name_refresh_token   = "cvo_refresh_token"
secret_name_svm             = "cvo_svm_password"
secret_name_workspace       = "cvo_workspace_id"
secret_name_nss             = "cvo_nss_account"
secret_name_saas            = "cvo_saas_subscription_id"
secret_name_client          = "cvo_client_id"
secret_subscription_id      = "cvo_subscription_id"

cvo_instances = {
  "cvo-test-001-eus" = {
    cvo_name             = "TerraformCVOEUS2Test1"
    location             = "East US2"
    subnet_id            = "default"
    vnet_id              = "new-vnet"
    vnet_resource_group  = "rg-kv"
    data_encryption_type = "AZURE"
    storage_type         = "Premium_LRS"
    capacity_tier        = "Blob"
    tier_level           = "normal"
    writing_speed_state  = "NORMAL"
    is_ha                = false
    ontap_version        = "latest"
    instance_type        = "Standard_DS4_v2"
    license_type         = "capacity-paygo"
  }

  "cvo-test-001-cus" = {
    cvo_name             = "TerraformCVOEUS2Test2"
    location             = "Central US"
    subnet_id            = "default"
    vnet_id              = "new-vnet"
    vnet_resource_group  = "rg-kv"
    data_encryption_type = "AZURE"
    storage_type         = "Standard_LRS"
    capacity_tier        = "Blob"
    tier_level           = "normal"
    writing_speed_state  = "NORMAL"
    is_ha                = true
    ontap_version        = "9.12.1"
    instance_type        = "Standard_DS5_v2"
    license_type         = "capacity-paygo"
  }
}

