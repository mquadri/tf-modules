## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.89.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.89.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.89.0 ~> 3.89.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-containerregistry-registry"></a> [avm-res-containerregistry-registry](#module\_avm-res-containerregistry-registry) | Azure/avm-res-containerregistry-registry/azurerm | 0.3.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_name_override"></a> [acr\_name\_override](#input\_acr\_name\_override) | Optional. Specifies the name of the container registry. If not set, a name will be generated using resourcetype, appname, environment, location, and additionalcontext. | `string` | `null` | no |
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | Additional context for naming ACR if `acr_name_override` is not specified (e.g., '01', 'shared'). | `string` | `"01"` | no |
| <a name="input_admin_enabled"></a> [admin\_enabled](#input\_admin\_enabled) | Specifies whether the admin user is enabled for the ACR. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_anonymous_pull_enabled"></a> [anonymous\_pull\_enabled](#input\_anonymous\_pull\_enabled) | Specifies whether anonymous pull is enabled. Only applicable to Premium SKU. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | The Application ID (e.g., APP0001) for tagging purposes. This is a mandatory tag. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | Application name for naming ACR if `acr_name_override` is not specified. | `string` | `"defaultapp"` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | When set to true, a new resource group will be created. If false, `resource_group_name` must refer to an existing resource group. | `bool` | `false` | no |
| <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings) | A map of diagnostic settings to create for the Azure Container Registry. See README for structure. | <pre>map(object({<br>    name                                     = optional(string, null)<br>    log_categories                           = optional(set(string), [])<br>    log_groups                               = optional(set(string), ["allLogs"])<br>    metric_categories                        = optional(set(string), ["AllMetrics"])<br>    log_analytics_destination_type           = optional(string, "Dedicated")<br>    workspace_resource_id                    = optional(string, null)<br>    storage_account_resource_id              = optional(string, null)<br>    event_hub_authorization_rule_resource_id = optional(string, null)<br>    event_hub_name                           = optional(string, null)<br>    marketplace_partner_resource_id          = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_enable_content_trust"></a> [enable\_content\_trust](#input\_enable\_content\_trust) | Enables content trust for the container registry. | `bool` | `false` | no |
| <a name="input_enable_encryption"></a> [enable\_encryption](#input\_enable\_encryption) | Enables encryption at rest for the container registry. | `bool` | `false` | no |
| <a name="input_enable_encryption_with_key_vault"></a> [enable\_encryption\_with\_key\_vault](#input\_enable\_encryption\_with\_key\_vault) | Enables encryption with Key Vault for the container registry. | `bool` | `false` | no |
| <a name="input_enable_network_rules"></a> [enable\_network\_rules](#input\_enable\_network\_rules) | Enables network rules for the container registry. | `bool` | `false` | no |
| <a name="input_enable_quarantine_policy"></a> [enable\_quarantine\_policy](#input\_enable\_quarantine\_policy) | Enables quarantine policy for the container registry. | `bool` | `false` | no |
| <a name="input_enable_retention_policy"></a> [enable\_retention\_policy](#input\_enable\_retention\_policy) | Enables retention policy for the container registry. | `bool` | `false` | no |
| <a name="input_encryption_identity_client_id"></a> [encryption\_identity\_client\_id](#input\_encryption\_identity\_client\_id) | The client ID of the identity used for encryption. | `string` | `null` | no |
| <a name="input_encryption_key_vault_key_id"></a> [encryption\_key\_vault\_key\_id](#input\_encryption\_key\_vault\_key\_id) | The ID of the Key Vault key used for encryption. | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment (e.g., PROD, TEST, DEV) for tagging purposes. This is a mandatory tag. Also used in the naming convention if `acr_name_override` is not set. | `string` | n/a | yes |
| <a name="input_export_policy_enabled"></a> [export\_policy\_enabled](#input\_export\_policy\_enabled) | Specifies whether export policy is enabled. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_georeplications"></a> [georeplications](#input\_georeplications) | A list of geo-replication configurations for the Container Registry (Premium SKU only). | <pre>list(object({<br>    location                  = string<br>    regional_endpoint_enabled = optional(bool, true)<br>    zone_redundancy_enabled   = optional(bool, true)<br>    tags                      = optional(map(any), null)<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Azure Container Registry and associated resources will be deployed. Also used in the naming convention if `acr_name_override` is not set. | `string` | n/a | yes |
| <a name="input_mal_id"></a> [mal\_id](#input\_mal\_id) | The MAL ID to be used by the ACR module. | `string` | `""` | no |
| <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration) | The Microsoft migration tag value. This is a mandatory tag. | `string` | n/a | yes |
| <a name="input_network_rule_default_action"></a> [network\_rule\_default\_action](#input\_network\_rule\_default\_action) | The default action when no network rule matches. Valid values are 'Allow' or 'Deny'. | `string` | `"Deny"` | no |
| <a name="input_network_rule_ip_rules"></a> [network\_rule\_ip\_rules](#input\_network\_rule\_ip\_rules) | List of IP CIDR blocks allowed to access the Container Registry. | <pre>list(object({<br>    action   = string<br>    ip_range = string<br>  }))</pre> | `[]` | no |
| <a name="input_network_rule_virtual_network_rules"></a> [network\_rule\_virtual\_network\_rules](#input\_network\_rule\_virtual\_network\_rules) | List of virtual network subnet IDs allowed to access the Container Registry. | <pre>list(object({<br>    action    = string<br>    subnet_id = string<br>  }))</pre> | `[]` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | A map of private endpoint configurations to create for the Azure Container Registry. See README for structure. | <pre>map(object({<br>    private_dns_zone_resource_ids   = optional(list(string))<br>    name                            = string<br>    private_service_connection_name = string<br>    tags                            = optional(map(string), null)<br>    private_dns_zone_group_name     = string<br>    location                        = string<br>    resource_group_name             = string<br>    subnet_resource_id              = string<br>  }))</pre> | `{}` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is enabled for the ACR. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where Azure Container Registry will be deployed. If `create_resource_group` is false, this resource group must already exist. | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | Resource type abbreviation for naming ACR if `acr_name_override` is not specified (e.g., 'acr'). | `string` | `"acr"` | no |
| <a name="input_retention_policy_days"></a> [retention\_policy\_days](#input\_retention\_policy\_days) | The number of days to retain images for. | `number` | `7` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Azure Container Registry. Valid values are `Basic`, `Standard`, and `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of additional, user-defined tags to assign to resources. These are merged with mandatory tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_admin_password"></a> [acr\_admin\_password](#output\_acr\_admin\_password) | The Admin Password for the Container Registry if admin\_enabled is true |
| <a name="output_acr_admin_username"></a> [acr\_admin\_username](#output\_acr\_admin\_username) | The Admin Username for the Container Registry if admin\_enabled is true |
| <a name="output_acr_login_server"></a> [acr\_login\_server](#output\_acr\_login\_server) | The URL that can be used to log into the container registry |
| <a name="output_acr_name"></a> [acr\_name](#output\_acr\_name) | Azure Container registry Name |
| <a name="output_acr_resource_id"></a> [acr\_resource\_id](#output\_acr\_resource\_id) | Azure Container registry Resource ID |
| <a name="output_network_rule_set"></a> [network\_rule\_set](#output\_network\_rule\_set) | Network rule set for the container registry if configured |
| <a name="output_private_endpoints"></a> [private\_endpoints](#output\_private\_endpoints) | Azure Container registry Private endpoints |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group in which resources are created |
| <a name="output_tags_applied"></a> [tags\_applied](#output\_tags\_applied) | The tags applied to the Container Registry |
