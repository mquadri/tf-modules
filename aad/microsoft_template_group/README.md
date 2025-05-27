# tf-modules-azure-ad-group
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_group.group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | The display name for the group. | `any` | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic\_membership block | `any` | `null` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | set of object IDs of principals that will be granted ownership of the group. Supported object types are users or service principals. By default, the principal being used to execute Terraform is assigned as the sole owner. Groups cannot be created with no owners or have all their owners removed. | `any` | `null` | no |
| <a name="input_security_enabled"></a> [security\_enabled](#input\_security\_enabled) | Whether the group is a security group for controlling access to in-app resources. Defaults to true. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Ojbect ID of the Azure AD Group |
<!-- END_TF_DOCS -->