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
| [azuread_app_role_assignment.gcp_lumen_prov_group](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/resources/app_role_assignment) | resource |
| [azuread_app_role_assignment.gcp_lumen_sso_group](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/resources/app_role_assignment) | resource |
| [azuread_group.group](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/data-sources/group) | data source |
| [azuread_service_principal.gcp_prov_app_sp](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/data-sources/service_principal) | data source |
| [azuread_service_principal.gcp_sso_app_sp](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/data-sources/service_principal) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | name of the group that already exists | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->