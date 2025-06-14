<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-avm-ptn-avd-lza-managementplane

This is a repo for Terraform Azure Verified Module for Azure Virtual Desktop

## Features
- Azure Virtual Desktop Host Pool
- Azure Virtual Desktop Application Group
- Azure Virtual Desktop Workspace
- Azure Virtual Desktop Scaling

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.6.6, < 2.0.0)
- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (>= 2.47.0, < 3.0.0)
- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.71.0, < 4.0.0)

## Resources

The following resources are used by this module:

- [azurerm_role_assignment.new](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [azurerm_virtual_desktop_host_pool_registration_info.registrationinfo](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_host_pool_registration_info) (resource)
- [azurerm_virtual_desktop_workspace_application_group_association.workappgrassoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_workspace_application_group_association) (resource)



<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description: (Required) The location/region where the Azure Virtual Desktop resources are located. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name)

Description: The name of the Log Analytics Workspace to use for diagnostics.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which the AVD Private Endpoint should be created.

Type: `string`

### <a name="input_virtual_desktop_application_group_name"></a> [virtual\_desktop\_application\_group\_name](#input\_virtual\_desktop\_application\_group\_name)

Description: (Required) The name of the Virtual Desktop Application Group. Changing the name forces a new resource to be created.

Type: `string`

### <a name="input_virtual_desktop_application_group_type"></a> [virtual\_desktop\_application\_group\_type](#input\_virtual\_desktop\_application\_group\_type)

Description: (Required) Type of Virtual Desktop Application Group. Valid options are `RemoteApp` or `Desktop` application groups. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_virtual_desktop_host_pool_load_balancer_type"></a> [virtual\_desktop\_host\_pool\_load\_balancer\_type](#input\_virtual\_desktop\_host\_pool\_load\_balancer\_type)

Description: (Required) `BreadthFirst` load balancing distributes new user sessions across all available session hosts in the host pool. Possible values are `BreadthFirst`, `DepthFirst` and `Persistent`. `DepthFirst` load balancing distributes new user sessions to an available session host with the highest number of connections but has not reached its maximum session limit threshold. `Persistent` should be used if the host pool type is `Personal`

Type: `string`

### <a name="input_virtual_desktop_host_pool_name"></a> [virtual\_desktop\_host\_pool\_name](#input\_virtual\_desktop\_host\_pool\_name)

Description: (Required) The name of the Virtual Desktop Host Pool. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_virtual_desktop_host_pool_type"></a> [virtual\_desktop\_host\_pool\_type](#input\_virtual\_desktop\_host\_pool\_type)

Description: (Required) The type of the Virtual Desktop Host Pool. Valid options are `Personal` or `Pooled`. Changing the type forces a new resource to be created.

Type: `string`

### <a name="input_virtual_desktop_scaling_plan_name"></a> [virtual\_desktop\_scaling\_plan\_name](#input\_virtual\_desktop\_scaling\_plan\_name)

Description: (Required) The name which should be used for this Virtual Desktop Scaling Plan . Changing this forces a new Virtual Desktop Scaling Plan to be created.

Type: `string`

### <a name="input_virtual_desktop_scaling_plan_time_zone"></a> [virtual\_desktop\_scaling\_plan\_time\_zone](#input\_virtual\_desktop\_scaling\_plan\_time\_zone)

Description: (Required) Specifies the Time Zone which should be used by the Scaling Plan for time based events, [the possible values are defined here](https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/).

Type: `string`

### <a name="input_virtual_desktop_workspace_name"></a> [virtual\_desktop\_workspace\_name](#input\_virtual\_desktop\_workspace\_name)

Description: (Required) The name of the Virtual Desktop Workspace. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.

For more information see <https://aka.ms/avm/telemetryinfo>.

If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities)

Description: Controls the Managed Identity configuration on this resource. The following properties can be specified:

- `system_assigned` - (Optional) Specifies if the System Assigned Managed Identity should be enabled.
- `user_assigned_resource_ids` - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.

Type:

