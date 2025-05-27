# AzureRM ExpressRoute - Terraform module

## Requirements

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
| [azurerm_express_route_circuit_peering.privpeer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_circuit_peering) | resource |
| [azurerm_resource_group.exprrg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network_gateway.ercgw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.erccn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |
| [azurerm_express_route_circuit.expr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/express_route_circuit) | data source |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |

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
| <a name="input_ercskufamily"></a> [ercskufamily](#input\_ercskufamily) | expressroute sku | `string` | n/a | yes |
| <a name="input_exprrg"></a> [exprrg](#input\_exprrg) | resource group for expressroute | `string` | n/a | yes |
| <a name="input_gwsku"></a> [gwsku](#input\_gwsku) | vng sku size | `string` | n/a | yes |
| <a name="input_gwsubnet"></a> [gwsubnet](#input\_gwsubnet) | vng gw subnet | `string` | n/a | yes |
| <a name="input_ipsku"></a> [ipsku](#input\_ipsku) | Static or Dynamic for ip type | `string` | `"Standard"` | no |
| <a name="input_iptype"></a> [iptype](#input\_iptype) | Static or Dynamic for ip type | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_peer_asn"></a> [peer\_asn](#input\_peer\_asn) | peer bgp asn | `string` | n/a | yes |
| <a name="input_primary_peering_address"></a> [primary\_peering\_address](#input\_primary\_peering\_address) | private peering primary address subnet | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_rtweight"></a> [rtweight](#input\_rtweight) | routing weight | `string` | n/a | yes |
| <a name="input_secondary_peering_address"></a> [secondary\_peering\_address](#input\_secondary\_peering\_address) | private peering secondary address subnet | `string` | n/a | yes |
| <a name="input_vlan_id"></a> [vlan\_id](#input\_vlan\_id) | vlan id for private peering | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | zones needed for public ips | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_expressroute_gw_id"></a> [expressroute\_gw\_id](#output\_expressroute\_gw\_id) | expressroute gateway id |
<!-- END_TF_DOCS -->