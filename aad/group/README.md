<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.26.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.26.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_group.group](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/resources/group) | resource |
| [azuread_user.owner](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | the name of the group to create | `string` | n/a | yes |
| <a name="input_group_owners"></a> [group\_owners](#input\_group\_owners) | list of owner email addresses | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_id"></a> [group\_id](#output\_group\_id) | n/a |
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | n/a |
<!-- END_TF_DOCS -->