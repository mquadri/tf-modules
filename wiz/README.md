<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.46.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.83 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.10.0 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 2.46.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.83 |
| <a name="provider_time"></a> [time](#provider\_time) | ~> 0.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_app_role_assignment.sp_grant_role_consent](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/app_role_assignment) | resource |
| [azuread_service_principal.msgraph](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_role_assignment.wiz_custom_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.wiz_k8s_cluster_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.wiz_k8s_rbac_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.wiz_openai_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.wiz_reader_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.wiz_storage_reader_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_definition.wiz_custom_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [time_sleep.wait_for_az_dataplane_custom_role](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [azuread_application_published_app_ids.well_known](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application_published_app_ids) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_environment"></a> [azure\_environment](#input\_azure\_environment) | The Cloud Environment which should be used, possible values are: public, usgovernment, german, and china.<br>    Defaults to public. | `string` | `"public"` | no |
| <a name="input_azure_management_group_id"></a> [azure\_management\_group\_id](#input\_azure\_management\_group\_id) | If set, will add role assignments for the wiz application to the management group.<br>    Takes precedence over subscription\_id. | `string` | `""` | no |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | If set, will add role assignments for the wiz application to the subscription.<br>    If management\_group\_id is set, it takes precedence. | `string` | `""` | no |
| <a name="input_azure_wait_timer"></a> [azure\_wait\_timer](#input\_azure\_wait\_timer) | (Optional) Wait timer for Azure dataplane propagation - Default: 360 | `string` | `"360s"` | no |
| <a name="input_enable_data_scanning"></a> [enable\_data\_scanning](#input\_enable\_data\_scanning) | If set, adds data scanning required permissions to the Wiz custom role. Default is false. | `bool` | `false` | no |
| <a name="input_enable_entra_id_scanning"></a> [enable\_entra\_id\_scanning](#input\_enable\_entra\_id\_scanning) | If set, adds permissions for Entra ID scanning to the Azure Service Principal. Default is false. | `bool` | `false` | no |
| <a name="input_enable_openai_scanning"></a> [enable\_openai\_scanning](#input\_enable\_openai\_scanning) | If set, adds the required role for OpenAI scanning by Wiz. Default is false. | `bool` | `false` | no |
| <a name="input_enable_serverless_scanning"></a> [enable\_serverless\_scanning](#input\_enable\_serverless\_scanning) | If set, adds serverless scanning required permissions to the Wiz custom role. Default is false. | `bool` | `false` | no |
| <a name="input_wiz_custom_role_name"></a> [wiz\_custom\_role\_name](#input\_wiz\_custom\_role\_name) | The name of the Azure custom role to create. Defaults to WizCustomRole. | `string` | `"WizCustomRole"` | no |
| <a name="input_wiz_spn_id"></a> [wiz\_spn\_id](#input\_wiz\_spn\_id) | Object ID of Wiz's SPN managed Entra ID application. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_management_group_id"></a> [management\_group\_id](#output\_management\_group\_id) | n/a |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | n/a |
<!-- END_TF_DOCS -->