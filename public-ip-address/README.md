<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-avm-res-network-publicipaddress

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.71.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (>= 3.5.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.71.0)

- <a name="provider_random"></a> [random](#provider\_random) (>= 3.5.0)

## Resources

The following resources are used by this module:

- [azurerm_management_lock.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) (resource)
- [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) (resource)
- [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) (resource)
- [azurerm_resource_group_template_deployment.telemetry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) (resource)
- [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [random_id.telem](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) (resource)

<!-- markdownlint-disable MD013 -->

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-network-publicipaddress"></a> [avm-res-network-publicipaddress](#module\_avm-res-network-publicipaddress) | ../../modules/avm-res-network-publicipaddress | n/a |

## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure location where the resources will be deployed.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: Name of public IP address resource

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The resource group where the resources will be deployed.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method)

Description: The allocation method to use.

Type: `string`

Default: `"Static"`

### <a name="input_ddos_protection_mode"></a> [ddos\_protection\_mode](#input\_ddos\_protection\_mode)

Description: The DDoS protection mode to use.

Type: `string`

Default: `"VirtualNetworkInherited"`

### <a name="input_ddos_protection_plan_id"></a> [ddos\_protection\_plan\_id](#input\_ddos\_protection\_plan\_id)

Description: The ID of the DDoS protection plan to associate with the public IP address. This is required if `ddos_protection_mode` is set to `Standard`.

Type: `string`

Default: `null`

### <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings)

Description: A map of diagnostic settings to create on the ddos protection plan. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

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

### <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label)

Description: The domain name label for the public IP address.

Type: `string`

Default: `null`

### <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone)

Description: The edge zone to use for the public IP address. This is required if `sku_tier` is set to `Global`.

Type: `string`

Default: `null`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see https://aka.ms/avm/telemetryinfo.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_idle_timeout_in_minutes"></a> [idle\_timeout\_in\_minutes](#input\_idle\_timeout\_in\_minutes)

Description: The idle timeout in minutes.

Type: `number`

Default: `4`

### <a name="input_ip_tags"></a> [ip\_tags](#input\_ip\_tags)

Description: The IP tags for the public IP address

Type: `map(string)`

Default: `{}`

### <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version)

Description: The IP version to use.

Type: `string`

Default: `"IPv4"`

### <a name="input_lock"></a> [lock](#input\_lock)

Description: The lock level to apply to the deployed resource. Default is `None`. Possible values are `None`, `CanNotDelete`, and `ReadOnly`.

Type:

```hcl
object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
```

Default: `{}`

### <a name="input_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#input\_public\_ip\_prefix\_id)

Description: The ID of the public IP prefix to associate with the public IP address.

Type: `string`

Default: `null`

### <a name="input_reverse_fqdn"></a> [reverse\_fqdn](#input\_reverse\_fqdn)

Description: The reverse FQDN for the public IP address. This must be a valid FQDN. If you specify a reverse FQDN, you cannot specify a DNS name label. Not all regions support this.

Type: `string`

Default: `null`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description: n/a

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
  }))
```

Default: `{}`

### <a name="input_sku"></a> [sku](#input\_sku)

Description: The SKU of the public IP address.

Type: `string`

Default: `"Standard"`

### <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier)

Description: The tier of the SKU of the public IP address.

Type: `string`

Default: `"Regional"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Map of tags to assign to the deployed resource.

Type: `map(any)`

Default: `null`

### <a name="input_zones"></a> [zones](#input\_zones)

Description: A set of availability zones to use.

Type: `set(number)`

Default:

```json
[
  1,
  2,
  3
]
```

## Outputs

The following outputs are exported:

### <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address)

Description: The assigned IP address of the public IP

### <a name="output_public_ip_id"></a> [public\_ip\_id](#output\_public\_ip\_id)

Description: The ID of the created public IP address

## Example

```terraform
module "avm-res-network-publicipaddress" {
  source  = "Azure/avm-res-network-publicipaddress/azurerm"
  version = "0.1.2"

  for_each                = var.public_ip
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  name                    = each.value.name
  enable_telemetry        = each.value.enable_telemetry
  zones                   = each.value.zones
  sku                     = each.value.sku
  sku_tier                = each.value.sku_tier
  ip_version              = each.value.ip_version
  allocation_method       = each.value.allocation_method
  domain_name_label       = each.value.domain_name_label
  reverse_fqdn            = each.value.reverse_fqdn
  public_ip_prefix_id     = each.value.public_ip_prefix_id
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  ip_tags                 = each.value.ip_tags
  ddos_protection_mode    = each.value.ddos_protection_mode
  ddos_protection_plan_id = each.value.ddos_protection_plan_id
  edge_zone               = each.value.edge_zone
  tags                    = each.value.tags
  lock                    = each.value.lock
  role_assignments        = each.value.role_assignments
  diagnostic_settings     = each.value.diagnostic_settings
}
```
## Example Tfvars

```hcl
public_ip = {
  "pip-1" = {
    location = "eastus2"
    resource_group_name = "test-pip-rg-01"
    name = "pip-shared-1"
    sku = "Standard"
    allocation_method = "Static"
    tags = {
      resourcetype        = "user-identity"
      appid               = "ap01"
      appname             = "infra"
      env                 = "dev"
      costcostcenter      = "test"
      costvp              = "VP"
      costappownertech    = "owner"
      costappownermanager = "Manager"
      costbudgetowner     = "budget owner"
      costdivision        = "IT"
      appfunction         = "exmaple general Prod Subscription"
      costbaseline        = "2024"
      costallocation      = "sharedcost"
      monthlybudget       = "1000"
      managed_by          = "own"
      additionalcontext   = "01"
    }
    diagnostic_settings = {
      diag-1 = {
        name = "test-diag-pip-1"
        log_groups = ["allLogs"]
        metric_categories = ["AllMetrics"]
        storage_account_resource_id = ""
      }
    }
    },
  "pip-2" = {
    location = "centralus"
    resource_group_name = "test-pip-rg-01"
    name = "pip-shared-2"
    sku = "Standard"
    allocation_method = "Static"
    tags = {
      resourcetype        = "user-identity"
      appid               = "ap01"
      appname             = "infra"
      env                 = "dev"
      costcostcenter      = "test"
      costvp              = "VP"
      costappownertech    = "owner"
      costappownermanager = "Manager"
      costbudgetowner     = "budget owner"
      costdivision        = "IT"
      appfunction         = "exmaple general Prod Subscription"
      costbaseline        = "2024"
      costallocation      = "sharedcost"
      monthlybudget       = "1000"
      managed_by          = "own"
      additionalcontext   = "01"
    }
    diagnostic_settings = {
      diag-2 = {
        name = "test-diag-pip-2"
        log_groups = ["allLogs"]
        metric_categories = ["AllMetrics"]
        storage_account_resource_id = ""
      }
    }
    }
}  
```

<!-- END_TF_DOCS -->