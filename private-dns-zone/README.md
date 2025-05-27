<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_validation"></a> [validation](#provider\_validation) (~> 1.1.1)

## Modules

The following Modules are called:

### <a name="module_avm-res-network-privatednszone"></a> [avm-res-network-privatednszone](#module\_avm-res-network-privatednszone)

Source: Azure/avm-res-network-privatednszone/azurerm

Version: 0.3.3

## Resources

The following resources are used by this module:

- [validation_warning.appFunction](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appid](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appname](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAllocation](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerManager](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerTech](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costBudgetOwner](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costCostCenter](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costDivision](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costVP](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costbaseline](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.env](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.location](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.monthlyBudget](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.resourcetype](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_app_id"></a> [app\_id](#input\_app\_id)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name)

Description: The name of the private dns zone.

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration)

Description: The migration tag used.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The resource group where the resources will be deployed.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_a_records"></a> [a\_records](#input\_a\_records)

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

### <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records)

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

### <a name="input_appFunction"></a> [appFunction](#input\_appFunction)

Description: app function

Type: `string`

Default: `""`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_appname"></a> [appname](#input\_appname)

Description: the app name for the resources.  Used for tagging and naming purposes

Type: `string`

Default: `""`

### <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records)

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

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see https://aka.ms/avm/telemetryinfo.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where resources will be deployed

Type: `string`

Default: `""`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

Default: `""`

### <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records)

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

### <a name="input_ptr_records"></a> [ptr\_records](#input\_ptr\_records)

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

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: the resource type being deployed see naming standards for example

Type: `string`

Default: `""`

### <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record)

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

### <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records)

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

### <a name="input_tags"></a> [tags](#input\_tags)

Description: (Optional) Tags of the resource.

Type: `map(string)`

Default: `null`

### <a name="input_txt_records"></a> [txt\_records](#input\_txt\_records)

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

### <a name="input_virtual_network_links"></a> [virtual\_network\_links](#input\_virtual\_network\_links)

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

## Outputs

The following outputs are exported:

### <a name="output_a_record_outputs"></a> [a\_record\_outputs](#output\_a\_record\_outputs)

Description: n/a

### <a name="output_aaaa_record_outputs"></a> [aaaa\_record\_outputs](#output\_aaaa\_record\_outputs)

Description: n/a

### <a name="output_cname_record_outputs"></a> [cname\_record\_outputs](#output\_cname\_record\_outputs)

Description: n/a

### <a name="output_dns_zone_id"></a> [dns\_zone\_id](#output\_dns\_zone\_id)

Description: n/a

### <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name)

Description: n/a

### <a name="output_mx_record_outputs"></a> [mx\_record\_outputs](#output\_mx\_record\_outputs)

Description: n/a

### <a name="output_privatednszone"></a> [privatednszone](#output\_privatednszone)

Description: The private dns zone details

### <a name="output_ptr_record_outputs"></a> [ptr\_record\_outputs](#output\_ptr\_record\_outputs)

Description: n/a

### <a name="output_srv_record_outputs"></a> [srv\_record\_outputs](#output\_srv\_record\_outputs)

Description: n/a

### <a name="output_txt_record_outputs"></a> [txt\_record\_outputs](#output\_txt\_record\_outputs)

Description: n/a

### <a name="output_virtual_network_link_outputs"></a> [virtual\_network\_link\_outputs](#output\_virtual\_network\_link\_outputs)

Description: n/a
<!-- END_TF_DOCS -->