<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 1.15 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.48.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.116.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.48.0 |
| <a name="provider_azurerm.management"></a> [azurerm.management](#provider\_azurerm.management) | 3.116.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | github.com/CenturyLink/tf-modules-azure//aks | 2.9.0 |
| <a name="module_akv"></a> [akv](#module\_akv) | github.com/CenturyLink/tf-modules-azure//key-vault | 2.8.0 |
| <a name="module_avm-roleassignment"></a> [avm-roleassignment](#module\_avm-roleassignment) | Azure/avm-res-authorization-roleassignment/azurerm | 0.1.0 |

## Resources

| Name | Type |
|------|------|
| [azuread_group.aks_cluster_admin_group](https://registry.terraform.io/providers/hashicorp/azuread/2.48.0/docs/data-sources/group) | data source |
| [azuread_group.aks_cluster_user_group](https://registry.terraform.io/providers/hashicorp/azuread/2.48.0/docs/data-sources/group) | data source |
| [azuread_group.aks_rbac_admin_group](https://registry.terraform.io/providers/hashicorp/azuread/2.48.0/docs/data-sources/group) | data source |
| [azuread_group.aks_rbac_reader_group](https://registry.terraform.io/providers/hashicorp/azuread/2.48.0/docs/data-sources/group) | data source |
| [azuread_group.aks_rbac_writer_group](https://registry.terraform.io/providers/hashicorp/azuread/2.48.0/docs/data-sources/group) | data source |
| [azuread_service_principal.ccoe-spn](https://registry.terraform.io/providers/hashicorp/azuread/2.48.0/docs/data-sources/service_principal) | data source |
| [azuread_user.tfteam](https://registry.terraform.io/providers/hashicorp/azuread/2.48.0/docs/data-sources/user) | data source |
| [azurerm_private_dns_zone.aks_centralus](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.aks_eastus2](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.kv](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/data-sources/private_dns_zone) | data source |
| [terraform_remote_state.networking](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.subscription_config](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.subscriptions](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_node_pools"></a> [additional\_node\_pools](#input\_additional\_node\_pools) | values mapped to kubernetes\_cluster\_node\_pool resource arguments | <pre>map(object({<br>    name                           = string<br>    vm_size                        = string<br>    cluster_auto_scaling           = bool<br>    os_disk_size_gb                = number<br>    os_disk_type                   = string #{Ephemeral, Managed}<br>    type                           = string<br>    enable_node_public_ip          = bool<br>    zones                          = list(string)<br>    taints                         = list(string)<br>    labels                         = map(string)<br>    max_pods                       = number<br>    cluster_auto_scaling_min_count = number<br>    cluster_auto_scaling_max_count = number<br>    node_count                     = number<br>    os_type                        = string<br>  }))</pre> | n/a | yes |
| <a name="input_admin_group_object_ids"></a> [admin\_group\_object\_ids](#input\_admin\_group\_object\_ids) | this should only ever be assigned to groups that do not include users | `string` | n/a | yes |
| <a name="input_aks_cluster_admin_group"></a> [aks\_cluster\_admin\_group](#input\_aks\_cluster\_admin\_group) | Group name for the AKS Cluster Admins | `string` | n/a | yes |
| <a name="input_aks_cluster_user_group"></a> [aks\_cluster\_user\_group](#input\_aks\_cluster\_user\_group) | Group name for the AKS Cluster Users | `string` | n/a | yes |
| <a name="input_aks_rbac_admin_group"></a> [aks\_rbac\_admin\_group](#input\_aks\_rbac\_admin\_group) | Group name for the AKS RBAC Admins | `string` | n/a | yes |
| <a name="input_aks_rbac_reader_group"></a> [aks\_rbac\_reader\_group](#input\_aks\_rbac\_reader\_group) | Group name for the AKS RBAC Readers | `string` | n/a | yes |
| <a name="input_aks_rbac_writer_group"></a> [aks\_rbac\_writer\_group](#input\_aks\_rbac\_writer\_group) | Group name for the AKS RBAC Writers | `string` | n/a | yes |
| <a name="input_default_node_pool_zones"></a> [default\_node\_pool\_zones](#input\_default\_node\_pool\_zones) | the default\_node\_pools AZs | `list(string)` | `[]` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | version of kubernetes to deploy | `string` | n/a | yes |
| <a name="input_mgmt_sub_id"></a> [mgmt\_sub\_id](#input\_mgmt\_sub\_id) | the mgmt subcription id for where the private dns zones reside | `string` | `"000bdcc8-114c-418a-ad9d-a1ac486ac658"` | no |
| <a name="input_network_profile"></a> [network\_profile](#input\_network\_profile) | The network profile configuration for the Kubernetes Cluster.<br><br>  - `network_plugin` - (Optional) The network plugin used for the Kubernetes Cluster. Possible values are `azure` and `kubenet`. Defaults to `kubenet`.<br>  - `network_policy` - (Optional) The network policy used for the Kubernetes Cluster. Possible values are `azure` and `calico`. Defaults to `calico`.<br>  - `dns_service_ip` - The IP address assigned to the Kubernetes DNS service.<br>  - `service_cidr` - The Network Range used by the Kubernetes service.<br>  - `load_balancer_sku` - (Optional) The SKU of the Load Balancer used for the Kubernetes Cluster. Possible values are `standard` and `basic`. Defaults to `standard`.<br>  - `load_balancer_profile` - (Optional) The Load Balancer Profile configuration for the Kubernetes Cluster.<br>    - `backend_pool_type` - (Optional) The type of the backend pool. Possible values are `NodeIPConfiguration` and `VirtualNetwork`. Defaults to `NodeIPConfiguration`.<br>    - `managed_outbound_ip_count` - (Optional) The number of managed outbound IPs to use with the Load Balancer. Defaults to 1.<br>  - `pod_cidr` - The Network Range used by the Kubernetes Pods.<br>  - `outbound_type` - (Optional) The outbound (egress) traffic configuration for the Kubernetes Cluster. Possible values are `loadBalancer` and `userDefinedRouting`. Defaults to `userDefinedRouting`.<br>  - `network_data_plane` - (Optional) The network data plane used for the Kubernetes Cluster. Possible values are `azure` and `cilium`. Defaults to `azure`. | <pre>object({<br>    network_plugin    = optional(string, "kubenet")<br>    network_policy    = optional(string, "calico")<br>    dns_service_ip    = string<br>    service_cidr      = string<br>    load_balancer_sku = optional(string, "standard")<br>    load_balancer_profile = optional(object({<br>      backend_pool_type         = optional(string, null)<br>      managed_outbound_ip_count = optional(number, null)<br>      }), {<br>      backend_pool_type         = null<br>      managed_outbound_ip_count = null<br>    })<br>    pod_cidr           = string<br>    outbound_type      = optional(string, "loadBalancer")<br>    network_data_plane = optional(string, "azure")<br>  })</pre> | <pre>{<br>  "dns_service_ip": "10.2.0.10",<br>  "pod_cidr": "10.244.0.0/16",<br>  "service_cidr": "10.2.0.0/24"<br>}</pre> | no |
| <a name="input_private_dns_rg"></a> [private\_dns\_rg](#input\_private\_dns\_rg) | private dns zone resource group | `string` | `"rg-dns_infrastructure"` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | tenant id where the subscription to deploy the aks cluster is | `string` | `"72b17115-9915-42c0-9f1b-4f98e5a4bcd2"` | no |
| <a name="input_tf_team_group"></a> [tf\_team\_group](#input\_tf\_team\_group) | List of User Ids for the Terraform Team | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks"></a> [aks](#output\_aks) | values for  clusters |
| <a name="output_akv"></a> [akv](#output\_akv) | values for akv |
<!-- END_TF_DOCS -->