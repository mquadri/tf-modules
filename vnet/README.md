# VNET Module

## Breaking Changes :warning:

**Version 2.34.0:**

- The issue with the resource format has been corrected.
- Legacy resources have been moved to the new format.
- The vNet is created by default again.

**Version 2.26.0:**

- The virtual network (vNet) is not created by default.
- The resource format has been changed to an array, which is a breaking change.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 1.15)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (> 3.89)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (> 3.89)

- <a name="provider_validation"></a> [validation](#provider\_validation) (~> 1.1.1)

## Modules

The following Modules are called:

### <a name="module_avm-res-network-virtualnetwork"></a> [avm-res-network-virtualnetwork](#module\_avm-res-network-virtualnetwork)

Source: Azure/avm-res-network-virtualnetwork/azurerm

Version: 0.8.1

## Resources

The following resources are used by this module:

- [azurerm_virtual_hub_connection.vhub-vnet-connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_connection) (resource)
- [validation_warning.appFunction](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appid](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAllocation](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerManager](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerTech](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costBudgetOwner](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costCostCenter](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costDivision](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costVP](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costbaseline](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.monthlyBudget](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.resourcetype](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

### <a name="input_address_space"></a> [address\_space](#input\_address\_space)

Description: The address space that is used by the virtual network.

Type: `list(string)`

### <a name="input_app_id"></a> [app\_id](#input\_app\_id)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_appname"></a> [appname](#input\_appname)

Description: the app name for the resources.  Used for tagging and naming purposes

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where resources will be deployed

Type: `string`

### <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name)

Description: The name of an existing resource group to be imported.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_appFunction"></a> [appFunction](#input\_appFunction)

Description: app function

Type: `string`

Default: `""`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_bgp_community"></a> [bgp\_community](#input\_bgp\_community)

Description: (Optional) The BGP community to send to the virtual network gateway.

Type: `string`

Default: `null`

### <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation)

Description: can only be sharedcosts or chargeback

Type: `string`

Default: `""`

### <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager)

Description: The app owner manager responsible for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech)

Description: The app owner responsible for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner)

Description: The budget owner responsible for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter)

Description: The cost center code for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_costDivision"></a> [costDivision](#input\_costDivision)

Description: cost division

Type: `string`

Default: `""`

### <a name="input_costVP"></a> [costVP](#input\_costVP)

Description: The cost vp for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline)

Description: year resource created

Type: `string`

Default: `""`

### <a name="input_create_virtual_network"></a> [create\_virtual\_network](#input\_create\_virtual\_network)

Description: Set this to true if a new virtual network is required.

Type: `bool`

Default: `true`

### <a name="input_ddos_protection_plan"></a> [ddos\_protection\_plan](#input\_ddos\_protection\_plan)

Description: Specifies an AzureNetwork DDoS Protection Plan.

- `id`: The ID of the DDoS Protection Plan. (Required)
- `enable`: Enables or disables the DDoS Protection Plan on the Virtual Network. (Required)

Type:

```hcl
object({
    id     = string
    enable = bool
  })
```

Default: `null`

### <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings)

Description:   A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.
- `log_categories` - (Optional) A set of log categories to send to the log analytics workspace. Defaults to `[]`.
- `log_groups` - (Optional) A set of log groups to send to the log analytics workspace. Defaults to `["allLogs"]`.
- `metric_categories` - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to `["AllMetrics"]`.
- `log_analytics_destination_type` - (Optional) The destination type for the diagnostic setting. Possible values are `Dedicated` and `AzureDiagnostics`. Defaults to `Dedicated`.
- `workspace_resource_id` - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.
- `storage_account_resource_id` - (Optional) The resource ID of the storage account to send logs and metrics to.
- `event_hub_authorization_rule_resource_id` - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.
- `event_hub_name` - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.
- `marketplace_partner_resource_id` - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.

Type:

```hcl
map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers)

Description: The DNS servers to be used with vNet.

Type: `list(string)`

Default: `null`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see [telemetry](https://aka.ms/avm/telemetry.)  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_enable_vm_protection"></a> [enable\_vm\_protection](#input\_enable\_vm\_protection)

Description: (Optional) Enable VM Protection for the virtual network. Defaults to false.

Type: `bool`

Default: `false`

### <a name="input_encryption"></a> [encryption](#input\_encryption)

Description: (Optional) Specifies the encryption settings for the virtual network.

- `enabled`: Specifies whether encryption is enabled for the virtual network.
- `enforcement`: Specifies the enforcement mode for the virtual network. Possible values are `Enabled` and `Disabled`.

Type:

```hcl
object({
    enabled     = bool
    enforcement = string
  })