```hcl
object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
```

Default: `{}`

### <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints)

Description: A map of private endpoints to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
- `name` - (Optional) The name of the private endpoint. One will be generated if not set.
- `role_assignments` - (Optional) A map of role assignments to create on the private endpoint. Each role assignment should include a `role_definition_id_or_name` and a `principal_id`.
- `lock` - (Optional) The lock level to apply to the private endpoint. Default is `None`. Possible values are `None`, `CanNotDelete`, and `ReadOnly`.
- `tags` - (Optional) A mapping of tags to assign to the private endpoint. Each tag should be a string.
- `subnet_resource_id` - The resource ID of the subnet to deploy the private endpoint in.
- `private_dns_zone_group_name` - (Optional) The name of the private DNS zone group. One will be generated if not set.
- `private_dns_zone_resource_ids` - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.
- `application_security_group_resource_ids` - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
- `private_service_connection_name` - (Optional) The name of the private service connection. One will be generated if not set.
- `network_interface_name` - (Optional) The name of the network interface. One will be generated if not set.
- `location` - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.
- `resource_group_name` - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the resource.
- `ip_configurations` - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. Each IP configuration should include a `name` and a `private_ip_address`.

Type:

```hcl
map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    lock = optional(object({
      name = optional(string, null)
      kind = string
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
```

Default: `{}`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: Whether or not public network access is enabled for the AVD Workspace.

Type: `bool`

Default: `true`

### <a name="input_registration_expiration_period"></a> [registration\_expiration\_period](#input\_registration\_expiration\_period)

Description: The expiration period for the registration token. Must be less than or equal to 30 days.

Type: `string`

Default: `"48h"`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description:   A map of role assignments to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

  - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
  - `principal_id` - The ID of the principal to assign the role to.
  - `description` - The description of the role assignment.
  - `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
  - `condition` - The condition which will be used to scope the role assignment.
  - `condition_version` - The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are '2.0'.

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

### <a name="input_schedules"></a> [schedules](#input\_schedules)

Description: A map of schedules to create on AVD Scaling Plan. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` -  The name of the schedule.
- `days_of_week` -  The days of the week to apply the schedule to.
- `off_peak_start_time` -  The start time of the off peak period.
- `off_peak_load_balancing_algorithm` -  The load balancing algorithm to use during the off peak period.
- `ramp_down_capacity_threshold_percent` -  The capacity threshold percentage to use during the ramp down period.
- `ramp_down_force_logoff_users` -  Whether to force log off users during the ramp down period.
- `ramp_down_load_balancing_algorithm` -  The load balancing algorithm to use during the ramp down period.
- `ramp_down_minimum_hosts_percent` -  The minimum hosts percentage to use during the ramp down period.
- `ramp_down_notification_message` -  The notification message to use during the ramp down period.
- `ramp_down_start_time` -  The start time of the ramp down period.
- `ramp_down_stop_hosts_when` -  When to stop hosts during the ramp down period.
- `ramp_down_wait_time_minutes` -  The wait time in minutes to use during the ramp down period.
- `peak_start_time` -  The start time of the peak period.
- `peak_load_balancing_algorithm` -  The load balancing algorithm to use during the peak period.
- `ramp_up_capacity_threshold_percent` - (Optional) The capacity threshold percentage to use during the ramp up period.
- `ramp_up_load_balancing_algorithm` -  The load balancing algorithm to use during the ramp up period.
- `ramp_up_minimum_hosts_percent` - (Optional) The minimum hosts percentage to use during the ramp up period.
- `ramp_up_start_time` -  The start time of the ramp up period.

Type:

