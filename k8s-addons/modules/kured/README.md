<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >2.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >2.46.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.kured](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.kurednamespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.kuredsecret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [azurerm_kubernetes_cluster.aks-cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | the aks cluster name | `string` | n/a | yes |
| <a name="input_cluster_rg"></a> [cluster\_rg](#input\_cluster\_rg) | the aks cluster resource group | `string` | n/a | yes |
| <a name="input_imgpullsecret"></a> [imgpullsecret](#input\_imgpullsecret) | kured image pull secret name | `any` | n/a | yes |
| <a name="input_kured_endtime"></a> [kured\_endtime](#input\_kured\_endtime) | kured aks end time | `any` | `null` | no |
| <a name="input_kured_imgpullpolicy"></a> [kured\_imgpullpolicy](#input\_kured\_imgpullpolicy) | kured image pull policy | `any` | n/a | yes |
| <a name="input_kured_imgrepository"></a> [kured\_imgrepository](#input\_kured\_imgrepository) | kured image repository url | `string` | `"ghcr.io/kubereboot/kured"` | no |
| <a name="input_kured_imgtag"></a> [kured\_imgtag](#input\_kured\_imgtag) | kured image tag | `any` | n/a | yes |
| <a name="input_kured_namespace"></a> [kured\_namespace](#input\_kured\_namespace) | kured aks deployment namespace | `any` | n/a | yes |
| <a name="input_kured_namespace_labels"></a> [kured\_namespace\_labels](#input\_kured\_namespace\_labels) | the kured namespace labels | `any` | n/a | yes |
| <a name="input_kured_period"></a> [kured\_period](#input\_kured\_period) | reboot check period (default 1h0m0s) | `any` | `null` | no |
| <a name="input_kured_rebootdays"></a> [kured\_rebootdays](#input\_kured\_rebootdays) | reboot days | `list(string)` | `null` | no |
| <a name="input_kured_starttime"></a> [kured\_starttime](#input\_kured\_starttime) | kured aks starting time | `any` | `null` | no |
| <a name="input_kured_timezone"></a> [kured\_timezone](#input\_kured\_timezone) | kured aks timezone | `any` | n/a | yes |
| <a name="input_registry_secret"></a> [registry\_secret](#input\_registry\_secret) | the registry secret | `string` | n/a | yes |
| <a name="input_registry_server"></a> [registry\_server](#input\_registry\_server) | the registry server | `any` | n/a | yes |
| <a name="input_registry_username"></a> [registry\_username](#input\_registry\_username) | the registry username | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->