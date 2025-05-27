<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.7.0, < 4.2.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_validation"></a> [validation](#provider\_validation) | ~> 1.1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-managedidentity-userassignedidentity"></a> [avm-res-managedidentity-userassignedidentity](#module\_avm-res-managedidentity-userassignedidentity) | Azure/avm-res-managedidentity-userassignedidentity/azurerm | 0.3.3 |
| <a name="module_avm_res_resources_resourcegroup"></a> [avm\_res\_resources\_resourcegroup](#module\_avm\_res\_resources\_resourcegroup) | ../resource-groups | n/a |

## Resources

| Name | Type |
|------|------|
| [validation_warning.managed_by](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) | resource |

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
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Set this to true if a new RG is required. | `bool` | `false` | no |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | This variable controls whether or not telemetry is enabled for the module.<br>For more information see <https://aka.ms/avm/telemetryinfo>.<br>If it is set to false, then no telemetry will be collected. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Required. The Azure region for deployment of the this resource. | `string` | n/a | yes |
| <a name="input_lock"></a> [lock](#input\_lock) | Controls the Resource Lock configuration for this resource. The following properties can be specified:<br><br>  - `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.<br>  - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource. | <pre>object({<br>    kind = string<br>    name = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | resource group is managed by | `string` | `null` | no |
| <a name="input_managed_identity"></a> [managed\_identity](#input\_managed\_identity) | user assigned managed identity name | <pre>map(object({<br>    user_managed_identity_name           = string<br>    managed_identity_location            = string<br>    managed_identity_resource_group_name = string<br>    tags                                 = optional(map(string))<br>    lock = optional(object({<br>      kind = string<br>      name = optional(string, null)<br>    }))<br>    enable_telemetry = optional(bool, false)<br><br>  }))</pre> | `{}` | no |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the RG in which the user assigned managed identity should be deployed | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | resource type -- 3 letters | `string` | n/a | yes |
| <a name="input_rg_role_assignments"></a> [rg\_role\_assignments](#input\_rg\_role\_assignments) | The role assignment to be assigned to the resource group | <pre>map(object({<br>    role_definition_id_or_name             = string<br>    principal_id                           = string<br>    description                            = optional(string, null)<br>    skip_service_principal_aad_check       = optional(bool, false)<br>    condition                              = optional(string, null)<br>    condition_version                      = optional(string, null)<br>    delegated_managed_identity_resource_id = optional(string, null)<br>    principal_type                         = optional(string, null)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | User managed identity Client ID |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | User managed identity principal ID |
| <a name="output_resource"></a> [resource](#output\_resource) | User managed identity resource output |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | User managed identity resource ID |
| <a name="output_resource_name"></a> [resource\_name](#output\_resource\_name) | The name of the User Assigned Identity that was created. |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | The ID of the Tenant which the Identity belongs to. |
<!-- END_TF_DOCS -->

## Example Usage

```hcl
module "example_userassigned_identity" {
  source              = "path/to/module"

  # Required Inputs
  location            = each.value.managed_identity_location
  resource_group_name = each.value.managed_identity_resource_group_name
  name                = each.value.user_managed_identity_name
  lock                = each.value.lock
  enable_telemetry    = each.value.enable_telemetry
  tags                = local.tags[each.key]
  .
  .
}
```


## Example Tfvars

```hcl
create_resource_group = true
enable_telemetry      = true
resource_group_name   = "avmModuleTesting2"
location              = "EastUS"
managed_identity = {
  "user_identity1" = {
    user_managed_identity_name           = "testuseridentity4927"
    managed_identity_resource_group_name = "avmModuleTesting2"
    managed_identity_location            = "EastUS"
  }
  "user_identity2" = {
    user_managed_identity_name           = "testuseridentity9735"
    managed_identity_resource_group_name = "avmModuleTesting2"
    managed_identity_location            = "EastUS"
  }
}

# Tag variable values
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
```