```

Default: `null`

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `"nonprod"`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_extended_location"></a> [extended\_location](#input\_extended\_location)

Description: (Optional) Specifies the extended location of the virtual network.

- `name`: The name of the extended location.
- `type`: The type of the extended location.

Type:

```hcl
object({
    name = string
    type = string
  })
```

Default: `null`

### <a name="input_flow_timeout_in_minutes"></a> [flow\_timeout\_in\_minutes](#input\_flow\_timeout\_in\_minutes)

Description: (Optional) The flow timeout in minutes for the virtual network. Defaults to 4.

Type: `number`

Default: `null`

### <a name="input_internet_security_enabled"></a> [internet\_security\_enabled](#input\_internet\_security\_enabled)

Description: Enable internet security for the virtual hub connection.

Type: `bool`

Default: `true`

### <a name="input_lock"></a> [lock](#input\_lock)

Description:   (Optional) Controls the Resource Lock configuration for this resource. The following properties can be specified:

- `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
- `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.

Type:

```hcl
object({
    kind = string
    name = optional(string, null)
  })
```

Default: `null`

### <a name="input_migration"></a> [migration](#input\_migration)

Description: The migration tag used.

Type: `string`

Default: `"yes"`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

Default: `""`

### <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration)

Description: The migration tag used.

Type: `string`

Default: `"yes"`

### <a name="input_name"></a> [name](#input\_name)

Description: allow override of the vnet name

Type: `string`

Default: `null`

### <a name="input_peerings"></a> [peerings](#input\_peerings)

Description: (Optional) A map of virtual network peering configurations. Each entry specifies a remote virtual network by ID and includes settings for traffic forwarding, gateway transit, and remote gateways usage.

- `name`: The name of the virtual network peering configuration.
- `remote_virtual_network_resource_id`: The resource ID of the remote virtual network.
- `allow_forwarded_traffic`: (Optional) Enables forwarded traffic between the virtual networks. Defaults to false.
- `allow_gateway_transit`: (Optional) Enables gateway transit for the virtual networks. Defaults to false.
- `allow_virtual_network_access`: (Optional) Enables access from the local virtual network to the remote virtual network. Defaults to true.
- `do_not_verify_remote_gateways`: (Optional) Disables the verification of remote gateways for the virtual networks. Defaults to false.
- `enable_only_ipv6_peering`: (Optional) Enables only IPv6 peering for the virtual networks. Defaults to false.
- `peer_complete_vnets`: (Optional) Enables the peering of complete virtual networks for the virtual networks. Defaults to false.
- `local_peered_address_spaces`: (Optional) The address spaces to peer with the remote virtual network. Only used when `peer_complete_vnets` is set to true.
- `remote_peered_address_spaces`: (Optional) The address spaces to peer from the remote virtual network. Only used when `peer_complete_vnets` is set to true.
- `local_peered_subnets`: (Optional) The subnets to peer with the remote virtual network. Only used when `peer_complete_vnets` is set to true.
- `remote_peered_subnets`: (Optional) The subnets to peer from the remote virtual network. Only used when `peer_complete_vnets` is set to true.
- `use_remote_gateways`: (Optional) Enables the use of remote gateways for the virtual networks. Defaults to false.
- `create_reverse_peering`: (Optional) Creates the reverse peering to form a complete peering.
- `reverse_name`: (Optional) If you have selected `create_reverse_peering`, then this name will be used for the reverse peer.
- `reverse_allow_forwarded_traffic`: (Optional) If you have selected `create_reverse_peering`, enables forwarded traffic between the virtual networks. Defaults to false.
- `reverse_allow_gateway_transit`: (Optional) If you have selected `create_reverse_peering`, enables gateway transit for the virtual networks. Defaults to false.
- `reverse_allow_virtual_network_access`: (Optional) If you have selected `create_reverse_peering`, enables access from the local virtual network to the remote virtual network. Defaults to true.
- `reverse_do_not_verify_remote_gateways`: (Optional) If you have selected `create_reverse_peering`, disables the verification of remote gateways for the virtual networks. Defaults to false.
- `reverse_enable_only_ipv6_peering`: (Optional) If you have selected `create_reverse_peering`, enables only IPv6 peering for the virtual networks. Defaults to false.
- `reverse_peer_complete_vnets`: (Optional) If you have selected `create_reverse_peering`, enables the peering of complete virtual networks for the virtual networks. Defaults to false.
- `reverse_local_peered_address_spaces`: (Optional) If you have selected `create_reverse_peering`, the address spaces to peer with the remote virtual network. Only used when `reverse_peer_complete_vnets` is set to true.
- `reverse_remote_peered_address_spaces`: (Optional) If you have selected `create_reverse_peering`, the address spaces to peer from the remote virtual network. Only used when `reverse_peer_complete_vnets` is set to true.
- `reverse_local_peered_subnets`: (Optional) If you have selected `create_reverse_peering`, the subnets to peer with the remote virtual network. Only used when `reverse_peer_complete_vnets` is set to true.
- `reverse_remote_peered_subnets`: (Optional) If you have selected `create_reverse_peering`, the subnets to peer from the remote virtual network. Only used when `reverse_peer_complete_vnets` is set to true.
- `reverse_use_remote_gateways`: (Optional) If you have selected `create_reverse_peering`, enables the use of remote gateways for the virtual networks. Defaults to false.

Type:

```hcl
map(object({
    name                               = string
    remote_virtual_network_resource_id = string
    allow_forwarded_traffic            = optional(bool, false)
    allow_gateway_transit              = optional(bool, false)
    allow_virtual_network_access       = optional(bool, true)
    do_not_verify_remote_gateways      = optional(bool, false)
    enable_only_ipv6_peering           = optional(bool, false)
    peer_complete_vnets                = optional(bool, true)
    local_peered_address_spaces = optional(list(object({
      address_prefix = string
    })))
    remote_peered_address_spaces = optional(list(object({
      address_prefix = string
    })))
    local_peered_subnets = optional(list(object({
      subnet_name = string
    })))
    remote_peered_subnets = optional(list(object({
      subnet_name = string
    })))
    use_remote_gateways                   = optional(bool, false)
    create_reverse_peering                = optional(bool, false)
    reverse_name                          = optional(string)
    reverse_allow_forwarded_traffic       = optional(bool, false)
    reverse_allow_gateway_transit         = optional(bool, false)
    reverse_allow_virtual_network_access  = optional(bool, true)
    reverse_do_not_verify_remote_gateways = optional(bool, false)
    reverse_enable_only_ipv6_peering      = optional(bool, false)
    reverse_peer_complete_vnets           = optional(bool, true)
    reverse_local_peered_address_spaces = optional(list(object({
      address_prefix = string
    })))
    reverse_remote_peered_address_spaces = optional(list(object({
      address_prefix = string
    })))
    reverse_local_peered_subnets = optional(list(object({
      subnet_name = string
    })))
    reverse_remote_peered_subnets = optional(list(object({
      subnet_name = string
    })))
    reverse_use_remote_gateways = optional(bool, false)
  }))
