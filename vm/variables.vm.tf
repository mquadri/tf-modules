
variable "additional_unattend_contents" {
  type = list(object({
    content = string
    setting = string
  }))
  default     = []
  description = <<ADDITIONAL_UNATTEND_CONTENTS
List of objects representing unattend content settings

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
ADDITIONAL_UNATTEND_CONTENTS  
  nullable    = false
}


variable "bypass_platform_safety_checks_on_user_schedule_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether to skip platform scheduled patching when a user schedule is associated with the VM. This value can only be set to true when patch_mode is set to AutomaticByPlatform"
}

variable "capacity_reservation_group_resource_id" {
  type        = string
  default     = null
  description = "(Optional) Specifies the Azure Resource ID of the Capacity Reservation Group with the Virtual Machine should be allocated to. Cannot be used with availability_set_id or proximity_placement_group_id"
}

variable "proximity_placement_group" {
  type        = string
  default     = null
  description = "(Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. Conflicts with `capacity_reservation_group_resource_id`."
}

variable "dedicated_host_group_resource_id" {
  type        = string
  default     = null
  description = "(Optional) The Azure Resource ID of the dedicated host group where this virtual machine should run. Conflicts with dedicated_host_resource_id (dedicated_host_group_id on the azurerm provider)"
}

variable "dedicated_host_resource_id" {
  type        = string
  default     = null
  description = "(Optional) The Azure Resource ID of the dedicated host where this virtual machine should run. Conflicts with dedicated_host_group_resource_id (dedicated_host_group_id on the azurerm provider)"
}


