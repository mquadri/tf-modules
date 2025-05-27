<!-- BEGIN_TF_DOCS -->
# Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 0.13)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.7.0, < 5.0.0)

- <a name="requirement_netapp-cloudmanager"></a> [netapp-cloudmanager](#requirement\_netapp-cloudmanager) (25.3.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (>= 3.5.0, < 4.0.0)

- <a name="requirement_tls"></a> [tls](#requirement\_tls) (4.0.6)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.7.0, < 5.0.0)

- <a name="provider_netapp-cloudmanager"></a> [netapp-cloudmanager](#provider\_netapp-cloudmanager) (25.3.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [netapp-cloudmanager_cvo_azure.cl_azure](https://registry.terraform.io/providers/NetApp/netapp-cloudmanager/25.3.0/docs/resources/cvo_azure) (resource)
- [azurerm_key_vault.cvo_kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) (data source)
- [azurerm_key_vault_secret.client_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) (data source)
- [azurerm_key_vault_secret.nss_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) (data source)
- [azurerm_key_vault_secret.refresh_token](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) (data source)
- [azurerm_key_vault_secret.saas_subscription_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) (data source)
- [azurerm_key_vault_secret.svm_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) (data source)
- [azurerm_key_vault_secret.workspace_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_cvo_instances"></a> [cvo\_instances](#input\_cvo\_instances)

Description: Map of CVO instances to deploy

Type:

```hcl
map(object({
    cvo_name             = string
    location             = string
    subscription_id      = string
    subnet_id            = string
    vnet_id              = string
    vnet_resource_group  = string
    data_encryption_type = string
    storage_type         = string
    capacity_tier        = string
    tier_level           = string
    writing_speed_state  = string
    is_ha                = bool
    ontap_version        = string
    instance_type        = string
    license_type         = string
  }))
```

### <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name)

Description: Name of the keyavult to store the private key

Type: `string`

### <a name="input_keyvault_rg"></a> [keyvault\_rg](#input\_keyvault\_rg)

Description: Keyvault RG name

Type: `string`

### <a name="input_secret_name_client"></a> [secret\_name\_client](#input\_secret\_name\_client)

Description: The refresh token of NetApp cloud manager. This can be generated from netapp Cloud Central.

Type: `string`

### <a name="input_secret_name_nss"></a> [secret\_name\_nss](#input\_secret\_name\_nss)

Description: secret name for keyvault for The NetApp Support Site account ID to use with this Cloud Volumes ONTAP system. If the license type is BYOL and an NSS account isn't provided, Cloud Manager tries to use the first existing NSS account.

Type: `string`

### <a name="input_secret_name_refresh_token"></a> [secret\_name\_refresh\_token](#input\_secret\_name\_refresh\_token)

Description: key vault secret name for refresh token of NetApp cloud manager. This can be generated from netapp Cloud Central.

Type: `string`

### <a name="input_secret_name_saas"></a> [secret\_name\_saas](#input\_secret\_name\_saas)

Description: keyvault secret name for The ID of the SaaS NetApp to Azure subscription.

Type: `string`

### <a name="input_secret_name_svm"></a> [secret\_name\_svm](#input\_secret\_name\_svm)

Description: keyvault secret name for The admin password for Cloud Volumes ONTAP.

Type: `string`

### <a name="input_secret_name_workspace"></a> [secret\_name\_workspace](#input\_secret\_name\_workspace)

Description: keyvault secret name for ID of the Cloud Manager workspace where you want to deploy Cloud Volumes ONTAP. If not provided, Cloud Manager uses the first workspace. You can find the ID from the Workspace.

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_cvo_name"></a> [cvo\_name](#output\_cvo\_name)

Description: Name of the deployed CVO instance
<!-- END_TF_DOCS -->
