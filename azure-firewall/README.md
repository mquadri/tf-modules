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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-network-azurefirewall"></a> [avm-res-network-azurefirewall](#module\_avm-res-network-azurefirewall) | Azure/avm-res-network-azurefirewall/azurerm | 0.2.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/firewall_policy) | data source |
| [azurerm_public_ip.management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_hub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_hub) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings) | A map of diagnostic settings to create on the Firewall. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.<br><br>  - `name` - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.<br>  - `log_categories` - (Optional) A set of log categories to send to the log analytics workspace. Defaults to `[]`.<br>  - `log_groups` - (Optional) A set of log groups to send to the log analytics workspace. Defaults to `["allLogs"]`.<br>  - `metric_categories` - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to `["AllMetrics"]`.<br>  - `log_analytics_destination_type` - (Optional) The destination type for the diagnostic setting. Possible values are `Dedicated` and `AzureDiagnostics`. Defaults to `Dedicated`.<br>  - `workspace_resource_id` - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.<br>  - `storage_account_resource_id` - (Optional) The resource ID of the storage account to send logs and metrics to.<br>  - `event_hub_authorization_rule_resource_id` - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.<br>  - `event_hub_name` - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.<br>  - `marketplace_partner_resource_id` - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs. | <pre>map(object({<br>    name                                     = optional(string, null)<br>    log_categories                           = optional(set(string), [])<br>    log_groups                               = optional(set(string), ["allLogs"])<br>    metric_categories                        = optional(set(string), ["AllMetrics"])<br>    log_analytics_destination_type           = optional(string, "Dedicated")<br>    workspace_resource_id                    = optional(string, null)<br>    storage_account_resource_id              = optional(string, null)<br>    event_hub_authorization_rule_resource_id = optional(string, null)<br>    event_hub_name                           = optional(string, null)<br>    marketplace_partner_resource_id          = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | This variable controls whether or not telemetry is enabled for the module.<br>For more information see https://aka.ms/avm/telemetryinfo.<br>If it is set to false, then no telemetry will be collected. | `bool` | `true` | no |
| <a name="input_firewall_policy_name"></a> [firewall\_policy\_name](#input\_firewall\_policy\_name) | (Optional) The name of the Firewall Policy applied to this Firewall. | `string` | `null` | no |
| <a name="input_firewall_private_ip_ranges"></a> [firewall\_private\_ip\_ranges](#input\_firewall\_private\_ip\_ranges) | (Optional) A list of SNAT private CIDR IP ranges, or the special string `IANAPrivateRanges`, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918. | `set(string)` | `null` | no |
| <a name="input_firewall_sku_name"></a> [firewall\_sku\_name](#input\_firewall\_sku\_name) | (Required) SKU name of the Firewall. Possible values are `AZFW_Hub` and `AZFW_VNet`. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_firewall_sku_tier"></a> [firewall\_sku\_tier](#input\_firewall\_sku\_tier) | (Required) SKU tier of the Firewall. Possible values are `Premium`, `Standard` and `Basic`. | `string` | n/a | yes |
| <a name="input_firewall_timeouts"></a> [firewall\_timeouts](#input\_firewall\_timeouts) | - `create` - (Defaults to 90 minutes) Used when creating the Firewall.<br>- `delete` - (Defaults to 90 minutes) Used when deleting the Firewall.<br>- `read` - (Defaults to 5 minutes) Used when retrieving the Firewall.<br>- `update` - (Defaults to 90 minutes) Used when updating the Firewall. | <pre>object({<br>    create = optional(string)<br>    delete = optional(string)<br>    read   = optional(string)<br>    update = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_firewall_zones"></a> [firewall\_zones](#input\_firewall\_zones) | (Required) Specifies a list of Availability Zones in which this Azure Firewall should be located. Changing this forces a new Azure Firewall to be created. | `set(string)` | <pre>[<br>  "1",<br>  "2",<br>  "3"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_lock"></a> [lock](#input\_lock) | Controls the Resource Lock configuration for this resource. The following properties can be specified:<br><br>  - `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.<br>  - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource. | <pre>object({<br>    kind = string<br>    name = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Firewall. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_policy_resource_group_name"></a> [policy\_resource\_group\_name](#input\_policy\_resource\_group\_name) | The name of the resource group in which firewall policy is deployed. | `string` | `null` | no |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | The IP configuration for the Azure Firewall .<br><br>- `name` - The name of the IP configuration.<br>- `public_ip_name` - The public ip name.<br>- `public_ip_resource_group_name` - The public ip resource group name. | <pre>map(object({<br>    name                          = string<br>    public_ip_name                = string<br>    public_ip_resource_group_name = string<br>  }))</pre> | `{}` | no |
| <a name="input_public_ip_management"></a> [public\_ip\_management](#input\_public\_ip\_management) | The Management IP configuration for the Azure Firewall .<br><br>- `name` - The name of the IP configuration.<br>- `public_ip_name` - The public ip name.<br>- `public_ip_resource_group_name` - The public ip resource group name. | <pre>map(object({<br>    name                          = string<br>    public_ip_name                = string<br>    public_ip_resource_group_name = string<br>  }))</pre> | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | A map of role assignments to create on the Firewall. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.<br><br>  - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.<br>  - `principal_id` - The ID of the principal to assign the role to.<br>  - `description` - (Optional) The description of the role assignment.<br>  - `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.<br>  - `condition` - (Optional) The condition which will be used to scope the role assignment.<br>  - `condition_version` - (Optional) The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are '2.0'.<br>  - `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.<br>  - `principal_type` - (Optional) The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.<br><br>  > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal. | <pre>map(object({<br>    role_definition_id_or_name             = string<br>    principal_id                           = string<br>    description                            = optional(string, null)<br>    skip_service_principal_aad_check       = optional(bool, false)<br>    condition                              = optional(string, null)<br>    condition_version                      = optional(string, null)<br>    delegated_managed_identity_resource_id = optional(string, null)<br>    principal_type                         = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags of the resource. | `map(string)` | `null` | no |
| <a name="input_virtual_hub"></a> [virtual\_hub](#input\_virtual\_hub) | The Hub name and resource group name. | <pre>map(object({<br>    hub_name                = string<br>    hub_resource_group_name = string<br>    public_ip_count         = string<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id) | The ID of the virtual hub where the Azure Firewall needs to be deployed. | `string` | `null` | no |
| <a name="input_virtual_network"></a> [virtual\_network](#input\_virtual\_network) | The vnet name and resource group name. | <pre>map(object({<br>    vnet_name                = string<br>    vnet_resource_group_name = string<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | The ID of the virtual network ID where the Azure Firewall needs to be deployed. | `string` | `null` | no |
| <a name="input_virtual_network_id_management"></a> [virtual\_network\_id\_management](#input\_virtual\_network\_id\_management) | The ID of the virtual network ID where the Azure Firewall needs to be deployed. | `string` | `null` | no |
| <a name="input_virtual_network_management"></a> [virtual\_network\_management](#input\_virtual\_network\_management) | The vnet name and resource group name. | <pre>map(object({<br>    vnet_name                = string<br>    vnet_resource_group_name = string<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurefirewall_resource"></a> [azurefirewall\_resource](#output\_azurefirewall\_resource) | This is the full output of the firewall resource. |
<!-- END_TF_DOCS -->