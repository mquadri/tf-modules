<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (>= 1.0.0)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (>= 2.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.116, < 5.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.6)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azuread"></a> [azuread](#provider\_azuread) (>= 2.0.0)

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.116, < 5.0)

- <a name="provider_random"></a> [random](#provider\_random) (~> 3.6)

- <a name="provider_validation"></a> [validation](#provider\_validation) (~> 1.1.1)

## Modules

The following Modules are called:

### <a name="module_avm-res-compute-virtualmachine"></a> [avm-res-compute-virtualmachine](#module\_avm-res-compute-virtualmachine)

Source: Azure/avm-res-compute-virtualmachine/azurerm

Version: 0.18.1

### <a name="module_avm-res-network-nsg"></a> [avm-res-network-nsg](#module\_avm-res-network-nsg)

Source: Azure/avm-res-network-networksecuritygroup/azurerm

Version: 0.4.0

### <a name="module_recovery"></a> [recovery](#module\_recovery)

Source: ../recovery-services-vault

Version:

## Resources

The following resources are used by this module:

- [azurerm_proximity_placement_group.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/proximity_placement_group) (resource)
- [random_string.username](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) (resource)
- [validation_warning.aad_ssh_login_extension_version](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.admin_password](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.admin_ssh_public_key](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.custom_image_id](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.managed_by](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.public_only](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.recovery_vault_name](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.validate_public_ip_has_exception](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.vm_admin_pwd_keyvault_secret_name](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [azuread_group.default_contrib_group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) (data source)
- [azuread_group.vmadminlogin](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) (data source)
- [azuread_group.vmcontributor](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) (data source)
- [azuread_group.vmreader](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) (data source)
- [azuread_group.vmuserlogin](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) (data source)
- [azuread_service_principal.ad_default_spn](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) (data source)
- [azurerm_key_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) (data source)
- [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_security_group) (data source)
- [azurerm_network_security_group.nsg_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_security_group) (data source)
- [azurerm_resource_group.vnet-public-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_resource_group.vnet-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_storage_account.diagstorage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) (data source)
- [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) (data source)
- [azurerm_subnet.subnet_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

### <a name="input_appFunction"></a> [appFunction](#input\_appFunction)

Description: app function

Type: `string`

### <a name="input_app_id"></a> [app\_id](#input\_app\_id)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_appname"></a> [appname](#input\_appname)

Description: the app name for the resources.  Used for tagging and naming purposes

Type: `string`

### <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation)

Description: can only be sharedcosts or chargeback

Type: `string`

### <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager)

Description: The app owner manager responsible for resources. Used for tagging purposes.

Type: `string`

### <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech)

Description: The app owner responsible for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner)

Description: The budget owner responsible for resources. Used for tagging purposes.

Type: `string`

### <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter)

Description: The cost center code for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_costDivision"></a> [costDivision](#input\_costDivision)

Description: cost division

Type: `string`

### <a name="input_costVP"></a> [costVP](#input\_costVP)

Description: The cost vp for resources. Used for tagging purposes.

Type: `string`

### <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline)

Description: year resource created

Type: `string`

### <a name="input_data_disks"></a> [data\_disks](#input\_data\_disks)

Description: n/a

Type:

```hcl
map(object({
    data_disk_name         = string
    data_disk_type         = string
    data_disk_machine_lun  = number
    data_disk_caching      = string
    data_disk_size_gb      = number
    trusted_launch_enabled = optional(bool, false)
  }))
```

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where resources will be deployed

Type: `string`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

### <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration)

Description: The migration tag used.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the VM

Type: `string`

### <a name="input_os_support"></a> [os\_support](#input\_os\_support)

Description: Support new os\_support\_tag upon a sever creation/migration: 1) na\_unix, 2) na\_windows and 3) SFWAPP-ENG-AD

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: name of the resource group where to place the vm

Type: `string`

### <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name)

Description: Specifies the name of the Subnet.

Type: `string`

### <a name="input_virtual_machine_size"></a> [virtual\_machine\_size](#input\_virtual\_machine\_size)

Description: Instance size to be provisioned

Type: `string`

### <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name)

Description: Specifies the name of the Virtual Network this Subnet is located within

Type: `string`

### <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name)

Description: resource group name where the vnet is installed

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aad_ssh_login_extension_version"></a> [aad\_ssh\_login\_extension\_version](#input\_aad\_ssh\_login\_extension\_version)

Description: VM Extension version for Azure Active Directory SSH Login extension

Type: `string`

Default: `"1.0"`

### <a name="input_accelerated_networking"></a> [accelerated\_networking](#input\_accelerated\_networking)

Description: Enable accelerated networking?

Type: `bool`

Default: `false`

### <a name="input_additional_security_rules"></a> [additional\_security\_rules](#input\_additional\_security\_rules)

