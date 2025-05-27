# Subscription Module

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (>= 2.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (> 3.89)

- <a name="requirement_time"></a> [time](#requirement\_time) (>= 0.13.0)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (> 3.89)

- <a name="provider_time"></a> [time](#provider\_time) (>= 0.13.0)

- <a name="provider_validation"></a> [validation](#provider\_validation) (~> 1.1.1)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_management_group_subscription_association.mg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) (resource)
- [azurerm_subscription.subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) (resource)
- [time_static.provisioned_date](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/static) (resource)
- [validation_warning.appFunction](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appid](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appid_2](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAllocation](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerManager](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerTech](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costBudgetOwner](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costCostCenter](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costDivision](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costRegion](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costVP](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costbaseline](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.env](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.location](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.monthlyBudget](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [azurerm_billing_enrollment_account_scope.scope](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_enrollment_account_scope) (data source)
- [azurerm_management_group.management_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/management_group) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_management_group_name"></a> [management\_group\_name](#input\_management\_group\_name)

Description: The name of the management group to associate the subscription with.

Type: `string`

### <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name)

Description: The name of the subscription.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

Default: `"01"`

### <a name="input_appFunction"></a> [appFunction](#input\_appFunction)

Description: app function

Type: `string`

Default: `null`

### <a name="input_app_id"></a> [app\_id](#input\_app\_id)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_appname"></a> [appname](#input\_appname)

Description: the app name for the resources.  Used for tagging and naming purposes

Type: `string`

Default: `null`

### <a name="input_billing_account_name"></a> [billing\_account\_name](#input\_billing\_account\_name)

Description: The ID of the billing account.

Type: `string`

Default: `"78358115"`

### <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation)

Description: can only be sharedcosts or chargeback

Type: `string`

Default: `null`

### <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager)

Description: The app owner manager responsible for resources. Used for tagging purposes.

Type: `string`

Default: `null`

### <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech)

Description: The app owner responsible for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner)

Description: The budget owner responsible for resources. Used for tagging purposes.

Type: `string`

Default: `null`

### <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter)

Description: The cost center code for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_costDivision"></a> [costDivision](#input\_costDivision)

Description: cost division

Type: `string`

Default: `null`

### <a name="input_costRegion"></a> [costRegion](#input\_costRegion)

Description: region where the resources are deployed

Type: `string`

Default: `null`

### <a name="input_costVP"></a> [costVP](#input\_costVP)

Description: The cost vp for resources. Used for tagging purposes.

Type: `string`

Default: `null`

### <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline)

Description: year resource created

Type: `string`

Default: `null`

### <a name="input_enrollment_account_name"></a> [enrollment\_account\_name](#input\_enrollment\_account\_name)

Description: The ID of the enrollment account.

Type: `string`

Default: `"222349"`

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `"nonprod"`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where resources will be deployed

Type: `string`

Default: `"NA"`

### <a name="input_migration"></a> [migration](#input\_migration)

Description: Boolean value to know if the application was migrated.

Type: `string`

Default: `"yes"`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

Default: `null`

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: the resource type being deployed see naming standards for example

Type: `string`

Default: `"sub"`

### <a name="input_subscription_alias"></a> [subscription\_alias](#input\_subscription\_alias)

Description: The alias of the subscription.

Type: `string`

Default: `null`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The ID of the subscription if already exist

Type: `string`

Default: `""`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: (Optional) Tags of the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_billing_scope_id"></a> [billing\_scope\_id](#output\_billing\_scope\_id)

Description: The billing scope ID

### <a name="output_id"></a> [id](#output\_id)

Description: The alias ID of the subscription

### <a name="output_subscription"></a> [subscription](#output\_subscription)

Description: The subscription object

### <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id)

Description: The subscription ID

### <a name="output_subscription_name"></a> [subscription\_name](#output\_subscription\_name)

Description: The subscription name
<!-- END_TF_DOCS -->
