<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.80 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 2.0.1 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.116.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_diagnostics-setting-setup"></a> [diagnostics-setting-setup](#module\_diagnostics-setting-setup) | ../diagnostic-setting | n/a |
| <a name="module_key-vault-access-policy-setup"></a> [key-vault-access-policy-setup](#module\_key-vault-access-policy-setup) | ../key-vault-access-policy | n/a |
| <a name="module_private-endpoint-setup"></a> [private-endpoint-setup](#module\_private-endpoint-setup) | ../private-endpoint | n/a |
| <a name="module_role_assignments"></a> [role\_assignments](#module\_role\_assignments) | Azure/avm-res-authorization-roleassignment/azurerm | 0.1.0 |
| <a name="module_user_managed_identity_setup"></a> [user\_managed\_identity\_setup](#module\_user\_managed\_identity\_setup) | ../user-assigned-identity | n/a |

## Resources

| Name | Type |
|------|------|
| [azapi_resource.content_filtering](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [azurerm_cognitive_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) | resource |
| [azurerm_cognitive_account_customer_managed_key.cmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account_customer_managed_key) | resource |
| [azurerm_cognitive_deployment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment) | resource |
| [azurerm_key_vault_key.cmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | A map of objects where each object contains information to create a A record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records             = list(string)<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records) | A map of objects where each object contains information to create a AAAA record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records             = list(string)<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | `"01"` | no |
| <a name="input_appfunction"></a> [appfunction](#input\_appfunction) | app function | `string` | `""` | no |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | `""` | no |
| <a name="input_azurerm_cognitive_deployment"></a> [azurerm\_cognitive\_deployment](#input\_azurerm\_cognitive\_deployment) | (Required) Scale block supports below values:<br>rai\_policy\_name = "(Optional) The name of RAI policy."<br>name = "(Required) The name of the Cognitive Deployment. Changing this forces a new resource to be created."<br>model = "(Required) The model block supports below values:"<br>- format  = "(Required) The format of the model. Possible values are OpenAI, ONNX, TensorFlow, TensorFlowLite, TensorFlowSavedModel, TensorFlowJS, PyTorch, ScikitLearn, PMML, CoreML, Custom, and Other."<br>- name    = "(Required) The name of the model. Changing this forces a new resource to be created."<br>- version = "(Required) The version of the model. Changing this forces a new resource to be created."<br>scale = "(Required) The scale block supports below values:"<br>- type     = "(Required) The name of the SKU. Ex - Standard or P3. It is typically a letter+number code. Changing this forces a new resource to be created."<br>- tier     = "(Optional) Possible values are Free, Basic, Standard, Premium, Enterprise. Changing this forces a new resource to be created."<br>- size     = "(Optional) The SKU size. When the name field is the combination of tier and some other value, this would be the standalone code. Changing this forces a new resource to be created."<br>- family   = "(Optional) If the service has different generations of hardware, for the same SKU, then that can be captured here. Changing this forces a new resource to be created."<br>- capacity = "(Optional) Tokens-per-Minute (TPM). The unit of measure for this field is in the thousands of Tokens-per-Minute. Defaults to 1 which means that the limitation is 1000 tokens per minute. If the resources SKU supports scale in/out then the capacity field should be included in the resources' configuration. If the scale in/out is not supported by the resources SKU then this field can be safely omitted." | <pre>map(object({<br>    rai_policy_name = optional(string)<br>    name            = string<br>    model = object({<br>      format  = string<br>      name    = string<br>      version = string<br>    })<br>    sku = object({<br>      name     = string<br>      tier     = optional(string)<br>      size     = optional(string)<br>      family   = optional(string)<br>      capacity = optional(number, 1)<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | A map of objects where each object contains information to create a CNAME record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    record              = string<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_content_filtering"></a> [content\_filtering](#input\_content\_filtering) | Map of objects containing the content filtering information to be created.<br>  The key is the name of the data source.<br>  The value is an object with the following attributes:<br>  - basePolicyName = "(Required) The name of the base policy."<br>  - mode = "(Required) The mode of the content filtering. Possible values are 'Blocking', 'Default' or 'Deferred'."<br>  - contentFilters = "(Required) The content filters block supports below values:"<br>    - name = "(Required) The name of the content filter."<br>    - blocking = "(Required) Whether the content filter is blocking or not."<br>    - enabled = "(Required) Whether the content filter is enabled or not."<br>    - severityThreshold = "(Required) The allowed content level. Possible values are 'Low', 'Medium', 'High'."<br>    - source = "(Required) The source of the content filter. Possible values are 'Completion', 'Prompt'."<br>  - customBlocklists = "(Optional) The custom blocklists block supports below values:"<br>    - blocking = "(Required) Whether the custom blocklist is blocking or not."<br>    - blocklistName = "(Required) The name of the custom blocklist."<br>    - source = "(Required) The source of the custom blocklist. Possible values are 'Completion', 'Prompt'." | <pre>map(object({<br>    basePolicyName = string<br>    mode           = string<br>    contentFilters = list(object({<br>      name              = string<br>      blocking          = bool<br>      enabled           = bool<br>      severityThreshold = optional(string)<br>      source            = string<br>    }))<br>    customBlocklists = optional(list(object({<br>      blocking      = bool<br>      blocklistName = string<br>      source        = string<br>    })))<br>  }))</pre> | `{}` | no |
| <a name="input_costallocation"></a> [costallocation](#input\_costallocation) | can only be sharedcosts or chargeback | `string` | `""` | no |
| <a name="input_costappownermanager"></a> [costappownermanager](#input\_costappownermanager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costappownertech"></a> [costappownertech](#input\_costappownertech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | `""` | no |
| <a name="input_costbudgetowner"></a> [costbudgetowner](#input\_costbudgetowner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costcostcenter"></a> [costcostcenter](#input\_costcostcenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_costdivision"></a> [costdivision](#input\_costdivision) | cost division | `string` | `""` | no |
| <a name="input_costvp"></a> [costvp](#input\_costvp) | The cost vp for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_create_dns_zone"></a> [create\_dns\_zone](#input\_create\_dns\_zone) | n/a | `bool` | `false` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Set this to true if a new RG is required. | `bool` | `false` | no |
| <a name="input_custom_subdomain_name"></a> [custom\_subdomain\_name](#input\_custom\_subdomain\_name) | (Optional) The custom subdomain name for the Cognitive Service Account. | `string` | `null` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | (Optional) Specifies the customer managed key for the Cognitive Service Account. | <pre>object({<br>    key_vault_key_id   = string<br>    identity_client_id = string<br>  })</pre> | `null` | no |
| <a name="input_diagnostics_settings_name"></a> [diagnostics\_settings\_name](#input\_diagnostics\_settings\_name) | The diagnostics setting name of the resource on. | `string` | `""` | no |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | The ID of the DNS zone if provided by the user | `string` | `""` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The name of the private dns zone. | `string` | n/a | yes |
| <a name="input_dynamic_throttling_enabled"></a> [dynamic\_throttling\_enabled](#input\_dynamic\_throttling\_enabled) | (Optional) Whether to enable the dynamic throttling for this Cognitive Service Account. | `bool` | `false` | no |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting) | Choose if Diagnostic setting should be enabled | `bool` | `false` | no |
| <a name="input_enable_encryption"></a> [enable\_encryption](#input\_enable\_encryption) | Enable encryption for the resources | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | controls whether or not to create private endpoints | `bool` | `true` | no |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | This variable controls whether or not telemetry is enabled for the module.<br>For more information see https://aka.ms/avm/telemetryinfo.<br>If it is set to false, then no telemetry will be collected. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_excluded_log_categories"></a> [excluded\_log\_categories](#input\_excluded\_log\_categories) | List of log categories to exclude. | `list(string)` | `[]` | no |
| <a name="input_existing_user_assigned_identity_name"></a> [existing\_user\_assigned\_identity\_name](#input\_existing\_user\_assigned\_identity\_name) | The name of the existing user assigned identity | `string` | `""` | no |
| <a name="input_fqdns"></a> [fqdns](#input\_fqdns) | (Optional) A list of fully qualified domain names (FQDNs) that are associated with this Cognitive Service Account. | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | (Optional) Specifies the identity for the Cognitive Service Account. | `string` | `"SystemAssigned"` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | The name of the Key Vault | `string` | `""` | no |
| <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name) | Resource group name for the Key Vault | `string` | `""` | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Enable or disable local authentication. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the resources should be deployed. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_categories"></a> [log\_categories](#input\_log\_categories) | List of log categories. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_logs_destinations_ids"></a> [logs\_destinations\_ids](#input\_logs\_destinations\_ids) | List of destination resources IDs for logs diagnostic destination.<br>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br>If you want to use Azure EventHub as destination, you must provide a formatted string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>\|</code> character. | `list(string)` | `[]` | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | resource group is managed by | `string` | `null` | no |
| <a name="input_managed_identity"></a> [managed\_identity](#input\_managed\_identity) | user assigned managed identity block | <pre>map(object({<br>    user_managed_identity_name           = string<br>    managed_identity_location            = string<br>    managed_identity_resource_group_name = string<br>    tags                                 = optional(map(string))<br>    lock = optional(object({<br>      kind = string<br>      name = optional(string, null)<br>    }))<br>    enable_telemetry = optional(bool, false)<br><br>  }))</pre> | `{}` | no |
| <a name="input_metric_categories"></a> [metric\_categories](#input\_metric\_categories) | List of metric categories. Defaults to all available. | `list(string)` | `null` | no |
| <a name="input_monthlybudget"></a> [monthlybudget](#input\_monthlybudget) | monthly budget | `string` | `""` | no |
| <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records) | A map of objects where each object contains information to create a MX record. | <pre>map(object({<br>    name                = optional(string, "@")<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      preference = number<br>      exchange   = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Cognitive Service Account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | The default action of Network ACLs for the Cognitive Services Account. Possible values are `Allow` and `Deny`. | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | List of IP addresses that are allowed access to the Cognitive Services Account. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_rules"></a> [network\_acls\_virtual\_network\_rules](#input\_network\_acls\_virtual\_network\_rules) | List of virtual network rules for the Cognitive Services Account. | <pre>list(object({<br>    subnet_id                            = string<br>    ignore_missing_vnet_service_endpoint = bool<br>  }))</pre> | `[]` | no |
| <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name) | n/a | `string` | `null` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | Private Endpoints for the supported resources | <pre>map(object({<br>    name                           = string<br>    is_manual_connection           = optional(bool)<br>    private_connection_resource_id = optional(string)<br>    subresource_names              = list(string)<br>    request_message                = optional(string)<br>    private_dns_zone_group_name    = optional(string)<br>    private_dns_zone_ids           = optional(list(string))<br>  }))</pre> | `{}` | no |
| <a name="input_ptr_records"></a> [ptr\_records](#input\_ptr\_records) | A map of objects where each object contains information to create a PTR record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records             = list(string)<br>    tags                = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Enable or disable public network access. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | `""` | no |
| <a name="input_rg_role_assignments"></a> [rg\_role\_assignments](#input\_rg\_role\_assignments) | The role assignment to be assigned to the resource group | <pre>map(object({<br>    role_definition_id_or_name             = string<br>    principal_id                           = string<br>    description                            = optional(string, null)<br>    skip_service_principal_aad_check       = optional(bool, false)<br>    condition                              = optional(string, null)<br>    condition_version                      = optional(string, null)<br>    delegated_managed_identity_resource_id = optional(string, null)<br>    principal_type                         = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) The SKU of the Cognitive Service Account. | `string` | `"S0"` | no |
| <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record) | optional soa\_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com | <pre>object({<br>    email        = string<br>    expire_time  = optional(number, 2419200)<br>    minimum_ttl  = optional(number, 10)<br>    refresh_time = optional(number, 3600)<br>    retry_time   = optional(number, 300)<br>    ttl          = optional(number, 3600)<br>    tags         = optional(map(string), null)<br>  })</pre> | `null` | no |
| <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records) | A map of objects where each object contains information to create a SRV record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      priority = number<br>      weight   = number<br>      port     = number<br>      target   = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | (Optional) Specifies the storage account for the Cognitive Service Account. | <pre>object({<br>    storage_account_id = string<br>    identity_client_id = string<br>  })</pre> | `null` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags of the resource. | `map(string)` | `null` | no |
| <a name="input_txt_records"></a> [txt\_records](#input\_txt\_records) | A map of objects where each object contains information to create a TXT record. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string<br>    zone_name           = string<br>    ttl                 = number<br>    records = map(object({<br>      value = string<br>    }))<br>    tags = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_userIdentities"></a> [userIdentities](#input\_userIdentities) | When using managed identity, the user identities that will be assigned to the openAI service | `list(string)` | `[]` | no |
| <a name="input_user_assigned_identity_rg_name"></a> [user\_assigned\_identity\_rg\_name](#input\_user\_assigned\_identity\_rg\_name) | Resource group name for the user assigned identity | `string` | `""` | no |
| <a name="input_virtual_network_links"></a> [virtual\_network\_links](#input\_virtual\_network\_links) | A map of objects where each object contains information to create a virtual network link. | <pre>map(object({<br>    vnetlinkname     = string<br>    vnetid           = string<br>    autoregistration = optional(bool, false)<br>    tags             = optional(map(string), null)<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | n/a | `string` | `null` | no |
| <a name="input_virtual_network_rg"></a> [virtual\_network\_rg](#input\_virtual\_network\_rg) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint used to connect to the Cognitive Service Account. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Cognitive Service Account. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | A primary access key which can be used to connect to the Cognitive Service Account. |
| <a name="output_resource"></a> [resource](#output\_resource) | Resource configuration output for azure cognitive account |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | The secondary access key which can be used to connect to the Cognitive Service Account. |
<!-- END_TF_DOCS -->