Description:  - `access` - (Required) Specifies whether network traffic is allowed or denied. Possible values are `Allow` and `Deny`.
 - `name` - (Required) Name of the network security rule to be created.
 - `description` - (Optional) A description for this rule. Restricted to 140 characters.
 - `destination_address_prefix` - (Optional) CIDR or destination IP range or * to match any IP. Tags such as `VirtualNetwork`, `AzureLoadBalancer` and `Internet` can also be used. Besides, it also supports all available Service Tags like ‘Sql.WestEurope‘, ‘Storage.EastUS‘, etc. You can list the available service tags with the CLI: ```shell az network list-service-tags --location westcentralus
```. For further information please see [Azure CLI
 - `destination_address_prefixes` - (Optional) List of destination address prefixes. Tags may not be used. This is required if `destination_address_prefix` is not specified.
 - `destination_application_security_group_ids` - (Optional) A List of destination Application Security Group IDs
 - `destination_port_range` - (Optional) Destination Port or Range. Integer or range between `0` and `65535` or `*` to match any. This is required if `destination_port_ranges` is not specified.
 - `destination_port_ranges` - (Optional) List of destination ports or port ranges. This is required if `destination_port_range` is not specified.
 - `direction` - (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are `Inbound` and `Outbound`.
 - `name` - (Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group. Changing this forces a new resource to be created.
 - `priority` - (Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.
 - `protocol` - (Required) Network protocol this rule applies to. Possible values include `Tcp`, `Udp`, `Icmp`, `Esp`, `Ah` or `*` (which matches all).
 - `resource_group_name` - (Required) The name of the resource group in which to create the Network Security Rule. Changing this forces a new resource to be created.
 - `source_address_prefix` - (Optional) CIDR or source IP range or * to match any IP. Tags such as `VirtualNetwork`, `AzureLoadBalancer` and `Internet` can also be used. This is required if `source_address_prefixes` is not specified.
 - `source_address_prefixes` - (Optional) List of source address prefixes. Tags may not be used. This is required if `source_address_prefix` is not specified.
 - `source_application_security_group_ids` - (Optional) A List of source Application Security Group IDs
 - `source_port_range` - (Optional) Source Port or Range. Integer or range between `0` and `65535` or `*` to match any. This is required if `source_port_ranges` is not specified.
 - `source_port_ranges` - (Optional) List of source ports or port ranges. This is required if `source_port_range` is not specified.

 ---
 `timeouts` block supports the following:
 - `create` - (Defaults to 30 minutes) Used when creating the Network Security Rule.
 - `delete` - (Defaults to 30 minutes) Used when deleting the Network Security Rule.
 - `read` - (Defaults to 5 minutes) Used when retrieving the Network Security Rule.
 - `update` - (Defaults to 30 minutes) Used when updating the Network Security Rule.

Type:

```hcl
map(object({
    access                                     = string
    name                                       = string
    description                                = optional(string)
    destination_address_prefix                 = optional(string)
    destination_address_prefixes               = optional(set(string))
    destination_application_security_group_ids = optional(set(string))
    destination_port_range                     = optional(string)
    destination_port_ranges                    = optional(set(string))
    direction                                  = string
    priority                                   = number
    protocol                                   = string
    source_address_prefix                      = optional(string)
    source_address_prefixes                    = optional(set(string))
    source_application_security_group_ids      = optional(set(string))
    source_port_range                          = optional(string)
    source_port_ranges                         = optional(set(string))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
```

Default: `{}`

### <a name="input_additional_unattend_contents"></a> [additional\_unattend\_contents](#input\_additional\_unattend\_contents)

Description: List of objects representing unattend content settings

- `content` (Required) - The XML formatted content that is added to the unattend.xml file for the specified path and component. Changing this forces a new resource to be created.
- `setting` (Required) - The name of the setting to which the content applies. Possible values are `AutoLogon` and `FirstLogonCommands`. Changing this forces a new resource to be created.

Example Inputs:
```hcl
#Example Reboot
additional_unattend_contents = [
  {
    content = "<FirstLogonCommands><SynchronousCommand><CommandLine>shutdown /r /t 0 /c \"initial reboot\"</CommandLine><Description>reboot</Description><Order>1</Order></SynchronousCommand></FirstLogonCommands>"
    setting = "FirstLogonCommands"
  }
]
```

Type:

```hcl
list(object({
    content = string
    setting = string
  }))
```

Default: `[]`

### <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password)

Description: Default Password - Random if left blank. For Linux, need to have disable\_password\_authentication set to false

Type: `string`

Default: `""`

### <a name="input_admin_ssh_public_key"></a> [admin\_ssh\_public\_key](#input\_admin\_ssh\_public\_key)

Description: (Linux) Public SSH Key - Generated if left blank

Type: `string`

Default: `""`

### <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username)

Description: Default Username - Random if left blank

Type: `string`

Default: `""`

### <a name="input_akv_resource_id"></a> [akv\_resource\_id](#input\_akv\_resource\_id)

Description: Resource ID of the AKV to store the machine credentials. Use this one in case that the AKV is in a different subscription

Type: `string`

Default: `null`

### <a name="input_auto_shutdown_enabled"></a> [auto\_shutdown\_enabled](#input\_auto\_shutdown\_enabled)

Description: Enable Auto Shutdown?

Type: `bool`

Default: `false`

### <a name="input_auto_shutdown_notification_enabled"></a> [auto\_shutdown\_notification\_enabled](#input\_auto\_shutdown\_notification\_enabled)

Description: Enable Auto Shutdown Notification

Type: `bool`

Default: `false`

### <a name="input_auto_shutdown_notification_time"></a> [auto\_shutdown\_notification\_time](#input\_auto\_shutdown\_notification\_time)

Description: Time to send the shutdown notification prior shutdown 0 - 120 minutes

Type: `string`

Default: `null`

### <a name="input_auto_shutdown_notification_webhook_url"></a> [auto\_shutdown\_notification\_webhook\_url](#input\_auto\_shutdown\_notification\_webhook\_url)

Description: Webhook URL to send the shutdown notification

Type: `string`

Default: `null`

### <a name="input_auto_shutdown_time"></a> [auto\_shutdown\_time](#input\_auto\_shutdown\_time)

Description: Time to shutdown the VM - Format: HHMM

Type: `string`

Default: `"0000"`

### <a name="input_auto_shutdown_timezone"></a> [auto\_shutdown\_timezone](#input\_auto\_shutdown\_timezone)

Description: Timezone to shutdown the VM - Format: UTC, GMT, etc https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/

Type: `string`

Default: `"UTC"`

### <a name="input_availability_set_resource_id"></a> [availability\_set\_resource\_id](#input\_availability\_set\_resource\_id)

Description: (Optional) Specifies the Azure Resource ID of the Availability Set in which the Virtual Machine should exist. Cannot be used along with `new_availability_set`, `new_capacity_reservation_group`, `capacity_reservation_group_id`, `virtual_machine_scale_set_id`, `zone`. Changing this forces a new resource to be created.

Type: `string`

Default: `null`

### <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone)

Description: The Zone in which this Virtual Machine should be created. Changing this forces a new resource to be created.

Type: `number`

Default: `null`

### <a name="input_azure_backup_configurations"></a> [azure\_backup\_configurations](#input\_azure\_backup\_configurations)

Description: This object describes the backup configuration to use for this VM instance. Provide the backup details for configuring the backup. It defaults to null.

- `<map_key>` - An arbitrary map key to avoid terraform issues with know before apply challenges
  - `resource_group_name` - (Optional) - The resource group name for the resource group containing the recovery services vault. If not supplied it will default to the deployment resource group.
  - `recovery_vault_name` - (Required) - The name of the recovery services vault where the backup will be stored.
  - `backup_policy_resource_id`    - (Optional) - Required during creation, but can be optional when the protection state is not `ProtectionStopped`.
  - `exclude_disk_luns`   - (Optional) - A list of Disk Logical Unit Numbers (LUN) to be excluded from VM Protection.
  - `include_disk_luns`   - (Optional) - A list of Disk Logical Unit Numbers (LUN) to be included for VM Protection.
  - `protection_state`    - (Optional) - Specifies the protection state of the backup. Possible values are `Invalid`, `Protected`, `ProtectionStopped`, `ProtectionError`, and `ProtectionPaused`.

Example Input:  
azure\_backup\_configurations = {  
  arbitrary\_key = {  
    resource\_group\_name = azurerm\_recovery\_services\_vault.test\_vault.resource\_group\_name  
    recovery\_vault\_name = azurerm\_recovery\_services\_vault.test\_vault.name  
    backup\_policy\_resource\_id    = azurerm\_backup\_policy\_vm.test\_policy.id  
    exclude\_disk\_luns   = [1]
  }
}

Type:

```hcl
map(object({
    resource_group_name        = optional(string, null)
    recovery_vault_name        = optional(string, null)
    recovery_vault_resource_id = string
    backup_policy_resource_id  = optional(string, null)
    exclude_disk_luns          = optional(list(number), null)
    include_disk_luns          = optional(list(number), null)
  }))
```

Default: `{}`

### <a name="input_bypass_platform_safety_checks_on_user_schedule_enabled"></a> [bypass\_platform\_safety\_checks\_on\_user\_schedule\_enabled](#input\_bypass\_platform\_safety\_checks\_on\_user\_schedule\_enabled)

Description: (Optional) Specifies whether to skip platform scheduled patching when a user schedule is associated with the VM. This value can only be set to true when patch\_mode is set to AutomaticByPlatform

Type: `bool`

Default: `false`

### <a name="input_capacity_reservation_group_resource_id"></a> [capacity\_reservation\_group\_resource\_id](#input\_capacity\_reservation\_group\_resource\_id)

Description: (Optional) Specifies the Azure Resource ID of the Capacity Reservation Group with the Virtual Machine should be allocated to. Cannot be used with availability\_set\_id or proximity\_placement\_group\_id

Type: `string`

Default: `null`

### <a name="input_computer_name"></a> [computer\_name](#input\_computer\_name)

Description: (Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the `vm_name` field. If the value of the `vm_name` field is not a valid `computer_name`, then you must specify `computer_name`. Changing this forces a new resource to be created.

Type: `string`

Default: `null`

### <a name="input_create_recovery_vault"></a> [create\_recovery\_vault](#input\_create\_recovery\_vault)

Description: Set this to true if a new RG is required.

Type: `bool`

Default: `false`

### <a name="input_custom_data"></a> [custom\_data](#input\_custom\_data)

Description: The Base64-Encoded Custom Data which should be used for this Virtual Machine

Type: `string`

Default: `null`

### <a name="input_custom_image_id"></a> [custom\_image\_id](#input\_custom\_image\_id)

Description: Custom machine image ID

Type: `string`

Default: `null`

### <a name="input_data_disk_enabled"></a> [data\_disk\_enabled](#input\_data\_disk\_enabled)

Description: n/a

Type: `bool`

Default: `true`

### <a name="input_dedicated_host_group_resource_id"></a> [dedicated\_host\_group\_resource\_id](#input\_dedicated\_host\_group\_resource\_id)

Description: (Optional) The Azure Resource ID of the dedicated host group where this virtual machine should run. Conflicts with dedicated\_host\_resource\_id (dedicated\_host\_group\_id on the azurerm provider)

Type: `string`

Default: `null`

### <a name="input_dedicated_host_resource_id"></a> [dedicated\_host\_resource\_id](#input\_dedicated\_host\_resource\_id)

Description: (Optional) The Azure Resource ID of the dedicated host where this virtual machine should run. Conflicts with dedicated\_host\_group\_resource\_id (dedicated\_host\_group\_id on the azurerm provider)

Type: `string`

Default: `null`

### <a name="input_default_private_nic_enabled"></a> [default\_private\_nic\_enabled](#input\_default\_private\_nic\_enabled)

Description: Whether to create a private NIC

Type: `bool`

Default: `false`

### <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings)

Description: This map object is used to define the diagnostic settings on the virtual machine.  This functionality does not implement the diagnostic settings extension, but instead can be used to configure sending the vm metrics to one of the standard targets.

- `<map_key>` - unique key to define the map element
  - `name`                                     = (required) - Name to use for the Diagnostic setting configuration.  Changing this creates a new resource
  - `log_categories_and_groups`                = (Optional) - List of strings used to define log categories and groups. Currently not valid for the VM resource
  - `metric_categories`                        = (Optional) - List of strings used to define metric categories. Currently only AllMetrics is valid
  - `log_analytics_destination_type`           = (Optional) - Valid values are null, AzureDiagnostics, and Dedicated.  Defaults to null
  - `workspace_resource_id`                    = (Optional) - The Log Analytics Workspace Azure Resource ID when sending logs or metrics to a Log Analytics Workspace
  - `storage_account_resource_id`              = (Optional) - The Storage Account Azure Resource ID when sending logs or metrics to a Storage Account
  - `event_hub_authorization_rule_resource_id` = (Optional) - The Event Hub Namespace Authorization Rule Resource ID when sending logs or metrics to an Event Hub Namespace
  - `event_hub_name`                           = (Optional) - The Event Hub name when sending logs or metrics to an Event Hub
  - `marketplace_partner_resource_id`          = (Optional) - The marketplace partner solution Azure Resource ID when sending logs or metrics to a partner integration

Example Input:  
  diagnostic\_settings = {  
    vm\_diags = {  
      name                  = module.naming.monitor\_diagnostic\_setting.name\_unique  
      workspace\_resource\_id = azurerm\_log\_analytics\_workspace.this\_workspace.id  
      metric\_categories     = ["AllMetrics"]
    }
  }

Type:

```hcl
map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), [])
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

### <a name="input_disable_password_authentication"></a> [disable\_password\_authentication](#input\_disable\_password\_authentication)

Description: (Linux) Disable Password Authentication

Type: `bool`

Default: `true`

### <a name="input_disk_controller_type"></a> [disk\_controller\_type](#input\_disk\_controller\_type)

Description: (Optional) - Specifies the Disk Controller Type used for this Virtual Machine.  Possible values are `SCSI` and `NVME`.

Type: `string`

Default: `null`

### <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone)

Description: (Optional) Specifies the Edge Zone within the Azure Region where this Virtual Machine should exist. Changing this forces a new Virtual Machine to be created.

Type: `string`

Default: `null`

### <a name="input_enable_boot_diagnostics"></a> [enable\_boot\_diagnostics](#input\_enable\_boot\_diagnostics)

Description: Whether to enable boot diagnostics on the virtual machine.

Type: `bool`

Default: `true`

### <a name="input_encryption_at_host_enabled"></a> [encryption\_at\_host\_enabled](#input\_encryption\_at\_host\_enabled)

Description: (Optional) Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?

Type: `bool`

Default: `null`

### <a name="input_eviction_policy"></a> [eviction\_policy](#input\_eviction\_policy)

Description: (Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are Deallocate and Delete. Changing this forces a new resource to be created. This value can only be set when priority is set to Spot

Type: `string`

Default: `null`

### <a name="input_existing_user_assigned_identity_name"></a> [existing\_user\_assigned\_identity\_name](#input\_existing\_user\_assigned\_identity\_name)

Description: Provide existing user assigned identity name

Type: `string`

Default: `null`

### <a name="input_extensions"></a> [extensions](#input\_extensions)

Description: This map of objects is used to create additional `azurerm_virtual_machine_extension` resources, the argument descriptions could be found at [the document](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension).

- `<map key>` - Provide a custom key value to define each extension object
  - `name` (Required) - Set a custom name on this value if you want the guest configuration extension to have a custom name
  - `publisher` (Required) - Configure the publisher for the extension to be deployed. The Publisher and Type of Virtual Machine Extensions can be found using the Azure CLI, via: az vm extension image list --location westus -o table
  - `type` (Required) - Configure the type value for the extension to be deployed.
  - `type_handler_version` (Required) - The type handler version for the extension. A common value is 1.0.
  - `auto_upgrade_minor_version` (Optional) - Set this to false to avoid automatic upgrades for minor versions on the extension.  Defaults to true
  - `automatic_upgrade_enabled` (Optional) - Set this to false to avoid automatic upgrades for major versions on the extension.  Defaults to true
  - `failure_suppression_enabled` (Optional) - Should failures from the extension be suppressed? Possible values are true or false. Defaults to false. Operational failures such as not connecting to the VM will not be suppressed regardless of the failure\_suppression\_enabled value.
  - `settings` (Optional) - The settings passed to the extension, these are specified as a JSON object in a string. Certain VM Extensions require that the keys in the settings block are case sensitive. If you're seeing unhelpful errors, please ensure the keys are consistent with how Azure is expecting them (for instance, for the JsonADDomainExtension extension, the keys are expected to be in TitleCase.)
  - `protected_settings` (Optional) - The protected\_settings passed to the extension, like settings, these are specified as a JSON object in a string. Certain VM Extensions require that the keys in the protected\_settings block are case sensitive. If you're seeing unhelpful errors, please ensure the keys are consistent with how Azure is expecting them (for instance, for the JsonADDomainExtension extension, the keys are expected to be in TitleCase.)
  - `provision_after_extensions` (Optional) - list of strings that specifies the collection of extension names after which this extension needs to be provisioned.
  - `protected_settings_from_key_vault` (Optional) object for protected settings.  Cannot be used with `protected_settings`
    - `secret_url` (Required) - The Secret URL of a Key Vault Certificate. This can be sourced from the `secret_id` field within the `azurerm_key_vault_certificate` Resource.
    - `source_vault_id` (Required) - the Azure resource ID of the key vault holding the secret
  - `tags` (Optional) - A mapping of tags to assign to the extension resource.

Example Inputs:

```hcl
#custom script extension example - linux
extensions = [
  {
    name = "CustomScriptExtension"
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"
    settings = <<SETTINGS
      {
        "script": "<base 64 encoded script file>"
      }
    SETTINGS
  }
]

#custom script extension example - windows
extensions = [
  {
    name = "CustomScriptExtension"
    publisher = "Microsoft.Compute"
    type = "CustomScriptExtension"
    type_handler_version = "1.10"
    settings = <<SETTINGS
      {
        "timestamp":123456789
      }
    SETTINGS
    protected_settings = <<PROTECTED_SETTINGS
      {
        "commandToExecute": "myExecutionCommand",
        "storageAccountName": "myStorageAccountName",
        "storageAccountKey": "myStorageAccountKey",
        "managedIdentity" : {},
        "fileUris": [
            "script location"
        ]
      }
    PROTECTED_SETTINGS        
  }
]
```

Type:

```hcl
map(object({
    kernel_type                 = string
    name                        = string
    publisher                   = string
    type                        = string
    type_handler_version        = string
    auto_upgrade_minor_version  = optional(bool)
    automatic_upgrade_enabled   = optional(bool)
    failure_suppression_enabled = optional(bool, false)
    settings                    = optional(string)
    protected_settings          = optional(string)
    provision_after_extensions  = optional(list(string), [])
    tags                        = optional(map(string), null)
    protected_settings_from_key_vault = optional(object({
      secret_url      = string
      source_vault_id = string
    }))
  }))
```

Default: `{}`

### <a name="input_file_share_backup_policies"></a> [file\_share\_backup\_policies](#input\_file\_share\_backup\_policies)

Description: A list of backup policies for file shares.

Type:

```hcl
map(object({
    name      = string
    timezone  = string
    frequency = string
    time      = string
    daily = optional(list(object({
      count = number
    })), [])
    weekly = optional(list(object({
      count    = number
      weekdays = set(string)
    })), [])
    monthly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
    yearly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      months            = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
  }))
```

Default: `{}`

### <a name="input_generate_admin_password_or_ssh_key"></a> [generate\_admin\_password\_or\_ssh\_key](#input\_generate\_admin\_password\_or\_ssh\_key)

Description: Set this value to true if the deployment should create a strong password for the admin user.

Type: `bool`

Default: `true`

### <a name="input_hibernation_enabled"></a> [hibernation\_enabled](#input\_hibernation\_enabled)

Description: Should the capacity to enable the hibernation be supported on this Virtual Machine.

Type: `bool`

Default: `false`

### <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids)

Description: Specifies a list of user managed identity ids to be assigned to the VM

Type: `list(string)`

Default: `[]`

### <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type)

Description: The Managed Service Identity Type of this Virtual Machine. Possible values are SystemAssigned (where Azure will generate a Managed Identity for you), UserAssigned (where you can specify the Managed Identities ID).

Type: `string`

Default: `"SystemAssigned"`

### <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled)

Description: Choose if infra encryption should be enabled

Type: `bool`

Default: `false`

### <a name="input_kernel_type"></a> [kernel\_type](#input\_kernel\_type)

Description: Virtual machine kernel - windows or linux

Type: `string`

Default: `"linux"`

### <a name="input_license_type"></a> [license\_type](#input\_license\_type)

Description: (Optional) For Linux virtual machine specifies the BYOL Type for this Virtual Machine, possible values are `RHEL_BYOS` and `SLES_BYOS`. For Windows virtual machine specifies the type of on-premise license (also known as [Azure Hybrid Use Benefit](https://docs.microsoft.com/windows-server/get-started/azure-hybrid-benefit)) which should be used for this Virtual Machine, possible values are `None`, `Windows_Client` and `Windows_Server`.

Type: `string`

Default: `null`

### <a name="input_lock"></a> [lock](#input\_lock)

Description: "The lock configuration to apply to this virtual machine and all of it's child resources. The following properties are specified.

- `kind` - (Required) - The type of the lock.  Possible values are `CanNotDelete` and `ReadOnly`.
- `name` - (Optional) - The name of the lock.  If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.

Example Inputs:
```hcl
lock = {
  name = "lock-{resourcename}" # optional
  type = "CanNotDelete"
}
```

Type:

```hcl
object({
    name = optional(string, null)
    kind = string
  })
```

Default: `null`

### <a name="input_machine_creds_akv_rg"></a> [machine\_creds\_akv\_rg](#input\_machine\_creds\_akv\_rg)

Description: Resource Group of the AKV to store the machine credentials

Type: `string`

Default: `""`

### <a name="input_machine_ssh_port"></a> [machine\_ssh\_port](#input\_machine\_ssh\_port)

Description: The SSH port to be used for the VM

Type: `number`

Default: `22`

### <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by)

Description: resource group is managed by

Type: `string`

Default: `null`

### <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities)

Description: An object that sets the managed identity configuration for the virtual machine being deployed. Be aware that capabilities such as the Azure Monitor Agent and Role Assignments require that a managed identity has been configured.

- `system_assigned`            = (Optional) Specifies whether the System Assigned Managed Identity should be enabled.  Defaults to false.
- `user_assigned_resource_ids` = (Optional) Specifies a set of User Assigned Managed Identity IDs to be assigned to this Virtual Machine.

Example Inputs:
```hcl
#default system managed identity
managed_identities = {
  system_assigned = true
}
#user assigned managed identity only
managed_identities           = {
  user_assigned_resource_ids = ["<azure resource ID of a user assigned managed identity>"]
}
#user assigned and system assigned managed identities
managed_identities  = {
  system_assigned            = true
  user_assigned_resource_ids = ["<azure resource ID of a user assigned managed identity>"]
}
```

Type:

```hcl
object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
```

Default: `{}`

### <a name="input_max_bid_price"></a> [max\_bid\_price](#input\_max\_bid\_price)

Description: (Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the `eviction_policy`. Defaults to `-1`, which means that the Virtual Machine should not be evicted for price reasons. This can only be configured when `priority` is set to `Spot`.

Type: `number`

Default: `-1`

### <a name="input_migration"></a> [migration](#input\_migration)

Description: The migration tag used.

Type: `bool`

Default: `true`

### <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces)

Description: A map of objects representing each network virtual machine network interface

- `<map key>` - Use a custom map key to define each network interface
  - `name` = (Required) The name of the Network Interface. Changing this forces a new resource to be created.
  - `ip_configurations` - A required map of objects defining each interfaces IP configurations
    - `<map key>` - Use a custom map key to define each ip configuration
      - `name`                                                        = (Required) - A name used for this IP Configuration.
      - `app_gateway_backend_pools`                                   = (Optional) - A map defining app gateway backend pool(s) this IP configuration should be associated to.
        - `<map key>` - Use a custom map key to define each app gateway backend pool association.  This is done to handle issues with certain details not being known until after apply.
          - `app_gateway_backend_pool_resource_id`                    = (Required) - An application gateway backend pool Azure Resource ID can be entered to join this ip configuration to the backend pool of an Application Gateway.    
      - `create_public_ip_address`                                    = (Optional) - Select true here to have the module create the public IP address for this IP Configuration
      - `gateway_load_balancer_frontend_ip_configuration_resource_id` = (Optional) - The Frontend IP Configuration Azure Resource ID of a Gateway SKU Load Balancer.)
      - `is_primary_ipconfiguration`                                  = (Optional) - Is this the Primary IP Configuration? Must be true for the first ip\_configuration when multiple are specified.
      - `load_balancer_backend_pools`                                 = (Optional) - A map defining load balancer backend pool(s) this IP configuration should be associated to.
        - `<map key>` - Use a custom map key to define each load balancer backend pool association.  This is done to handle issues with certain details not being known until after apply.
          - `load_balancer_backend_pool_resource_id`                  = (Required) - A Load Balancer backend pool Azure Resource ID can be entered to join this ip configuration to a load balancer backend pool.
      - `load_balancer_nat_rules`                                     = (Optional) - A map defining load balancer NAT rule(s) that this IP Configuration should be associated to.
        - `<map key>` - Use a custom map key to define each load balancer NAT Rule association.  This is done to handle issues with certain details not being known until after apply.  
          - `load_balancer_nat_rule_resource_id`                        = (Optional) - A Load Balancer Nat Rule Azure Resource ID can be entered to associate this ip configuration to a load balancer NAT rule.
      - `private_ip_address`                                          = (Optional) - The Static IP Address which should be used. Configured when private\_ip\_address\_allocation is set to Static
      - `private_ip_address_allocation`                               = (Optional) - The allocation method used for the Private IP Address. Possible values are Dynamic and Static. Dynamic means "An IP is automatically assigned during creation of this Network Interface" and is the default; Static means "User supplied IP address will be used"
      - `private_ip_address_version`                                  = (Optional) - The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4.  
      - `private_ip_subnet_resource_id`                               = (Optional) - The Azure Resource ID of the Subnet where this Network Interface should be located in.
      - `public_ip_address_resource_id`                               = (Optional) - Reference to a Public IP Address resource ID to associate with this NIC  
  - `accelerated_networking_enabled`                                  = (Optional) - Should Accelerated Networking be enabled? Defaults to false. Only certain Virtual Machine sizes are supported for Accelerated Networking. To use Accelerated Networking in an Availability Set, the Availability Set must be deployed onto an Accelerated Networking enabled cluster.  
  - `application_security_groups`                                     = (Optional) - A map defining the Application Security Group(s) that this network interface should be a part of.
    - `<map key>` - Use a custom map key to define each Application Security Group association.  This is done to handle issues with certain details not being known until after apply.   
      - `application_security_group_resource_id`                     = (Required) - The Application Security Group (ASG) Azure Resource ID for this Network Interface to be associated to.
  - `diagnostic_settings`                                             = (Optional) - A map of objects defining the network interface resource diagnostic settings
    - `<map key>` - Use a custom map key to define each diagnostic setting configuration
      - `name`                                     = (required) - Name to use for the Diagnostic setting configuration.  Changing this creates a new resource
      - `event_hub_authorization_rule_resource_id` = (Optional) - The Event Hub Namespace Authorization Rule Resource ID when sending logs or metrics to an Event Hub Namespace
      - `event_hub_name`                           = (Optional) - The Event Hub name when sending logs or metrics to an Event Hub  
      - `log_analytics_destination_type`           = (Optional) - Valid values are null, AzureDiagnostics, and Dedicated.  Defaults to null
      - `log_categories_and_groups`                = (Optional) - List of strings used to define log categories and groups. Currently not valid for the VM resource
      - `marketplace_partner_resource_id`          = (Optional) - The marketplace partner solution Azure Resource ID when sending logs or metrics to a partner integration
      - `metric_categories`                        = (Optional) - List of strings used to define metric categories. Currently only AllMetrics is valid
      - `storage_account_resource_id`              = (Optional) - The Storage Account Azure Resource ID when sending logs or metrics to a Storage Account
      - `workspace_resource_id`                    = (Optional) - The Log Analytics Workspace Azure Resource ID when sending logs or metrics to a Log Analytics Workspace
  - `dns_servers`                                                     = (Optional) - A list of IP Addresses defining the DNS Servers which should be used for this Network Interface.
  - `inherit_tags`                                                    = (Optional) - Defaults to true.  Set this to false if only the tags defined on this resource should be applied. This is potential future functionality and is currently ignored.
  - `internal_dns_name_label`                                         = (Optional) - The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network.
  - `ip_forwarding_enabled`                                           = (Optional) - Should IP Forwarding be enabled? Defaults to false
  - `lock_level`                                                      = (Optional) - Set this value to override the resource level lock value.  Possible values are `None`, `CanNotDelete`, and `ReadOnly`.
  - `lock_name`                                                       = (Optional) - The name for the lock on this nic
  - `network_security_groups`                                         = (Optional) - A map describing Network Security Group(s) that this Network Interface should be associated to.
    - `<map key>` - Use a custom map key to define each network security group association.  This is done to handle issues with certain details not being known until after apply.
      - `network_security_group_resource_id` = (Optional) - The Network Security Group (NSG) Azure Resource ID used to associate this Network Interface to the NSG.
  - `resource_group_name` (Optional) - Specify a resource group name if the network interface should be created in a separate resource group from the virtual machine
  - `role_assignments` = An optional map of objects defining role assignments on the individual network configuration resource
    - `<map key>` - Use a custom map key to define each role assignment configuration  
      - `assign_to_child_public_ip_addresses`        = (Optional) - Set this to true if the assignment should also apply to any children public IP addresses.
      - `condition`                                  = (Optional) - The condition that limits the resources that the role can be assigned to. Changing this forces a new resource to be created.
      - `condition_version`                          = (Optional) - The version of the condition. Possible values are 1.0 or 2.0. Changing this forces a new resource to be created.
      - `delegated_managed_identity_resource_id`     = (Optional) - The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created.
      - `description`                                = (Optional) - The description for this Role Assignment. Changing this forces a new resource to be created.  
      - `principal_id`                               = (optional) - The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created.
      - `role_definition_id_or_name`                 = (Optional) - The Scoped-ID of the Role Definition or the built-in role name. Changing this forces a new resource to be created. Conflicts with role\_definition\_name   
      - `skip_service_principal_aad_check`           = (Optional) - If the principal\_id is a newly provisioned Service Principal set this value to true to skip the Azure Active Directory check which may fail due to replication lag. This argument is only valid if the principal\_id is a Service Principal identity. Defaults to true.
      - `principal_type`                             = (Optional) - The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.
  - `tags`                           = (Optional) - A mapping of tags to assign to the resource.

Example Inputs:

```hcl
#Simple private IP single NIC with IPV4 private address
network_interfaces = {
  network_interface_1 = {
    name = "testnic1"
    ip_configurations = {
      ip_configuration_1 = {
        name                          = "testnic1-ipconfig1"
        private_ip_subnet_resource_id = azurerm_subnet.this_subnet_1.id
      }
    }
  }
}

#Simple NIC with private and public IP address
network_interfaces = {
  network_interface_1 = {
    name = "testnic1"
    ip_configurations = {
      ip_configuration_1 = {
        name                          = "testnic1-ipconfig1"
        private_ip_subnet_resource_id = azurerm_subnet.this_subnet_1.id
        create_public_ip_address      = true
        public_ip_address_name        = "vm1-testnic1-publicip1"
      }
    }
  }
}
```

Type:

```hcl
map(object({
    name = string
    ip_configurations = map(object({
      name = string
      app_gateway_backend_pools = optional(map(object({
        app_gateway_backend_pool_resource_id = string
      })), {})
      create_public_ip_address                                    = optional(bool, false)
      gateway_load_balancer_frontend_ip_configuration_resource_id = optional(string)
      is_primary_ipconfiguration                                  = optional(bool, true)
      load_balancer_backend_pools = optional(map(object({
        load_balancer_backend_pool_resource_id = string
      })), {})
      load_balancer_nat_rules = optional(map(object({
        load_balancer_nat_rule_resource_id = string
      })), {})
      private_ip_address            = optional(string)
      private_ip_address_allocation = optional(string, "Dynamic")
      private_ip_address_version    = optional(string, "IPv4")
      private_ip_subnet_resource_id = optional(string)
      public_ip_address_lock_name   = optional(string)
      public_ip_address_name        = optional(string)
      public_ip_address_resource_id = optional(string)
    }))
    accelerated_networking_enabled = optional(bool, false)
    application_security_groups = optional(map(object({
      application_security_group_resource_id = string
    })), {})
    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), [])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, null)
      workspace_resource_id                    = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
    dns_servers             = optional(list(string))
    inherit_tags            = optional(bool, true)
    internal_dns_name_label = optional(string)
    ip_forwarding_enabled   = optional(bool, false)
    lock_level              = optional(string)
    lock_name               = optional(string)
    network_security_groups = optional(map(object({
      network_security_group_resource_id = string
    })), {})
    resource_group_name = optional(string)
    role_assignments = optional(map(object({
      principal_id                           = string
      role_definition_id_or_name             = string
      assign_to_child_public_ip_addresses    = optional(bool, true)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      principal_type                         = optional(string, null)
    })), {})
    tags = optional(map(string), null)
  }))
```

Default: `null`

### <a name="input_nic_nsg"></a> [nic\_nsg](#input\_nic\_nsg)

Description: NIC NSG for the Virtual machine NIC

Type: `string`

Default: `""`

### <a name="input_nsg_creation_enabled"></a> [nsg\_creation\_enabled](#input\_nsg\_creation\_enabled)

Description: Whether to create a NSG for VM

Type: `bool`

Default: `false`

### <a name="input_nsg_diagnostic_settings"></a> [nsg\_diagnostic\_settings](#input\_nsg\_diagnostic\_settings)

Description: A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

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

### <a name="input_nsg_rg"></a> [nsg\_rg](#input\_nsg\_rg)

Description: Resource Group for the NSG

Type: `string`

Default: `""`

### <a name="input_operating_system_disk_cache"></a> [operating\_system\_disk\_cache](#input\_operating\_system\_disk\_cache)

Description: Type of caching to use on the OS disk - Options: None, ReadOnly or ReadWrite

Type: `string`

Default: `"ReadWrite"`

### <a name="input_operating_system_disk_name"></a> [operating\_system\_disk\_name](#input\_operating\_system\_disk\_name)

Description: Name of the operating disk

Type: `string`

Default: `null`

### <a name="input_operating_system_disk_size_gb"></a> [operating\_system\_disk\_size\_gb](#input\_operating\_system\_disk\_size\_gb)

Description: Size of the internal OS disk in gigabytes

Type: `number`

Default: `null`

### <a name="input_operating_system_disk_type"></a> [operating\_system\_disk\_type](#input\_operating\_system\_disk\_type)

Description: Type of storage account to use with the OS disk - Options: Standard\_LRS, StandardSSD\_LRS or Premium\_LRS

Type: `string`

Default: `"StandardSSD_LRS"`

### <a name="input_operating_system_disk_write_accelerator"></a> [operating\_system\_disk\_write\_accelerator](#input\_operating\_system\_disk\_write\_accelerator)

Description: Should Write Accelerator be Enabled for this OS Disk?

Type: `bool`

Default: `false`

### <a name="input_plan"></a> [plan](#input\_plan)

Description: An object variable that defines the Marketplace image this virtual machine should be created from. If you use the plan block with one of Microsoft's marketplace images (e.g. publisher = "MicrosoftWindowsServer"). This may prevent the purchase of the offer. An example Azure API error: The Offer: 'WindowsServer' cannot be purchased by subscription: '12345678-12234-5678-9012-123456789012' as it is not to be sold in market: 'US'. Please choose a subscription which is associated with a different market.

- `name`      = (Required) Specifies the Name of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created.
- `product`   = (Required) Specifies the Product of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created.
- `publisher` = (Required) Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created.

Example Input:

```hcl
plan = {
  name      = "17_04_02-payg-essentials"
  product   = "cisco-8000v"
  publisher = "cisco"
}
```

Type:

```hcl
object({
    name      = string
    product   = string
    publisher = string
  })
```

Default: `null`

### <a name="input_priority"></a> [priority](#input\_priority)

Description: (Optional) Specifies the priority of this Virtual Machine. Possible values are `Regular` and `Spot`. Defaults to `Regular`. Changing this forces a new resource to be created.

Type: `string`

Default: `"Regular"`

### <a name="input_proximity_placement_group"></a> [proximity\_placement\_group](#input\_proximity\_placement\_group)

Description: (Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. Conflicts with `capacity_reservation_group_resource_id`.

Type: `string`

Default: `null`

### <a name="input_public_ip_enabled"></a> [public\_ip\_enabled](#input\_public\_ip\_enabled)

Description: Create and attach a public interface?

Type: `bool`

Default: `false`

### <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku)

Description: SKU to be used with this public IP - Basic or Standard

Type: `string`

Default: `"Standard"`

### <a name="input_public_nsg"></a> [public\_nsg](#input\_public\_nsg)

Description: Public NSG for the PIP

Type: `string`

Default: `""`

### <a name="input_public_nsg_rg"></a> [public\_nsg\_rg](#input\_public\_nsg\_rg)

Description: Public NSG resource group for the PIP

Type: `string`

Default: `""`

### <a name="input_public_only"></a> [public\_only](#input\_public\_only)

Description: Create a public only interface?

Type: `bool`

Default: `false`

### <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet)

Description: Public subnet name for PIP

Type: `string`

Default: `""`

### <a name="input_public_vnet"></a> [public\_vnet](#input\_public\_vnet)

Description: Public vnet name for PIP

Type: `string`

Default: `""`

### <a name="input_public_vnet_rg"></a> [public\_vnet\_rg](#input\_public\_vnet\_rg)

Description: Public vnet resource group for PIP

Type: `string`

Default: `""`

### <a name="input_recovery_a_records"></a> [recovery\_a\_records](#input\_recovery\_a\_records)

Description: A map of objects where each object contains information to create a A record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_aaaa_records"></a> [recovery\_aaaa\_records](#input\_recovery\_aaaa\_records)

Description: A map of objects where each object contains information to create a AAAA record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_cname_records"></a> [recovery\_cname\_records](#input\_recovery\_cname\_records)

Description: A map of objects where each object contains information to create a CNAME record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    record              = string
    tags                = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_create_dns_zone"></a> [recovery\_create\_dns\_zone](#input\_recovery\_create\_dns\_zone)

Description: choose if DNS zone should be created or not

Type: `bool`

Default: `false`

### <a name="input_recovery_create_resource_group"></a> [recovery\_create\_resource\_group](#input\_recovery\_create\_resource\_group)

Description: Set this to true if a new RG is required.

Type: `bool`

Default: `false`

### <a name="input_recovery_diagnostics_settings_name"></a> [recovery\_diagnostics\_settings\_name](#input\_recovery\_diagnostics\_settings\_name)

Description: The diagnostics setting name of the resource on.

Type: `string`

Default: `null`

### <a name="input_recovery_dns_zone_id"></a> [recovery\_dns\_zone\_id](#input\_recovery\_dns\_zone\_id)

Description: The ID of the DNS zone if provided by the user

Type: `string`

Default: `""`

### <a name="input_recovery_domain_name"></a> [recovery\_domain\_name](#input\_recovery\_domain\_name)

Description: The name of the private dns zone.

Type: `string`

Default: `null`

### <a name="input_recovery_enable_diagnostic_setting"></a> [recovery\_enable\_diagnostic\_setting](#input\_recovery\_enable\_diagnostic\_setting)

Description: Choose if Diagnostic setting should be enabled

Type: `bool`

Default: `true`

### <a name="input_recovery_enable_encryption"></a> [recovery\_enable\_encryption](#input\_recovery\_enable\_encryption)

Description: Variable to define if encryption in recovery vault should be enabled or not

Type: `bool`

Default: `false`

### <a name="input_recovery_enable_private_endpoint"></a> [recovery\_enable\_private\_endpoint](#input\_recovery\_enable\_private\_endpoint)

Description: Variable to define if private endpoint should be enabled or not

Type: `bool`

Default: `false`

### <a name="input_recovery_enable_telemetry"></a> [recovery\_enable\_telemetry](#input\_recovery\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see https://aka.ms/avm/telemetryinfo.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_recovery_excluded_log_categories"></a> [recovery\_excluded\_log\_categories](#input\_recovery\_excluded\_log\_categories)

Description: List of log categories to exclude.

Type: `list(string)`

Default: `[]`

### <a name="input_recovery_key_vault_key_name"></a> [recovery\_key\_vault\_key\_name](#input\_recovery\_key\_vault\_key\_name)

Description: Provide Keyvault key name

Type: `string`

Default: `null`

### <a name="input_recovery_key_vault_name"></a> [recovery\_key\_vault\_name](#input\_recovery\_key\_vault\_name)

Description: Provide Keyvault name

Type: `string`

Default: `null`

### <a name="input_recovery_key_vault_rg_name"></a> [recovery\_key\_vault\_rg\_name](#input\_recovery\_key\_vault\_rg\_name)

Description: Provide Keyvault RG name

Type: `string`

Default: `null`

### <a name="input_recovery_kv_role_definition"></a> [recovery\_kv\_role\_definition](#input\_recovery\_kv\_role\_definition)

Description: n/a

Type: `string`

Default: `"Key Vault Crypto Service Encryption User"`

### <a name="input_recovery_location"></a> [recovery\_location](#input\_recovery\_location)

Description: The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'

Type: `string`

Default: `null`

### <a name="input_recovery_lock"></a> [recovery\_lock](#input\_recovery\_lock)

Description:   Controls the Resource Lock configuration for this resource. The following properties can be specified:

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

### <a name="input_recovery_log_analytics_destination_type"></a> [recovery\_log\_analytics\_destination\_type](#input\_recovery\_log\_analytics\_destination\_type)

Description: When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table.

Type: `string`

Default: `"AzureDiagnostics"`

### <a name="input_recovery_log_categories"></a> [recovery\_log\_categories](#input\_recovery\_log\_categories)

Description: List of log categories. Defaults to all available.

Type: `list(string)`

Default: `null`

### <a name="input_recovery_logs_destinations_ids"></a> [recovery\_logs\_destinations\_ids](#input\_recovery\_logs\_destinations\_ids)

Description: List of destination resources IDs for logs diagnostic destination.  
Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.  
If you want to use Azure EventHub as destination, you must provide a formatted string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character.

Type: `list(string)`

Default:

```json
[
  ""
]
```

### <a name="input_recovery_metric_categories"></a> [recovery\_metric\_categories](#input\_recovery\_metric\_categories)

Description: List of metric categories. Defaults to all available.

Type: `list(string)`

Default: `null`

### <a name="input_recovery_mx_records"></a> [recovery\_mx\_records](#input\_recovery\_mx\_records)

Description: A map of objects where each object contains information to create a MX record.

Type:

```hcl
map(object({
    name                = optional(string, "@")
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      preference = number
      exchange   = string
    }))
    tags = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_pe_subnet_name"></a> [recovery\_pe\_subnet\_name](#input\_recovery\_pe\_subnet\_name)

Description: The Subnet name attached to private endpoint

Type: `string`

Default: `null`

### <a name="input_recovery_private_endpoints"></a> [recovery\_private\_endpoints](#input\_recovery\_private\_endpoints)

Description: Private Endpoints for the supported resources

Type:

```hcl
map(object({
    name                           = string
    private_connection_resource_id = string
    is_manual_connection           = optional(bool)
    subresource_names              = list(string)
    request_message                = optional(string)
    private_dns_zone_group_name    = optional(string)
    private_dns_zone_ids           = optional(list(string))
  }))
```

Default: `{}`

### <a name="input_recovery_ptr_records"></a> [recovery\_ptr\_records](#input\_recovery\_ptr\_records)

Description: A map of objects where each object contains information to create a PTR record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_resource_group_name"></a> [recovery\_resource\_group\_name](#input\_recovery\_resource\_group\_name)

Description: A container that holds related resources for an Azure solution

Type: `string`

Default: `null`

### <a name="input_recovery_rg_role_assignments"></a> [recovery\_rg\_role\_assignments](#input\_recovery\_rg\_role\_assignments)

Description: The role assignment to be assigned to the resource group

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

### <a name="input_recovery_services_vault_name"></a> [recovery\_services\_vault\_name](#input\_recovery\_services\_vault\_name)

Description: Name of the Recovery Services Vault to be created

Type: `string`

Default: `null`

### <a name="input_recovery_soa_record"></a> [recovery\_soa\_record](#input\_recovery\_soa\_record)

Description: optional soa\_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com

Type:

```hcl
object({
    email        = string
    expire_time  = optional(number, 2419200)
    minimum_ttl  = optional(number, 10)
    refresh_time = optional(number, 3600)
    retry_time   = optional(number, 300)
    ttl          = optional(number, 3600)
    tags         = optional(map(string), null)
  })
```

Default: `null`

### <a name="input_recovery_srv_records"></a> [recovery\_srv\_records](#input\_recovery\_srv\_records)

Description: A map of objects where each object contains information to create a SRV record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      priority = number
      weight   = number
      port     = number
      target   = string
    }))
    tags = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_subscription_id"></a> [recovery\_subscription\_id](#input\_recovery\_subscription\_id)