```hcl
map(object({
    name                                 = string
    days_of_week                         = set(string)
    off_peak_start_time                  = string
    off_peak_load_balancing_algorithm    = string
    ramp_down_capacity_threshold_percent = number
    ramp_down_force_logoff_users         = bool
    ramp_down_load_balancing_algorithm   = string
    ramp_down_minimum_hosts_percent      = number
    ramp_down_notification_message       = string
    ramp_down_start_time                 = string
    ramp_down_stop_hosts_when            = string
    ramp_down_wait_time_minutes          = number
    peak_start_time                      = string
    peak_load_balancing_algorithm        = string
    ramp_up_capacity_threshold_percent   = optional(number)
    ramp_up_load_balancing_algorithm     = string
    ramp_up_minimum_hosts_percent        = optional(number)
    ramp_up_start_time                   = string
  }))
```

Default:

```json
{
  "schedule1": {
    "days_of_week": [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday"
    ],
    "name": "Weekdays",
    "off_peak_load_balancing_algorithm": "DepthFirst",
    "off_peak_start_time": "22:00",
    "peak_load_balancing_algorithm": "BreadthFirst",
    "peak_start_time": "09:00",
    "ramp_down_capacity_threshold_percent": 5,
    "ramp_down_force_logoff_users": false,
    "ramp_down_load_balancing_algorithm": "DepthFirst",
    "ramp_down_minimum_hosts_percent": 10,
    "ramp_down_notification_message": "Please log off in the next 45 minutes...",
    "ramp_down_start_time": "19:00",
    "ramp_down_stop_hosts_when": "ZeroSessions",
    "ramp_down_wait_time_minutes": 45,
    "ramp_up_capacity_threshold_percent": 10,
    "ramp_up_load_balancing_algorithm": "BreadthFirst",
    "ramp_up_minimum_hosts_percent": 20,
    "ramp_up_start_time": "05:00"
  }
}
```

### <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names)

Description: The names of the subresources to assosciatied with the private endpoint. The target subresource must be one of: 'feed', or 'global'.

Type: `list(string)`

Default: `[]`

### <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone)

Description: The time zone of the AVD Scaling Plan.

Type: `string`

Default: `"Eastern Standard Time"`

### <a name="input_tracing_tags_enabled"></a> [tracing\_tags\_enabled](#input\_tracing\_tags\_enabled)

Description: Whether enable tracing tags that generated by BridgeCrew Yor.

Type: `bool`

Default: `false`

### <a name="input_tracing_tags_prefix"></a> [tracing\_tags\_prefix](#input\_tracing\_tags\_prefix)

Description: Default prefix for generated tracing tags

Type: `string`

Default: `"avm_"`

### <a name="input_virtual_desktop_application_group_default_desktop_display_name"></a> [virtual\_desktop\_application\_group\_default\_desktop\_display\_name](#input\_virtual\_desktop\_application\_group\_default\_desktop\_display\_name)

Description: (Optional) Option to set the display name for the default sessionDesktop desktop when `type` is set to `Desktop`.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_application_group_description"></a> [virtual\_desktop\_application\_group\_description](#input\_virtual\_desktop\_application\_group\_description)

Description: (Optional) Option to set a description for the Virtual Desktop Application Group.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_application_group_friendly_name"></a> [virtual\_desktop\_application\_group\_friendly\_name](#input\_virtual\_desktop\_application\_group\_friendly\_name)

Description: (Optional) Option to set a friendly name for the Virtual Desktop Application Group.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_application_group_tags"></a> [virtual\_desktop\_application\_group\_tags](#input\_virtual\_desktop\_application\_group\_tags)

Description: (Optional) A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_virtual_desktop_application_group_timeouts"></a> [virtual\_desktop\_application\_group\_timeouts](#input\_virtual\_desktop\_application\_group\_timeouts)

Description: - `create` - (Defaults to 60 minutes) Used when creating the Virtual Desktop Application Group.
- `delete` - (Defaults to 60 minutes) Used when deleting the Virtual Desktop Application Group.
- `read` - (Defaults to 5 minutes) Used when retrieving the Virtual Desktop Application Group.
- `update` - (Defaults to 60 minutes) Used when updating the Virtual Desktop Application Group.

Type:

```hcl
object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
```

Default: `null`