```

Default: `{}`

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: the resource type being deployed see naming standards for example

Type: `string`

Default: `"vnet"`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description:   (Optional) A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - (Optional) The description of the role assignment.
- `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - (Optional) The condition which will be used to scope the role assignment.
- `condition_version` - (Optional) The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are '2.0'.
- `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.
- `principal_type` - (Optional) The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.

  > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

Type:

```hcl
map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_subnets"></a> [subnets](#input\_subnets)

Description: A map of subnets to create

Type:

```hcl
map(object({
    resourcetype      = optional(string)
    additionalcontext = optional(string)
    name              = optional(string)
    address_prefixes  = optional(list(string))
    service_endpoints = optional(list(string), [])
    delegations = optional(map(object({
      name    = string
      actions = list(string)
    })), {})

    nat_gateway = optional(object({
      id = string
    }))
    network_security_group = optional(object({
      id = string
    }))
    private_endpoint_network_policies             = optional(string, "Enabled")
    private_link_service_network_policies_enabled = optional(bool, true)
    route_table = optional(object({
      id = string
    }))
    service_endpoint_policies = optional(map(object({
      id = string
    })))
    default_outbound_access_enabled = optional(bool, true)
    sharing_scope                   = optional(string, null)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })))
  }))
```

Default: `{}`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: (Optional) Tags of the resource.

Type: `map(string)`

Default: `null`

### <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id)

Description: The ID of the virtual hub to connect to.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_name"></a> [name](#output\_name)

Description: The name of the newly created vNet

### <a name="output_peerings"></a> [peerings](#output\_peerings)

Description: The peerings of the newly created vNet

### <a name="output_resource"></a> [resource](#output\_resource)

Description: The resource object of the newly created vNet

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: The id of the newly created vNet

### <a name="output_subnets"></a> [subnets](#output\_subnets)

Description: The subnets of the newly created vNet

### <a name="output_vhub-connection"></a> [vhub-connection](#output\_vhub-connection)

Description: The virtual hub connection of the newly created vNet

### <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space)

Description: The address space of the newly created vNet

### <a name="output_vnet_location"></a> [vnet\_location](#output\_vnet\_location)

Description: The location of the newly created vNet
<!-- END_TF_DOCS -->
