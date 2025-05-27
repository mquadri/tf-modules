<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

## Modules

The following Modules are called:

### <a name="module_avm-res-containerregistry-registry"></a> [avm-res-containerregistry-registry](#module\_avm-res-containerregistry-registry)

Source: Azure/avm-res-containerregistry-registry/azurerm

Version: 0.3.1

## Resources

The following resources are used by this module:

- [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

Default: `""`

### <a name="input_admin_enabled"></a> [admin\_enabled](#input\_admin\_enabled)

Description: n/a

Type: `bool`

Default: `false`

### <a name="input_anonymous_pull_enabled"></a> [anonymous\_pull\_enabled](#input\_anonymous\_pull\_enabled)

Description: n/a

Type: `bool`

Default: `false`

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

### <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group)

Description: Set this to true if a new RG is required.

Type: `bool`

Default: `false`

### <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings)

Description: Private Endpoints for the supported resources

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

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_export_policy_enabled"></a> [export\_policy\_enabled](#input\_export\_policy\_enabled)

Description: Specifies whether export policy is enabled. Defaults to true. In order to set it to false, make sure the public\_network\_access\_enabled is also set to false.

Type: `bool`

Default: `false`

### <a name="input_georeplications"></a> [georeplications](#input\_georeplications)

Description: A list of geo-replication configurations for the Container Registry.

- `location` - (Required) The geographic location where the Container Registry should be geo-replicated.
- `regional_endpoint_enabled` - (Optional) Enables or disables regional endpoint. Defaults to `true`.
- `zone_redundancy_enabled` - (Optional) Enables or disables zone redundancy. Defaults to `true`.
- `tags` - (Optional) A map of additional tags for the geo-replication configuration. Defaults to `null`.

This has a default for compatibility, we recommend leaving it as [] if you don't need it.

Type:

```hcl
list(object({
    location                  = string
    regional_endpoint_enabled = optional(bool, true)
    zone_redundancy_enabled   = optional(bool, true)
    tags                      = optional(map(any), null)
  }))
```

Default:

```json
[
  {
    "location": "EastUS2",
    "zone_redundancy_enabled": false
  }
]
```

### <a name="input_location"></a> [location](#input\_location)

Description: The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'

Type: `string`

Default: `null`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

Default: `""`

### <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints)

Description: Private Endpoints for the supported resources

Type:

```hcl
map(object({
    private_dns_zone_resource_ids   = optional(list(string))
    name                            = string
    private_service_connection_name = string
    tags                            = optional(map(string), null)
    private_dns_zone_group_name     = string
    location                        = string
    resource_group_name             = string
    subnet_resource_id              = string
  }))
```

Default: `{}`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: n/a

Type: `bool`

Default: `false`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: A container that holds related resources for an Azure solution

Type: `string`

Default: `null`

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: the resource type being deployed see naming standards for example

Type: `string`

Default: `""`

### <a name="input_sku"></a> [sku](#input\_sku)

Description: Name of the Recovery Services Vault to be created

Type: `string`

Default: `"Premium"`

## Outputs

The following outputs are exported:

### <a name="output_acr_name"></a> [acr\_name](#output\_acr\_name)

Description: Azure Container registry Name

### <a name="output_acr_resource_id"></a> [acr\_resource\_id](#output\_acr\_resource\_id)

Description: Azure Container registry Resource ID

### <a name="output_private_endpoints"></a> [private\_endpoints](#output\_private\_endpoints)

Description: Azure Container registry Private endpoints
<!-- END_TF_DOCS -->

## Example Usage

```hcl
module "avm-res-containerregistry-registry" {
  source                        = "Azure/avm-res-containerregistry-registry/azurerm"
  version                       = "0.3.1"
  location                      = var.location
  name                          = "${local.naming}${var.additionalcontext}"
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  .
  .
}
```


## Example Tfvars

```hcl
create_resource_group = true
resource_group_name = "avmModuleTesting2"
location            = "EastUS"
private_connection_resource_id = ""
# Azure Subscription ID
subscription_id = ""

# Virtual Network Details
virtual_network_rg   = "test-lumen-rg14"
virtual_network_name = "testvnet49"
pe_subnet_name       = "default"
dns_zone_id          = ""
create_dns_zone      = true
domain_name       = "test.project.com"
additionalcontext = "test"
virtual_network_links = {
  "test-vnet-link" = {
    vnetlinkname = "test-vnet-link2"
    vnetid       = ""
  }
}

# Tag variable values
resourcetype   = "sub"
appid          = "test"
appname        = "exampleApp"
env            = "dev"
costCostCenter = "test"
costAppOwnerTech    = "owner"
costAppOwnerManager = "manager"
costBudgetOwner     = "budget owner"
appFunction    = "exmaple general dev Subscription"
costbaseline   = "2024"
costAllocation = "sharedcost"
monthlyBudget  = "1000"

#ACR variable values
acr_name = "testacr0568"
diagnostic_settings = {
  ds1 = {
    name              = "test-diagnostics"
    log_categories    = []
    log_groups        = ["allLogs"]
    metric_categories = ["AllMetrics"]
    storage_account_resource_id = ""
  }
}
```