### <a name="input_virtual_desktop_host_pool_custom_rdp_properties"></a> [virtual\_desktop\_host\_pool\_custom\_rdp\_properties](#input\_virtual\_desktop\_host\_pool\_custom\_rdp\_properties)

Description: (Optional) A valid custom RDP properties string for the Virtual Desktop Host Pool, available properties can be [found in this article](https://docs.microsoft.com/windows-server/remote/remote-desktop-services/clients/rdp-files).

Type: `string`

Default: `"drivestoredirect:s:*;audiomode:i:0;videoplaybackmode:i:1;redirectclipboard:i:1;redirectprinters:i:1;devicestoredirect:s:*;redirectcomports:i:1;redirectsmartcards:i:1;usbdevicestoredirect:s:*;enablecredsspsupport:i:1;use multimon:i:0"`

### <a name="input_virtual_desktop_host_pool_description"></a> [virtual\_desktop\_host\_pool\_description](#input\_virtual\_desktop\_host\_pool\_description)

Description: (Optional) A description for the Virtual Desktop Host Pool.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_host_pool_friendly_name"></a> [virtual\_desktop\_host\_pool\_friendly\_name](#input\_virtual\_desktop\_host\_pool\_friendly\_name)

Description: (Optional) A friendly name for the Virtual Desktop Host Pool.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_host_pool_maximum_sessions_allowed"></a> [virtual\_desktop\_host\_pool\_maximum\_sessions\_allowed](#input\_virtual\_desktop\_host\_pool\_maximum\_sessions\_allowed)

Description: (Optional) A valid integer value from 0 to 999999 for the maximum number of users that have concurrent sessions on a session host. Should only be set if the `type` of your Virtual Desktop Host Pool is `Pooled`.

Type: `number`

Default: `null`

### <a name="input_virtual_desktop_host_pool_personal_desktop_assignment_type"></a> [virtual\_desktop\_host\_pool\_personal\_desktop\_assignment\_type](#input\_virtual\_desktop\_host\_pool\_personal\_desktop\_assignment\_type)

Description: (Optional) `Automatic` assignment

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_host_pool_preferred_app_group_type"></a> [virtual\_desktop\_host\_pool\_preferred\_app\_group\_type](#input\_virtual\_desktop\_host\_pool\_preferred\_app\_group\_type)

Description: Preferred App Group type to display

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_host_pool_scheduled_agent_updates"></a> [virtual\_desktop\_host\_pool\_scheduled\_agent\_updates](#input\_virtual\_desktop\_host\_pool\_scheduled\_agent\_updates)

Description: - `enabled` - (Optional) Enables or disables scheduled updates of the AVD agent components (RDAgent, Geneva Monitoring agent, and side-by-side stack) on session hosts. If this is enabled then up to two `schedule` blocks must be defined. Default is `false`.
- `timezone` - (Optional) Specifies the time zone in which the agent update schedule will apply. If `use_session_host_timezone` is enabled then it will override this setting. Default is `UTC`
- `use_session_host_timezone` - (Optional) Specifies whether scheduled agent updates should be applied based on the timezone of the affected session host. If configured then this setting overrides `timezone`. Default is `false`.

---
`schedule` block supports the following:
- `day_of_week` - (Required) The day of the week on which agent updates should be performed. Possible values are `Monday`, `Tuesday`, `Wednesday`, `Thursday`, `Friday`, `Saturday`, and `Sunday`
- `hour_of_day` - (Required) The hour of day the update window should start. The update is a 2 hour period following the hour provided. The value should be provided as a number between 0 and 23, with 0 being midnight and 23 being 11pm. A leading zero should not be used.

Type:

```hcl
object({
    enabled                   = optional(bool)
    timezone                  = optional(string)
    use_session_host_timezone = optional(bool)
    schedule = optional(list(object({
      day_of_week = string
      hour_of_day = number
    })))
  })
```

Default: `null`

### <a name="input_virtual_desktop_host_pool_start_vm_on_connect"></a> [virtual\_desktop\_host\_pool\_start\_vm\_on\_connect](#input\_virtual\_desktop\_host\_pool\_start\_vm\_on\_connect)

Description: (Optional) Enables or disables the Start VM on Connection Feature. Defaults to `false`.

Type: `bool`

Default: `null`

### <a name="input_virtual_desktop_host_pool_tags"></a> [virtual\_desktop\_host\_pool\_tags](#input\_virtual\_desktop\_host\_pool\_tags)

Description: (Optional) A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_virtual_desktop_host_pool_timeouts"></a> [virtual\_desktop\_host\_pool\_timeouts](#input\_virtual\_desktop\_host\_pool\_timeouts)

Description: - `create` - (Defaults to 60 minutes) Used when creating the Virtual Desktop Host Pool.
- `delete` - (Defaults to 60 minutes) Used when deleting the Virtual Desktop Host Pool.
- `read` - (Defaults to 5 minutes) Used when retrieving the Virtual Desktop Host Pool.
- `update` - (Defaults to 60 minutes) Used when updating the Virtual Desktop Host Pool.

Type:

```hcl
object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
```

Default: `null`

### <a name="input_virtual_desktop_host_pool_validate_environment"></a> [virtual\_desktop\_host\_pool\_validate\_environment](#input\_virtual\_desktop\_host\_pool\_validate\_environment)

Description: (Optional) Allows you to test service changes before they are deployed to production. Defaults to `false`.

Type: `bool`

Default: `null`

### <a name="input_virtual_desktop_scaling_plan_description"></a> [virtual\_desktop\_scaling\_plan\_description](#input\_virtual\_desktop\_scaling\_plan\_description)

Description: (Optional) A description of the Scaling Plan.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_scaling_plan_exclusion_tag"></a> [virtual\_desktop\_scaling\_plan\_exclusion\_tag](#input\_virtual\_desktop\_scaling\_plan\_exclusion\_tag)

Description: (Optional) The name of the tag associated with the VMs you want to exclude from autoscaling.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_scaling_plan_friendly_name"></a> [virtual\_desktop\_scaling\_plan\_friendly\_name](#input\_virtual\_desktop\_scaling\_plan\_friendly\_name)

Description: (Optional) Friendly name of the Scaling Plan.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_scaling_plan_host_pool"></a> [virtual\_desktop\_scaling\_plan\_host\_pool](#input\_virtual\_desktop\_scaling\_plan\_host\_pool)

Description: - `hostpool_id` - (Required) The ID of the HostPool to assign the Scaling Plan to.
- `scaling_plan_enabled` - (Required) Specifies if the scaling plan is enabled or disabled for the HostPool.

Type:

```hcl
list(object({
    hostpool_id          = string
    scaling_plan_enabled = bool
  }))
```

Default: `null`

### <a name="input_virtual_desktop_scaling_plan_tags"></a> [virtual\_desktop\_scaling\_plan\_tags](#input\_virtual\_desktop\_scaling\_plan\_tags)

Description: (Optional) A mapping of tags which should be assigned to the Virtual Desktop Scaling Plan .

Type: `map(string)`

Default: `null`

### <a name="input_virtual_desktop_scaling_plan_timeouts"></a> [virtual\_desktop\_scaling\_plan\_timeouts](#input\_virtual\_desktop\_scaling\_plan\_timeouts)

Description: - `create` - (Defaults to 1 hour) Used when creating the Virtual Desktop Scaling Plan.
- `delete` - (Defaults to 1 hour) Used when deleting the Virtual Desktop Scaling Plan.
- `read` - (Defaults to 5 minutes) Used when retrieving the Virtual Desktop Scaling Plan.
- `update` - (Defaults to 1 hour) Used when updating the Virtual Desktop Scaling Plan.

Type:

```hcl
object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
```

Default: `null`

### <a name="input_virtual_desktop_workspace_description"></a> [virtual\_desktop\_workspace\_description](#input\_virtual\_desktop\_workspace\_description)

Description: (Optional) A description for the Virtual Desktop Workspace.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_workspace_friendly_name"></a> [virtual\_desktop\_workspace\_friendly\_name](#input\_virtual\_desktop\_workspace\_friendly\_name)

Description: (Optional) A friendly name for the Virtual Desktop Workspace.

Type: `string`

Default: `null`

### <a name="input_virtual_desktop_workspace_public_network_access_enabled"></a> [virtual\_desktop\_workspace\_public\_network\_access\_enabled](#input\_virtual\_desktop\_workspace\_public\_network\_access\_enabled)

Description: (Optional) Whether public network access is allowed for this Virtual Desktop Workspace. Defaults to `true`.

Type: `bool`

Default: `null`

### <a name="input_virtual_desktop_workspace_tags"></a> [virtual\_desktop\_workspace\_tags](#input\_virtual\_desktop\_workspace\_tags)

Description: (Optional) A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_virtual_desktop_workspace_timeouts"></a> [virtual\_desktop\_workspace\_timeouts](#input\_virtual\_desktop\_workspace\_timeouts)

Description: - `create` - (Defaults to 60 minutes) Used when creating the Virtual Desktop Workspace.
- `delete` - (Defaults to 60 minutes) Used when deleting the Virtual Desktop Workspace.
- `read` - (Defaults to 5 minutes) Used when retrieving the Virtual Desktop Workspace.
- `update` - (Defaults to 60 minutes) Used when updating the Virtual Desktop Workspace.

Type:

```hcl
object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
```

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_application_group_id"></a> [application\_group\_id](#output\_application\_group\_id)

Description: The ID of the application group.

### <a name="output_hostpool_id"></a> [hostpool\_id](#output\_hostpool\_id)

Description: The ID of the host pool.

### <a name="output_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#output\_log\_analytics\_workspace\_id)

Description: The ID of the Log Analytics workspace.

### <a name="output_private_endpoints"></a> [private\_endpoints](#output\_private\_endpoints)

Description: A map of private endpoints. The map key is the supplied input to var.private\_endpoints. The map value is the entire azurerm\_private\_endpoint resource.

### <a name="output_registrationinfo_token"></a> [registrationinfo\_token](#output\_registrationinfo\_token)

Description: The token for the host pool registration.

### <a name="output_resource"></a> [resource](#output\_resource)

Description: This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id

### <a name="output_scaling_plan_id"></a> [scaling\_plan\_id](#output\_scaling\_plan\_id)

Description: The ID of the scaling plan.

### <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id)

Description: The ID of the workspace.

## Modules

The following Modules are called:

### <a name="module_avm_res_desktopvirtualization_applicationgroup"></a> [avm\_res\_desktopvirtualization\_applicationgroup](#module\_avm\_res\_desktopvirtualization\_applicationgroup)

Source: Azure/avm-res-desktopvirtualization-applicationgroup/azurerm

Version: 0.1.4

### <a name="module_avm_res_desktopvirtualization_hostpool"></a> [avm\_res\_desktopvirtualization\_hostpool](#module\_avm\_res\_desktopvirtualization\_hostpool)

Source: Azure/avm-res-desktopvirtualization-hostpool/azurerm

Version: 0.2.0

### <a name="module_avm_res_desktopvirtualization_scaling_plan"></a> [avm\_res\_desktopvirtualization\_scaling\_plan](#module\_avm\_res\_desktopvirtualization\_scaling\_plan)

Source: Azure/avm-res-desktopvirtualization-scalingplan/azurerm

Version: 0.1.3

### <a name="module_avm_res_desktopvirtualization_workspace"></a> [avm\_res\_desktopvirtualization\_workspace](#module\_avm\_res\_desktopvirtualization\_workspace)

Source: Azure/avm-res-desktopvirtualization-workspace/azurerm

Version: 0.1.5

### <a name="module_avm_res_operationalinsights_workspace"></a> [avm\_res\_operationalinsights\_workspace](#module\_avm\_res\_operationalinsights\_workspace)

Source: Azure/avm-res-operationalinsights-workspace/azurerm

Version: 0.3.2

<!-- END_TF_DOCS -->