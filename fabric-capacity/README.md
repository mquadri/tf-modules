<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 1.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.71.0, < 4.0 |
| <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) | ~> 0.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | ~> 1.15 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.71.0, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.fabric_capacity](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_administration_members"></a> [administration\_members](#input\_administration\_members) | Microsoft Fabric capacity administration members that will manage the capacity. The capacity administrator must be a member user or a service principal in your AAD tenant. | `list(string)` | n/a | yes |
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
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | allow override of the Fabric capacity name | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name for where Fabric capacity will be deployed | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | `"fabc"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for this Fabric capacity. Possible values are `F2`, `F4`, `F8`, `F16`, `F32`, `F64`, `F128`, `F256`, `F512`, `F1024`, `F2048` | `string` | `"F2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Fabric Capacity. |
| <a name="output_resource"></a> [resource](#output\_resource) | Resource of the instance of Fabric Capacity. |
<!-- END_TF_DOCS -->