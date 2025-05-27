<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.keyvaultpermissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | The object ID of an Application in Azure Active Directory. | `string` | `null` | no |
| <a name="input_certificate_permissions"></a> [certificate\_permissions](#input\_certificate\_permissions) | List of certificate permissions, must be one or more from the following: 'Backup', 'Create', 'Delete', 'DeleteIssuers', 'Get', 'GetIssuers', 'Import', 'List', 'ListIssuers', 'ManageContacts', 'ManageIssuers', 'Purge', 'Recover', 'Restore', 'SetIssuers' and 'Update'. | `list(string)` | <pre>[<br>  "Get",<br>  "List"<br>]</pre> | no |
| <a name="input_key_permissions"></a> [key\_permissions](#input\_key\_permissions) | List of key permissions, must be one or more from the following: 'Backup', 'Create', 'Decrypt', 'Delete', 'Encrypt', 'Get', 'Import', 'List', 'Purge', 'Recover', 'Restore', 'Sign', 'UnwrapKey', 'Update', 'Verify' and 'WrapKey'. | `list(string)` | <pre>[<br>  "Get",<br>  "List"<br>]</pre> | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | Specifies the id of the Key Vault resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_object_id"></a> [object\_id](#input\_object\_id) | The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_secret_permissions"></a> [secret\_permissions](#input\_secret\_permissions) | List of secret permissions, must be one or more from the following: 'Backup', 'Delete', 'Get', 'List', 'Purge', 'Recover', 'Restore' and 'Set'. | `list(string)` | <pre>[<br>  "Get",<br>  "List"<br>]</pre> | no |
| <a name="input_storage_permissions"></a> [storage\_permissions](#input\_storage\_permissions) | List of storage permissions, must be one or more from the following: 'Backup', 'Delete', 'DeleteSAS', 'Get', 'GetSAS', 'List', 'ListSAS', 'Purge', 'Recover', 'RegenerateKey', 'Restore', 'Set', 'SetSAS' and 'Update'. | `list(string)` | <pre>[<br>  "Get",<br>  "ListSAS"<br>]</pre> | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Key Vault Access Policy ID. |
<!-- END_TF_DOCS -->