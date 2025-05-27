# AzureRM ExpressRoute - Terraform module
> **Warning**: This module is deprecated. Please use the express-route module (https://github.com/CenturyLink/tf-modules-azure/tree/branch/241028-11345-express-route/express-route) instead . This is AVM module which contains code to deploy express route circuit with peering and Authorization.
## Requirements.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_express_route_circuit.erc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_circuit) | resource |
| [azurerm_public_ip.publicip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.exprrg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_ercmbps"></a> [ercmbps](#input\_ercmbps) | expressroute pipe size | `string` | n/a | yes |
| <a name="input_ercpeeringlocation"></a> [ercpeeringlocation](#input\_ercpeeringlocation) | expressroute peering location | `string` | n/a | yes |
| <a name="input_ercserviceprovider"></a> [ercserviceprovider](#input\_ercserviceprovider) | service provider for the expressroute | `string` | n/a | yes |
| <a name="input_ercskufamily"></a> [ercskufamily](#input\_ercskufamily) | expressroute sku | `string` | n/a | yes |
| <a name="input_ercskutier"></a> [ercskutier](#input\_ercskutier) | expressroute sku tier | `string` | n/a | yes |
| <a name="input_exprrg"></a> [exprrg](#input\_exprrg) | resource group for where the expressroute will be provisioned | `any` | n/a | yes |
| <a name="input_ipsku"></a> [ipsku](#input\_ipsku) | Static or Dynamic for ip type | `string` | `"Standard"` | no |
| <a name="input_iptype"></a> [iptype](#input\_iptype) | Static or Dynamic for ip type | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | zones needed for public ips | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_express_route_circuit_id"></a> [express\_route\_circuit\_id](#output\_express\_route\_circuit\_id) | ID of the Circuit |
| <a name="output_service_key"></a> [service\_key](#output\_service\_key) | Service Key of the Circuit |
<!-- END_TF_DOCS -->