Description: The Subscription ID

Type: `string`

Default: `null`

### <a name="input_recovery_tags"></a> [recovery\_tags](#input\_recovery\_tags)

Description: (Optional) Tags of the resource.

Type: `map(string)`

Default: `null`

### <a name="input_recovery_txt_records"></a> [recovery\_txt\_records](#input\_recovery\_txt\_records)

Description: A map of objects where each object contains information to create a TXT record.

Type:

```hcl
map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      value = string
    }))
    tags = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_vault_cross_region_restore_enabled"></a> [recovery\_vault\_cross\_region\_restore\_enabled](#input\_recovery\_vault\_cross\_region\_restore\_enabled)

Description: Is cross region restore enabled for this Vault? Only can be `true`, when `storage_mode_type` is `GeoRedundant`. Defaults to `false`.

Type: `bool`

Default: `false`

### <a name="input_recovery_vault_identity_type"></a> [recovery\_vault\_identity\_type](#input\_recovery\_vault\_identity\_type)

Description: Azure Recovery Vault identity type. Possible values include: `null`, `SystemAssigned`. Default to `SystemAssigned`.

Type: `string`

Default: `null`

### <a name="input_recovery_vault_immutability"></a> [recovery\_vault\_immutability](#input\_recovery\_vault\_immutability)

Description: Immutability Settings of vault, possible values include: Locked, Unlocked and Disabled.

Type: `string`

Default: `"Disabled"`

### <a name="input_recovery_vault_name"></a> [recovery\_vault\_name](#input\_recovery\_vault\_name)

Description: (Optional) - The name of the recovery services vault if exist

Type: `string`

Default: `""`

### <a name="input_recovery_vault_public_access_enabled"></a> [recovery\_vault\_public\_access\_enabled](#input\_recovery\_vault\_public\_access\_enabled)

Description: Choose if Recovery vault public access should be enabled

Type: `bool`

Default: `false`

### <a name="input_recovery_vault_sku"></a> [recovery\_vault\_sku](#input\_recovery\_vault\_sku)

Description: Azure Recovery Vault SKU. Possible values include: `Standard`, `RS0`. Default to `Standard`.

Type: `string`

Default: `"Standard"`

### <a name="input_recovery_vault_soft_delete_enabled"></a> [recovery\_vault\_soft\_delete\_enabled](#input\_recovery\_vault\_soft\_delete\_enabled)

Description: Is soft delete enable for this Vault? Defaults to `true`.

Type: `bool`

Default: `true`

### <a name="input_recovery_vault_storage_mode_type"></a> [recovery\_vault\_storage\_mode\_type](#input\_recovery\_vault\_storage\_mode\_type)

Description: The storage type of the Recovery Services Vault. Possible values are `GeoRedundant`, `LocallyRedundant` and `ZoneRedundant`. Defaults to `GeoRedundant`.

Type: `string`

Default: `"LocallyRedundant"`

### <a name="input_recovery_virtual_network_links"></a> [recovery\_virtual\_network\_links](#input\_recovery\_virtual\_network\_links)

Description: A map of objects where each object contains information to create a virtual network link.

Type:

```hcl
map(object({
    vnetlinkname     = string
    vnetid           = string
    autoregistration = optional(bool, false)
    tags             = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_recovery_virtual_network_name"></a> [recovery\_virtual\_network\_name](#input\_recovery\_virtual\_network\_name)

Description: The VNET name attached to private endpoint

Type: `string`

Default: `null`

### <a name="input_recovery_virtual_network_rg"></a> [recovery\_virtual\_network\_rg](#input\_recovery\_virtual\_network\_rg)

Description: The VNET RG name attached to private endpoint

Type: `string`

Default: `null`

### <a name="input_recovery_vm_backup_policies"></a> [recovery\_vm\_backup\_policies](#input\_recovery\_vm\_backup\_policies)

Description: A list of backup policies for VMs.

Type:

```hcl
map(object({
    name                           = string
    policy_type                    = string
    timezone                       = string
    instant_restore_retention_days = optional(number)
    frequency                      = string
    time                           = string
    hour_interval                  = optional(number)
    hour_duration                  = optional(number)
    weekdays                       = optional(set(string))
    daily = optional(list(object({
      count = number
    })), [])
    weekly = optional(list(object({
      count    = number
      weekdays = optional(set(string))
    })), [])
    monthly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
    yearly = optional(list(object({
      count             = number
      weekdays          = optional(set(string))
      weeks             = optional(set(string))
      months            = optional(set(string))
      days              = optional(set(number))
      include_last_days = optional(bool)
    })), [])
  }))
```

Default: `{}`

### <a name="input_resource_group_storage_name"></a> [resource\_group\_storage\_name](#input\_resource\_group\_storage\_name)

Description: The Storage Account's resurce name. Defaault to deployment resource group

Type: `string`

Default: `null`

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: the resource type being deployed see naming standards for example

Type: `string`

Default: `"vm"`

### <a name="input_secure_boot_enabled"></a> [secure\_boot\_enabled](#input\_secure\_boot\_enabled)

Description: (Optional) Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created.

Type: `bool`

Default: `null`

### <a name="input_source_image_offer"></a> [source\_image\_offer](#input\_source\_image\_offer)

Description: Operating System Name

Type: `string`

Default: `null`

### <a name="input_source_image_publisher"></a> [source\_image\_publisher](#input\_source\_image\_publisher)

Description: Operating System Publisher

Type: `string`

Default: `null`

### <a name="input_source_image_resource_id"></a> [source\_image\_resource\_id](#input\_source\_image\_resource\_id)

Description: The Azure resource ID of the source image used to create the VM. Either source\_image\_resource\_id or source\_image\_reference must be set and both can not be null at the same time

Type: `string`

Default: `null`

### <a name="input_source_image_sku"></a> [source\_image\_sku](#input\_source\_image\_sku)

Description: Operating System SKU

Type: `string`

Default: `null`

### <a name="input_source_image_version"></a> [source\_image\_version](#input\_source\_image\_version)

Description: Operating System Version

Type: `string`

Default: `"latest"`

### <a name="input_sr_sec_exception"></a> [sr\_sec\_exception](#input\_sr\_sec\_exception)

Description: Security Exception for the public IP

Type: `string`

Default: `""`

### <a name="input_storage_analytics_name"></a> [storage\_analytics\_name](#input\_storage\_analytics\_name)

Description: The Storage Account's Blob Name which should hold the virtual machine's diagnostic files. If null it will use managed ones

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to add to the vm

Type: `map(any)`

Default: `null`

### <a name="input_team_spn"></a> [team\_spn](#input\_team\_spn)

Description: The Service Principal Name of the team that will be able to modifyteam resources

Type: `list(string)`

Default: `[]`

### <a name="input_team_vm_admin_groups"></a> [team\_vm\_admin\_groups](#input\_team\_vm\_admin\_groups)

Description: The Admin Group of the team that will be able to modify team resources

Type: `list(string)`

Default: `[]`

### <a name="input_team_vm_contributor_groups"></a> [team\_vm\_contributor\_groups](#input\_team\_vm\_contributor\_groups)

Description: The Contributor Group of the team that will be able to modify team resources

Type: `list(string)`

Default: `[]`

### <a name="input_team_vm_reader_groups"></a> [team\_vm\_reader\_groups](#input\_team\_vm\_reader\_groups)

Description: The Reader Group of the team that will be able to modify team resources

Type: `list(string)`

Default: `[]`

### <a name="input_team_vm_userlogin_groups"></a> [team\_vm\_userlogin\_groups](#input\_team\_vm\_userlogin\_groups)

Description: The User Login Group of the team that will be able to modify team resources

Type: `list(string)`

Default: `[]`

### <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled)

Description: Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine.

Type: `bool`

Default: `false`

### <a name="input_user_assigned_identity_rg_name"></a> [user\_assigned\_identity\_rg\_name](#input\_user\_assigned\_identity\_rg\_name)

Description: Provide existing user assigned identity RG name

Type: `string`

Default: `null`

### <a name="input_vm_admin_pwd_keyvault_name"></a> [vm\_admin\_pwd\_keyvault\_name](#input\_vm\_admin\_pwd\_keyvault\_name)

Description: keyvault name for the vm admin password

Type: `string`

Default: `""`

### <a name="input_vm_admin_pwd_keyvault_secret_name"></a> [vm\_admin\_pwd\_keyvault\_secret\_name](#input\_vm\_admin\_pwd\_keyvault\_secret\_name)

Description: keyvault secret name for the vm admin password

Type: `string`

Default: `""`

### <a name="input_vtpm_enabled"></a> [vtpm\_enabled](#input\_vtpm\_enabled)

Description: Enable Trusted Launch for the virtual machine.

Type: `bool`

Default: `false`

## Outputs

The following outputs are exported:

### <a name="output_admin_passwords"></a> [admin\_passwords](#output\_admin\_passwords)

Description: Returns the admin password if installation is configured to use the password.  Otherwise returns null

### <a name="output_admin_ssh_keys"></a> [admin\_ssh\_keys](#output\_admin\_ssh\_keys)

Description: Returns a list containing all of the provided or generated ssh keys. This is a single key if the generation option is selected and no additional keys are provided.

### <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username)

Description: The admin username used when creating this virtual machine.

### <a name="output_backup_vault_id"></a> [backup\_vault\_id](#output\_backup\_vault\_id)

Description: The full object for the deployed backup vault.  This is marked sensitive as it contains specific sensitive values

### <a name="output_backup_vault_name"></a> [backup\_vault\_name](#output\_backup\_vault\_name)

Description: The Azure resource id for the deployed backup vault

### <a name="output_data_disks"></a> [data\_disks](#output\_data\_disks)

Description: The full ARM object map associated with any deployed data disk(s). Exporting this in the event that a disk property not exposed as part of the azurerm vm export is required.

### <a name="output_name"></a> [name](#output\_name)

Description: The name used for the virtual machines name.

### <a name="output_network_interfaces"></a> [network\_interfaces](#output\_network\_interfaces)

Description: The full ARM object map associated with the deployed network interface(s). Exporting this in the event that a nic property not exposed as part of the azurerm vm export is required.

### <a name="output_nsg_name"></a> [nsg\_name](#output\_nsg\_name)

Description: The name of the Network Security Group resource

### <a name="output_nsg_resource"></a> [nsg\_resource](#output\_nsg\_resource)

Description: The Network Security Group resource

### <a name="output_nsg_resource_id"></a> [nsg\_resource\_id](#output\_nsg\_resource\_id)

Description: The id of the Network Security Group resource

### <a name="output_public_ips"></a> [public\_ips](#output\_public\_ips)

Description: The full ARM object map associated with any deployed public ip(s). Exporting this in the event that a public ip property not exposed as part of the azurerm vm export is required.

### <a name="output_resource"></a> [resource](#output\_resource)

Description: The full object for the deployed virtual machine.  This is marked sensitive as it contains specific sensitive values

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: The Azure resource id for the deployed virtual machine

### <a name="output_system_assigned_mi_principal_id"></a> [system\_assigned\_mi\_principal\_id](#output\_system\_assigned\_mi\_principal\_id)

Description: The principal id of the system managed identity assigned to the virtual machine

### <a name="output_virtual_machine"></a> [virtual\_machine](#output\_virtual\_machine)

Description: The full object for the deployed virtual machine.  This is marked sensitive as it contains specific sensitive values. This output has been duplicated to the resource output to comply with the spec and may be deprecated in the future.

### <a name="output_virtual_machine_azurerm"></a> [virtual\_machine\_azurerm](#output\_virtual\_machine\_azurerm)

Description:     The default attributes exported by the azurerm provider.  These are defined as a map containing the following attributes  
    id                   = The Azure resource ID of the deployed virtual machine  
    identity             = { #An identity map with the following attributes        
        principal\_id     = The Principal ID associated with the virtual machine's system assigned managed identity  
        tenant\_id        = The Tenant ID associated with the virtual machine's system assigned managed identity
    }  
    private\_ip\_address   = The primary private IP address of the deployed virtual machine  
    private\_ip\_addresses = A list of Private IP Addresses assigned to this Virtual Machine.  
    public\_ip\_address    = The Primary Public IP Address assigned to this Virtual Machine.  
    public\_ip\_addresses  = A list of the Public IP Addresses assigned to this Virtual Machine.  
    virtual\_machine\_id   = A 128-bit identifier which uniquely identifies this Virtual Machine.
<!-- END_TF_DOCS -->