variable "diagnostic_settings" {
  type = map(object({
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
  default     = {}
  description = <<DIAGNOSTIC_SETTINGS
This map object is used to define the diagnostic settings on the virtual machine.  This functionality does not implement the diagnostic settings extension, but instead can be used to configure sending the vm metrics to one of the standard targets.

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
  diagnostic_settings = {
    vm_diags = {
      name                  = module.naming.monitor_diagnostic_setting.name_unique
      workspace_resource_id = azurerm_log_analytics_workspace.this_workspace.id
      metric_categories     = ["AllMetrics"]
    }
  }
DIAGNOSTIC_SETTINGS
  nullable    = false
}

variable "disk_controller_type" {
  type        = string
  default     = null
  description = "(Optional) - Specifies the Disk Controller Type used for this Virtual Machine.  Possible values are `SCSI` and `NVME`."
}

variable "edge_zone" {
  type        = string
  default     = null
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Virtual Machine should exist. Changing this forces a new Virtual Machine to be created."
}

variable "encryption_at_host_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
}

variable "eviction_policy" {
  type        = string
  default     = null
  description = "(Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are Deallocate and Delete. Changing this forces a new resource to be created. This value can only be set when priority is set to Spot"
}

variable "extensions" {
  type = map(object({
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
  # tflint-ignore: terraform_sensitive_variable_no_default
  default     = {}
  description = <<EXTENSIONS
This map of objects is used to create additional `azurerm_virtual_machine_extension` resources, the argument descriptions could be found at [the document](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension).

- `<map key>` - Provide a custom key value to define each extension object
  - `name` (Required) - Set a custom name on this value if you want the guest configuration extension to have a custom name
  - `publisher` (Required) - Configure the publisher for the extension to be deployed. The Publisher and Type of Virtual Machine Extensions can be found using the Azure CLI, via: az vm extension image list --location westus -o table
  - `type` (Required) - Configure the type value for the extension to be deployed. 
  - `type_handler_version` (Required) - The type handler version for the extension. A common value is 1.0.
  - `auto_upgrade_minor_version` (Optional) - Set this to false to avoid automatic upgrades for minor versions on the extension.  Defaults to true
  - `automatic_upgrade_enabled` (Optional) - Set this to false to avoid automatic upgrades for major versions on the extension.  Defaults to true
  - `failure_suppression_enabled` (Optional) - Should failures from the extension be suppressed? Possible values are true or false. Defaults to false. Operational failures such as not connecting to the VM will not be suppressed regardless of the failure_suppression_enabled value.
  - `settings` (Optional) - The settings passed to the extension, these are specified as a JSON object in a string. Certain VM Extensions require that the keys in the settings block are case sensitive. If you're seeing unhelpful errors, please ensure the keys are consistent with how Azure is expecting them (for instance, for the JsonADDomainExtension extension, the keys are expected to be in TitleCase.)
  - `protected_settings` (Optional) - The protected_settings passed to the extension, like settings, these are specified as a JSON object in a string. Certain VM Extensions require that the keys in the protected_settings block are case sensitive. If you're seeing unhelpful errors, please ensure the keys are consistent with how Azure is expecting them (for instance, for the JsonADDomainExtension extension, the keys are expected to be in TitleCase.)
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
EXTENSIONS
  nullable    = false
  sensitive   = true # Because `protected_settings` is sensitive

  validation {
    condition = length(var.extensions) == length(distinct([
      for e in var.extensions : e.type
    ]))
    error_message = "`type` in `vm_extensions` must be unique."
  }
}


variable "generate_admin_password_or_ssh_key" {
  type        = bool
  default     = true
  description = "Set this value to true if the deployment should create a strong password for the admin user."
}

variable "lock" {
  type = object({
    name = optional(string, null)
    kind = string
  })
  default     = null
  description = <<LOCK
"The lock configuration to apply to this virtual machine and all of it's child resources. The following properties are specified.

- `kind` - (Required) - The type of the lock.  Possible values are `CanNotDelete` and `ReadOnly`.
- `name` - (Optional) - The name of the lock.  If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.

Example Inputs:
```hcl
lock = {
  name = "lock-{resourcename}" # optional
  type = "CanNotDelete" 
}
```
LOCK

  validation {
    condition     = var.lock != null ? contains(["CanNotDelete", "ReadOnly"], var.lock.kind) : true
    error_message = "Lock kind must be either `\"CanNotDelete\"` or `\"ReadOnly\"`."
  }
}

variable "max_bid_price" {
  type        = number
  default     = -1
  description = "(Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the `eviction_policy`. Defaults to `-1`, which means that the Virtual Machine should not be evicted for price reasons. This can only be configured when `priority` is set to `Spot`."
}

variable "plan" {
  type = object({
    name      = string
    product   = string
    publisher = string
  })
  default     = null
  description = <<PLAN
An object variable that defines the Marketplace image this virtual machine should be created from. If you use the plan block with one of Microsoft's marketplace images (e.g. publisher = "MicrosoftWindowsServer"). This may prevent the purchase of the offer. An example Azure API error: The Offer: 'WindowsServer' cannot be purchased by subscription: '12345678-12234-5678-9012-123456789012' as it is not to be sold in market: 'US'. Please choose a subscription which is associated with a different market.

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
PLAN
}

variable "priority" {
  type        = string
  default     = "Regular"
  description = "(Optional) Specifies the priority of this Virtual Machine. Possible values are `Regular` and `Spot`. Defaults to `Regular`. Changing this forces a new resource to be created."
}

variable "vtpm_enabled" {
  description = "Enable Trusted Launch for the virtual machine."
  type        = bool
  default     = false
}

variable "secure_boot_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created."
}

variable "azure_backup_configurations" {
  type = map(object({
    resource_group_name        = optional(string, null)
    recovery_vault_name        = optional(string, null)
    recovery_vault_resource_id = string
    backup_policy_resource_id  = optional(string, null)
    exclude_disk_luns          = optional(list(number), null)
    include_disk_luns          = optional(list(number), null)
  }))
  default     = {}
  description = <<DESCRIPTION
This object describes the backup configuration to use for this VM instance. Provide the backup details for configuring the backup. It defaults to null.

- `<map_key>` - An arbitrary map key to avoid terraform issues with know before apply challenges
  - `resource_group_name` - (Optional) - The resource group name for the resource group containing the recovery services vault. If not supplied it will default to the deployment resource group.
  - `recovery_vault_name` - (Required) - The name of the recovery services vault where the backup will be stored.
  - `backup_policy_resource_id`    - (Optional) - Required during creation, but can be optional when the protection state is not `ProtectionStopped`.
  - `exclude_disk_luns`   - (Optional) - A list of Disk Logical Unit Numbers (LUN) to be excluded from VM Protection.
  - `include_disk_luns`   - (Optional) - A list of Disk Logical Unit Numbers (LUN) to be included for VM Protection.
  - `protection_state`    - (Optional) - Specifies the protection state of the backup. Possible values are `Invalid`, `Protected`, `ProtectionStopped`, `ProtectionError`, and `ProtectionPaused`.

Example Input:
azure_backup_configurations = {
  arbitrary_key = {
    resource_group_name = azurerm_recovery_services_vault.test_vault.resource_group_name
    recovery_vault_name = azurerm_recovery_services_vault.test_vault.name
    backup_policy_resource_id    = azurerm_backup_policy_vm.test_policy.id
    exclude_disk_luns   = [1]
  }
}
DESCRIPTION
}

variable "license_type" {
  type        = string
  default     = null
  description = "(Optional) For Linux virtual machine specifies the BYOL Type for this Virtual Machine, possible values are `RHEL_BYOS` and `SLES_BYOS`. For Windows virtual machine specifies the type of on-premise license (also known as [Azure Hybrid Use Benefit](https://docs.microsoft.com/windows-server/get-started/azure-hybrid-benefit)) which should be used for this Virtual Machine, possible values are `None`, `Windows_Client` and `Windows_Server`."
}

variable "availability_set_resource_id" {
  type        = string
  default     = null
  description = "(Optional) Specifies the Azure Resource ID of the Availability Set in which the Virtual Machine should exist. Cannot be used along with `new_availability_set`, `new_capacity_reservation_group`, `capacity_reservation_group_id`, `virtual_machine_scale_set_id`, `zone`. Changing this forces a new resource to be created."
}

variable "source_image_resource_id" {
  description = "The Azure resource ID of the source image used to create the VM. Either source_image_resource_id or source_image_reference must be set and both can not be null at the same time"
  type        = string
  default     = null
}