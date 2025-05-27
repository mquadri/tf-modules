
::warning:: This module is not compatible with prior 2.0 versions, please note that if used in an exisiting cluster it will destroy most of the lements but you will gain stability ::warning::

This module use AVM AKS module for bicep and then AZAPI to deploy, more information on AVM can be found [here](https://azure.github.io/Azure-Verified-Modules/)

bicep module can be found [here](https://github.com/Azure/bicep-registry-modules/blob/main/avm/res/container-service/managed-cluster/README.md)

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 1.15)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azapi"></a> [azapi](#provider\_azapi) (~> 1.15)

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

- <a name="provider_http"></a> [http](#provider\_http)

- <a name="provider_time"></a> [time](#provider\_time)

- <a name="provider_validation"></a> [validation](#provider\_validation) (~> 1.1.1)

## Modules

The following Modules are called:

### <a name="module_avm-rbac-assignments-management"></a> [avm-rbac-assignments-management](#module\_avm-rbac-assignments-management)

Source: Azure/avm-res-authorization-roleassignment/azurerm

Version: 0.1.0

## Resources

The following resources are used by this module:

- [azapi_resource.aks-deployment](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) (resource)
- [azurerm_user_assigned_identity.aks-spn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) (resource)
- [time_sleep.wait_90_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) (resource)
- [validation_warning.aks_private_dns_name](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appFunction](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.appid](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAllocation](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerManager](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerTech](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costBudgetOwner](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costCostCenter](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costDivision](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costVP](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costbaseline](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.default_node_pool](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.default_node_pool_node_taints](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.default_node_pool_os_disk_type](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.default_node_pool_zones](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.dns_resource_group_name](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.env](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.ips_out_of_non_route](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.monthlyBudget](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.rbac_enabled](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.upgrade_settings](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.workload_autoscaler_profile](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [azurerm_subnet.aks-subnet-node-cidr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) (data source)
- [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) (data source)
- [azurerm_virtual_network.aks-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) (data source)
- [http_http.bicep_json_release](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

### <a name="input_admin_group_object_ids"></a> [admin\_group\_object\_ids](#input\_admin\_group\_object\_ids)

Description: this should only ever be assigned to groups that do not include users

Type: `string`

### <a name="input_aks_vnet_name"></a> [aks\_vnet\_name](#input\_aks\_vnet\_name)

Description: aks vnet name where aks will be deployed

Type: `string`

### <a name="input_aks_vnet_subnet_name"></a> [aks\_vnet\_subnet\_name](#input\_aks\_vnet\_subnet\_name)

Description: aks subnet name where aks will be deployed

Type: `string`

### <a name="input_app_id"></a> [app\_id](#input\_app\_id)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_appname"></a> [appname](#input\_appname)

Description: the app name for the resources.  Used for tagging and naming purposes

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version)

Description: version of kubernetes to deploy

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where resources will be deployed

Type: `string`

### <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration)

Description: The migration tag used.

Type: `string`

### <a name="input_network_resource_group_name"></a> [network\_resource\_group\_name](#input\_network\_resource\_group\_name)

Description: resource group where vnet/subnet aks will be deployed to.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: the name of the resourcegroup to deploy the aks cluster to

Type: `string`

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: resource type -- 3 letters

Type: `string`

### <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id)

Description: the subnet ID of the node pool

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aad_profile_client_id"></a> [aad\_profile\_client\_id](#input\_aad\_profile\_client\_id)

Description: AAD Profile Client ID (Bicep Compatibility)

Type: `string`

Default: `null`

### <a name="input_aad_profile_server_app_secret"></a> [aad\_profile\_server\_app\_secret](#input\_aad\_profile\_server\_app\_secret)

Description: AAD Profile Server App Secret (Bicep Compatibility)

Type: `string`

Default: `null`

### <a name="input_aad_profile_server_id"></a> [aad\_profile\_server\_id](#input\_aad\_profile\_server\_id)

Description: AAD Profile Server ID (Bicep Compatibility)

Type: `string`

Default: `null`

### <a name="input_additional_node_pools"></a> [additional\_node\_pools](#input\_additional\_node\_pools)

Description:   Additional node pools to be added to the cluster. Each node pool is defined as a map of objects with the following keys:

  - `name` - The name of the node pool.
  - `vm_size` - The size of the Virtual Machine.
  - `cluster_auto_scaling` - Enable cluster auto-scaling.
  - `os_disk_size_gb` - The size of the OS Disk in GB.
  - `os_disk_type` - The type of disk used for the OS. Possible values are Ephemeral and Managed.
  - `type` - The type of node pool. Possible values are VirtualMachineScaleSets and AvailabilitySet.
  - `enable_node_public_ip` - Enable the public IP address for the nodes in the node pool.
  - `zones` - The Availability Zones for the nodes in the node pool.
  - `taints` - The taints for the nodes in the node pool.
  - `labels` - The labels for the nodes in the node pool.
  - `max_pods` - The maximum number of pods that can run on each node in the node pool.
  - `cluster_auto_scaling_min_count` - The minimum number of nodes in the node pool when auto-scaling is enabled.
  - `cluster_auto_scaling_max_count` - The maximum number of nodes in the node pool when auto-scaling is enabled.
  - `node_count` - The number of nodes in the node pool.
  - `os_type` - The type of operating system used for each node in the node pool. Possible values are Linux and Windows. Defaults to Linux.
  - `enable_fips` - (Optional)Should the nodes in this Node Pool have Federal Information Processing Standard enabled? Changing this forces a new resource to be created. Defaults to false.
  - `ultra_ssd_enabled` - (Optional) Enable Ultra SSD for the node pool. Defaults to false.
  - `gpu_instance` - (Optional) Specifies the GPU MIG instance profile for supported GPU VM SKU. The allowed values are MIG1g, MIG2g, MIG3g, MIG4g and MIG7g. Changing this forces a new resource to be created. Defaults to null
  - `kubelet_disk_type` - (Optional) The type of disk used by kubelet. Possible values are OS and Temporary.
  - `max_surge` - (Optional) The maximum number of nodes that can be added to the node pool during an upgrade. Defaults to 33%.
  - `node_public_ip_prefix_id` - (Optional) The ID of the Public IP Prefix used to assign public IP addresses to the nodes in the node pool. Changing this forces a new resource to be created. Defaults to null.
  - `os_sku` - (Optional) The SKU of the operating system used for each node in the node pool. Possible values are Ubuntu, Windows2019, Windows2022, AzureLinux. Defaults to Ubuntu.
  - `pod_subnet_id` - (Optional) The ID of the subnet used for the pods in the node pool. Changing this forces a new resource to be created. Defaults to null.
  - `proximity_placement_group_id` - (Optional) The ID of the Proximity Placement Group that the node pool should be placed in. Changing this forces a new resource to be created. Defaults to null.
  - `scale_down_mode` - (Optional) The scale down mode for the node pool. Possible values are Delete and Deallocate. Defaults to Delete.
  - `eviction_policy` - (Optional) The eviction policy for the node pool. Possible values are Delete and Deallocate. Defaults to null.
  - `priority` - (Optional) The priority of the node pool. Possible values are Regular and Spot. Defaults to Regular.
  - `spot_max_price` - (Optional) The maximum price you're willing to pay in USD per Virtual Machine. Valid values are -1 (the current on-demand price for a Virtual Machine) or a positive value with up to five decimal places. Changing this forces a new resource to be created. This field can only be configured when priority is set to Spot.
  - `workload_runtime` - (Optional) The workload runtime for the node pool. Changing this forces a new resource to be created. Defaults to null.

Type:

```hcl
map(object({
    name                           = string
    zones                          = optional(set(number), [])
    node_count                     = optional(number, 2)
    host_group_id                  = optional(string, null)
    capacity_reservation_group_id  = optional(string, null)
    vm_size                        = optional(string, "Standard_D16s_v3")
    cluster_auto_scaling           = optional(bool, true)
    enable_host_encryption         = optional(bool, false)
    os_disk_size_gb                = optional(number, 2000)
    os_disk_type                   = optional(string, "Managed")
    type                           = optional(string, "VirtualMachineScaleSets")
    enable_node_public_ip          = optional(bool, false)
    taints                         = optional(list(string), null)
    labels                         = optional(map(string), {})
    max_pods                       = optional(number, 110)
    cluster_auto_scaling_min_count = optional(number, 2)
    cluster_auto_scaling_max_count = optional(number, 3)
    os_type                        = optional(string, "Linux")
    fips_enabled                   = optional(bool, false)
    ultra_ssd_enabled              = optional(bool, false)
    gpu_instance                   = optional(string, null)
    kubelet_disk_type              = optional(string, null)
    max_surge                      = optional(string, "33%")
    node_public_ip_prefix_id       = optional(string, null)
    os_sku                         = optional(string, "Ubuntu")
    pod_subnet_id                  = optional(string, null)
    proximity_placement_group_id   = optional(string, null)
    scale_down_mode                = optional(string, "Delete")
    eviction_policy                = optional(string, null)
    priority                       = optional(string, "Regular")
    spot_max_price                 = optional(number, null)
    workload_runtime               = optional(string, null)
    vnet_subnet_id                 = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_aks_private_dns_name"></a> [aks\_private\_dns\_name](#input\_aks\_private\_dns\_name)

Description: DEPRECATED: private dns zone name

Type: `string`

Default: `"privatelink.azure.com"`

### <a name="input_aks_service_principal"></a> [aks\_service\_principal](#input\_aks\_service\_principal)

Description: service principal for the aks cluster

Type:

```hcl
object({
    client_id     = string
    client_secret = string
  })
```

Default: `null`

### <a name="input_appFunction"></a> [appFunction](#input\_appFunction)

Description: app function

Type: `string`

Default: `null`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_authorized_ip_ranges"></a> [authorized\_ip\_ranges](#input\_authorized\_ip\_ranges)

Description: authorized ip ranges

Type: `list(string)`

Default: `null`

### <a name="input_auto_scaler_profile"></a> [auto\_scaler\_profile](#input\_auto\_scaler\_profile)

Description: The Auto Scaler Profile configuration for the Kubernetes Cluster.

- `balance_similar_node_groups` - (Optional) Detect similar node groups and balance the number of nodes between them. Defaults to false.
- `expander` - (Optional) Expander to use. Possible values are least-waste, priority, most-pods and random. Defaults to random.
- `max_graceful_termination_sec` - (Optional) Maximum number of seconds the cluster autoscaler waits for pod termination when trying to scale down a node. Defaults to 600.
- `max_node_provisioning_time` - (Optional) Maximum time the autoscaler waits for a node to be provisioned. Defaults to 15m.
- `max_unready_nodes` - (Optional) Maximum Number of allowed unready nodes. Defaults to 3.
- `max_unready_percentage` - (Optional) Maximum percentage of unready nodes the cluster autoscaler will stop if the percentage is exceeded. Defaults to 45.
- `new_pod_scale_up_delay` - (Optional) For scenarios like burst/batch scale where you don't want CA to act before the kubernetes scheduler could schedule all the pods, you can tell CA to ignore unscheduled pods before they're a certain age. Defaults to 10s.
- `scale_down_delay_after_add` - (Optional) How long after the scale up of AKS nodes the scale down evaluation resumes. Defaults to 10m.
- `scale_down_delay_after_delete` - (Optional) How long after node deletion that scale down evaluation resumes. Defaults to the value used for scan\_interval.
- `scale_down_delay_after_failure` - (Optional) How long after scale down failure that scale down evaluation resumes. Defaults to 3m.
- `scan_interval` - (Optional) How often the AKS Cluster should be re-evaluated for scale up/down. Defaults to 10s.
- `scale_down_unneeded` - (Optional) How long a node should be unneeded before it is eligible for scale down. Defaults to 10m.
- `scale_down_unready` - (Optional) How long an unready node should be unneeded before it is eligible for scale down. Defaults to 20m.
- `scale_down_utilization_threshold` - (Optional) Node utilization level, defined as sum of requested resources divided by capacity, below which a node can be considered for scale down. Defaults to 0.5.
- `empty_bulk_delete_max` - (Optional) Maximum number of empty nodes that can be deleted at the same time. Defaults to 10.
- `skip_nodes_with_local_storage` - (Optional) If true cluster autoscaler will never delete nodes with pods with local storage, for example, EmptyDir or HostPath. Defaults to true.
- `skip_nodes_with_system_pods` - (Optional) If true cluster autoscaler will never delete nodes with pods from kube-system (except for DaemonSet or mirror pods). Defaults to true.

Type:

```hcl
object({
    balance_similar_node_groups      = optional(bool, false)
    expander                         = optional(string, "random")
    max_graceful_termination_sec     = optional(number, 600)
    max_node_provisioning_time       = optional(string, "20m")
    max_unready_nodes                = optional(number, 3)
    max_unready_percentage           = optional(number, 45)
    new_pod_scale_up_delay           = optional(string, "10s")
    scale_down_delay_after_add       = optional(string, "10m")
    scale_down_delay_after_delete    = optional(string, "10s")
    scale_down_delay_after_failure   = optional(string, "3m")
    scan_interval                    = optional(string, "10s")
    scale_down_unneeded              = optional(string, "10m")
    scale_down_unready               = optional(string, "20m")
    scale_down_utilization_threshold = optional(string, "0.5")
    empty_bulk_delete_max            = optional(number, 10)
    skip_nodes_with_local_storage    = optional(bool, true)
    skip_nodes_with_system_pods      = optional(bool, true)
  })
```

Default:

```json
{
  "balance_similar_node_groups": false
}
```

### <a name="input_automatic_channel_upgrade"></a> [automatic\_channel\_upgrade](#input\_automatic\_channel\_upgrade)

Description: should automatic updates be applied

Type: `string`

Default: `"patch"`

### <a name="input_automatic_upgrade_channel"></a> [automatic\_upgrade\_channel](#input\_automatic\_upgrade\_channel)

Description: (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to stable.

Type: `string`

Default: `"stable"`

### <a name="input_certificate_authority"></a> [certificate\_authority](#input\_certificate\_authority)

Description: A certificate\_authority. When this property is specified, key\_vault\_secrets\_provider is also required to be set. This configuration allows you to bring your own root certificate and keys for Istio CA in the Istio-based service mesh add-on for Azure Kubernetes Service.

- `key_vault_id` - The ID of the Key Vault where the root certificate and keys are stored.
- `root_cert_object_name` - The name of the root certificate object in the Key Vault.
- `cert_chain_object_name` - The name of the certificate chain object in the Key Vault.
- `cert_object_name` - The name of the certificate object in the Key Vault.
- `key_object_name` - The name of the key object in the Key Vault.

Type:

```hcl
object({
    key_vault_id           = string
    root_cert_object_name  = string
    cert_chain_object_name = string
    cert_object_name       = string
    key_object_name        = string
  })
```

Default: `null`

### <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation)

Description: can only be sharedcosts or chargeback

Type: `string`

Default: `null`

### <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager)

Description: The app owner manager responsible for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech)

Description: The app owner responsible for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner)

Description: The budget owner responsible for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter)

Description: The cost center code for resources. Used for tagging and naming purposes.

Type: `string`

Default: `""`

### <a name="input_costDivision"></a> [costDivision](#input\_costDivision)

Description: cost division

Type: `string`

Default: `null`

### <a name="input_costVP"></a> [costVP](#input\_costVP)

Description: The cost vp for resources. Used for tagging purposes.

Type: `string`

Default: `""`

### <a name="input_cost_analysis_enabled"></a> [cost\_analysis\_enabled](#input\_cost\_analysis\_enabled)

Description: (Optional) Should cost analysis be enabled for this Kubernetes Cluster? Defaults to false. The sku\_tier must be set to Standard or Premium to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal.

Type: `bool`

Default: `true`

### <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline)

Description: year resource created

Type: `string`

Default: `""`

### <a name="input_defaultIngressControllerType"></a> [defaultIngressControllerType](#input\_defaultIngressControllerType)

Description: Ingress type for the default NginxIngressController custom resource. It will be ignored if `webApplicationRoutingEnabled` is set to `false`.

Type: `string`

Default: `"Internal"`

### <a name="input_default_node_pool"></a> [default\_node\_pool](#input\_default\_node\_pool)

Description: DEPRECATED: a default node pool block

Type: `any`

Default: `null`

### <a name="input_default_node_pool_node_taints"></a> [default\_node\_pool\_node\_taints](#input\_default\_node\_pool\_node\_taints)

Description: DEPRECATED: the default\_node\_pools node taints

Type: `list(string)`

Default: `null`

### <a name="input_default_node_pool_os_disk_type"></a> [default\_node\_pool\_os\_disk\_type](#input\_default\_node\_pool\_os\_disk\_type)

Description: the default\_node\_pools os disk type

Type: `string`

Default: `null`

### <a name="input_default_node_pool_zones"></a> [default\_node\_pool\_zones](#input\_default\_node\_pool\_zones)

Description: the default\_node\_pools AZs

Type: `list(string)`

Default:

```json
[
  "1",
  "2",
  "3"
]
```

### <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings)

Description: A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.
- `log_categories` - (Optional) A set of log categories to send to the log analytics workspace. Defaults to `[]`.
- `log_groups` - (Optional) A set of log groups to send to the log analytics workspace. Defaults to `["allLogs"]`.
- `metric_categories` - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to `["AllMetrics"]`.
- `log_analytics_destination_type` - (Optional) The destination type for the diagnostic setting. Possible values are `Dedicated` and `AzureDiagnostics`. Defaults to `Dedicated`.
- `workspace_resource_id` - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.
- `storage_account_resource_id` - (Optional) The resource ID of the storage account to send logs and metrics to.
- `event_hub_authorization_rule_resource_id` - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.
- `event_hub_name` - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.
- `marketplace_partner_resource_id` - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.

Type:

```hcl
map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), ["kube-apiserver", "kube-controller-manager", "kube-scheduler", "cluster-autoscaler"])
    log_groups                               = optional(set(string), [])
    metric_categories                        = optional(list(map(string)), [{ category = "AllMetrics", enabled = true }])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_dns_resource_group_name"></a> [dns\_resource\_group\_name](#input\_dns\_resource\_group\_name)

Description: DEPRECATED: resource group for the dns private zones

Type: `string`

Default: `"rg-dns_infrastructure"`

### <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights)

Description: boolean to enable or disable the container insights

Type: `bool`

Default: `false`

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_external_ingress_gateway_enabled"></a> [external\_ingress\_gateway\_enabled](#input\_external\_ingress\_gateway\_enabled)

Description: (Optional) Is Istio External Ingress Gateway enabled?

Type: `bool`

Default: `false`

### <a name="input_flux_extension_configuration"></a> [flux\_extension\_configuration](#input\_flux\_extension\_configuration)

Description: The Flux Extension configuration for the Kubernetes Cluster.

- `enabled` - Specifies whether the Flux Extension should be enabled for the cluster. Defaults to false.
- `name` - (Optional) The name of the Flux Extension. One will be generated if not set, however this will not be unique if you want to create multiple Flux Extension resources.
- `release_namespace` - (Optional) The namespace where the Flux Extension should be installed. Defaults to the namespace where the Flux Extension is installed.
- `target_namespace` - (Optional) The namespace where the Flux Extension should deploy resources. Defaults to the namespace where the Flux Extension is installed.
- `release_train` - (Optional) The release train to use for the Flux Extension. Defaults to the release train used by the Flux Extension.
- `configuration_protected_settings` - (Optional) The protected settings for the Flux Extension.
- `configuration_settings` - (Optional) The settings for the Flux Extension.
- `version` - (Optional) The version of the Flux Extension.
- `configurations` - (Optional) The configurations for the Flux Extension.

Type:

```hcl
object({
    enabled                          = bool
    name                             = optional(string, null)
    release_namespace                = optional(string, null)
    target_namespace                 = optional(string, null)
    release_train                    = optional(string, null)
    configuration_protected_settings = optional(map(string), null)
    configuration_settings           = optional(map(string), null)
    version                          = optional(string, null)
    configurations                   = optional(list(map(string)), null)
  })
```

Default:

```json
{
  "enabled": false
}
```

### <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled)

Description: (Optional) Should HTTP Application Routing be enabled?

Type: `bool`

Default: `false`

### <a name="input_image_cleaner_interval_hours"></a> [image\_cleaner\_interval\_hours](#input\_image\_cleaner\_interval\_hours)

Description: the interval in hours to run the image cleaner

Type: `number`

Default: `24`

### <a name="input_ingress_application_gateway"></a> [ingress\_application\_gateway](#input\_ingress\_application\_gateway)

Description: ingress application gateway

Type:

```hcl
object({
    enabled      = bool
    gateway_id   = optional(string, null)
    gateway_name = optional(string, null)
    subnet_cidr  = optional(string, null)
    subnet_id    = optional(string, null)
  })
```

Default:

```json
{
  "enabled": false
}
```

### <a name="input_internal_ingress_gateway_enabled"></a> [internal\_ingress\_gateway\_enabled](#input\_internal\_ingress\_gateway\_enabled)

Description: (Optional) Is Istio Internal Ingress Gateway enabled?

Type: `bool`

Default: `false`

### <a name="input_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#input\_key\_vault\_secrets\_provider)

Description: The Key Vault Secrets Provider configuration for the Kubernetes Cluster.

- `secret_rotation_enabled` - Specifies whether the Key Vault Secrets Provider CSI should be enabled for the cluster. Defaults to false.
- `secret_rotation_interval` -  - (Optional) The interval to poll for secret rotation. This attribute is only set when `secret_rotation_enabled` is true. Defaults to 2m.

Type:

```hcl
object({
    secret_rotation_enabled  = bool
    secret_rotation_interval = optional(string, "2m")
  })
```

Default:

```json
{
  "secret_rotation_enabled": false
}
```

### <a name="input_kubelet_identity"></a> [kubelet\_identity](#input\_kubelet\_identity)

Description:   
The kubelet identity configuration for the Kubernetes Cluster.

- `client_id` - (Optional) The client ID of the kubelet identity.
- `client_secret` - (Optional) The client secret of the kubelet identity.
- `user_assigned_identity_id` - (Optional) The user assigned identity ID of the kubelet identity.

Note: When kubelet\_identity is enabled - The type field in the identity block must be set to UserAssigned and identity\_ids must be set.

Type:

```hcl
object({
    client_id                 = optional(string, null)
    client_secret             = optional(string, null)
    user_assigned_identity_id = optional(string, null)
  })
```

Default: `null`

### <a name="input_linux_profile"></a> [linux\_profile](#input\_linux\_profile)

Description: The Linux Profile configuration for the Kubernetes Cluster virtual machine.

- `admin_username` - The username for the Virtual Machine.
- `ssh_key` - The SSH key for the Virtual Machine.

Type:

```hcl
object({
    admin_username = optional(string, "azureuser")
    ssh_key        = optional(string, null)
  })
```

Default: `null`

### <a name="input_lock"></a> [lock](#input\_lock)

Description: The lock level to apply to the Key Vault. Default is `None`. Possible values are `None`, `CanNotDelete`, and `ReadOnly`.

Type:

```hcl
object({
    kind = string
    name = optional(string, null)
  })
```

Default: `null`

### <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window)

Description: The maintenance window configuration for the Kubernetes Cluster.

- `allowed` - (Optional) The allowed maintenance window for the Kubernetes Cluster.
  - `day` - A day in a week. Possible values are Sunday, Monday, Tuesday, Wednesday, Thursday, Friday and Saturday.
  - `hours` - An array of hour slots in a day. For example, specifying 1 will allow maintenance from 1:00am to 2:00am. Specifying 1, 2 will allow maintenance from 1:00am to 3:00m. Possible values are between 0 and 23.

- `not_allowed` - (Optional) The not allowed maintenance window for the Kubernetes Cluster.
  - `end` - The end of a time span, formatted as an RFC3339 string.
  - `start` - The start of a time span, formatted as an RFC3339 string.

Type:

```hcl
object({
    allowed = optional(set(object({
      day   = string
      hours = list(string)
    })), null)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })), null)
  })
```

Default: `null`

### <a name="input_maintenance_window_auto_upgrade"></a> [maintenance\_window\_auto\_upgrade](#input\_maintenance\_window\_auto\_upgrade)

Description: - `day_of_month` - (Optional) The day of the month for the maintenance run. Required in combination with RelativeMonthly frequency. Value between 0 and 31 (inclusive).
- `day_of_week` - (Optional) The day of the week for the maintenance run. Options are `Monday`, `Tuesday`, `Wednesday`, `Thurday`, `Friday`, `Saturday` and `Sunday`. Required in combination with weekly frequency.
- `duration` - (Required) The duration of the window for maintenance to run in hours.
- `frequency` - (Required) Frequency of maintenance. Possible options are `Weekly`, `AbsoluteMonthly` and `RelativeMonthly`.
- `interval` - (Required) The interval for maintenance runs. Depending on the frequency this interval is week or month based.
- `start_date` - (Optional) The date on which the maintenance window begins to take effect.
- `start_time` - (Optional) The time for maintenance to begin, based on the timezone determined by `utc_offset`. Format is `HH:mm`.
- `utc_offset` - (Optional) Used to determine the timezone for cluster maintenance.
- `week_index` - (Optional) The week in the month used for the maintenance run. Options are `First`, `Second`, `Third`, `Fourth`, and `Last`.

---
`not_allowed` block supports the following:
- `end` - (Required) The end of a time span, formatted as an RFC3339 string.
- `start` - (Required) The start of a time span, formatted as an RFC3339 string.

Type:

```hcl
object({
    day_of_month = optional(number)
    day_of_week  = optional(string)
    duration     = number
    frequency    = string
    interval     = number
    start_date   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    week_index   = optional(string)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
```

Default: `null`

### <a name="input_maintenance_window_node_os"></a> [maintenance\_window\_node\_os](#input\_maintenance\_window\_node\_os)

Description: - `day_of_month` -
- `day_of_week` - (Optional) The day of the week for the maintenance run. Options are `Monday`, `Tuesday`, `Wednesday`, `Thurday`, `Friday`, `Saturday` and `Sunday`. Required in combination with weekly frequency.
- `duration` - (Required) The duration of the window for maintenance to run in hours.
- `frequency` - (Required) Frequency of maintenance. Possible options are `Daily`, `Weekly`, `AbsoluteMonthly` and `RelativeMonthly`.
- `interval` - (Required) The interval for maintenance runs. Depending on the frequency this interval is week or month based.
- `start_date` - (Optional) The date on which the maintenance window begins to take effect.
- `start_time` - (Optional) The time for maintenance to begin, based on the timezone determined by `utc_offset`. Format is `HH:mm`.
- `utc_offset` - (Optional) Used to determine the timezone for cluster maintenance.
- `week_index` - (Optional) The week in the month used for the maintenance run. Options are `First`, `Second`, `Third`, `Fourth`, and `Last`.

---
`not_allowed` block supports the following:
- `end` - (Required) The end of a time span, formatted as an RFC3339 string.
- `start` - (Required) The start of a time span, formatted as an RFC3339 string.

Type:

```hcl
object({
    day_of_month = optional(number)
    day_of_week  = optional(string)
    duration     = number
    frequency    = string
    interval     = number
    start_date   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    week_index   = optional(string)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
```

Default: `null`

### <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities)

Description: An object that sets the managed identity configuration for the virtual machine being deployed. Be aware that capabilities such as the Azure Monitor Agent and Role Assignments require that a managed identity has been configured.

- `system_assigned`            = (Optional) Specifies whether the System Assigned Managed Identity should be enabled.  Defaults to false.
- `user_assigned_resource_ids` = (Optional) Specifies a set of User Assigned Managed Identity IDs to be assigned to this Virtual Machine.

Example Inputs:
```hcl
#default system managed identity
managed_identities = {
  system_assigned = true
}
#user assigned managed identity only
managed_identities           = {
  user_assigned_resource_ids = ["<azure resource ID of a user assigned managed identity>"]
}
#user assigned and system assigned managed identities
managed_identities  = {
  system_assigned            = true
  user_assigned_resource_ids = ["<azure resource ID of a user assigned managed identity>"]
}
```

Type:

```hcl
object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
```

Default: `{}`

### <a name="input_mgmt_sub_id"></a> [mgmt\_sub\_id](#input\_mgmt\_sub\_id)

Description: the mgmt subcription id for where the private dns zones reside

Type: `string`

Default: `"000bdcc8-114c-418a-ad9d-a1ac486ac658"`

### <a name="input_microsoft_defender"></a> [microsoft\_defender](#input\_microsoft\_defender)

Description: The Microsoft Defender configuration for the Kubernetes Cluster.

- `enabled` - (Optional) Specifies whether Microsoft Defender should be enabled for the cluster. Defaults to false.
- `log_analytics_workspace_id ` - (Optional) The ID of the Log Analytics workspace to send Microsoft Defender logs to.

Type:

```hcl
object({
    enabled                    = optional(bool, false)
    log_analytics_workspace_id = optional(string, null)
  })
```

Default:

```json
{
  "enabled": false
}
```

### <a name="input_monitoring_workspace_id"></a> [monitoring\_workspace\_id](#input\_monitoring\_workspace\_id)

Description: value of the monitoring workspace id for the OMS agent

Type: `string`

Default: `null`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

Default: `null`

### <a name="input_network_profile"></a> [network\_profile](#input\_network\_profile)

Description:   The network profile configuration for the Kubernetes Cluster.

  - `network_plugin` - (Optional) The network plugin used for the Kubernetes Cluster. Possible values are `azure` and `kubenet`. Defaults to `kubenet`.
  - `network_policy` - (Optional) The network policy used for the Kubernetes Cluster. Possible values are `azure` and `calico`. Defaults to `calico`.
  - `dns_service_ip` - The IP address assigned to the Kubernetes DNS service.
  - `service_cidr` - The Network Range used by the Kubernetes service.
  - `load_balancer_sku` - (Optional) The SKU of the Load Balancer used for the Kubernetes Cluster. Possible values are `standard` and `basic`. Defaults to `standard`.
  - `load_balancer_profile` - (Optional) The Load Balancer Profile configuration for the Kubernetes Cluster.
    - `backend_pool_type` - (Optional) The type of the backend pool. Possible values are `NodeIPConfiguration` and `VirtualNetwork`. Defaults to `NodeIPConfiguration`.
    - `managed_outbound_ip_count` - (Optional) The number of managed outbound IPs to use with the Load Balancer. Defaults to 1.
  - `pod_cidr` - The Network Range used by the Kubernetes Pods.
  - `outbound_type` - (Optional) The outbound (egress) traffic configuration for the Kubernetes Cluster. Possible values are `loadBalancer` and `userDefinedRouting`. Defaults to `userDefinedRouting`.
  - `network_data_plane` - (Optional) The network data plane used for the Kubernetes Cluster. Possible values are `azure` and `cilium`. Defaults to `azure`.
  - `network_plugin_mode` - (Optional) Specifies the network plugin mode used for building the Kubernetes network. Possible value is overlay. Defaults to `overlay`.

Type:

```hcl
object({
    network_plugin    = optional(string, "azure")
    network_policy    = optional(string, "azure")
    dns_service_ip    = optional(string, "10.199.96.10")
    service_cidr      = optional(string, "10.199.96.0/19")
    load_balancer_sku = optional(string, "standard")
    load_balancer_profile = optional(object({
      backend_pool_type         = optional(string, null)
      managed_outbound_ip_count = optional(number, null)
    }), null)
    pod_cidr            = optional(string, "10.199.64.0/19")
    outbound_type       = optional(string, "loadBalancer")
    network_data_plane  = optional(string, "azure")
    network_plugin_mode = optional(string, "overlay")
  })
```

Default:

```json
{
  "dns_service_ip": "10.199.96.10",
  "pod_cidr": "10.199.64.0/19",
  "service_cidr": "10.199.96.0/19"
}
```

### <a name="input_node_os_upgrade_channel"></a> [node\_os\_upgrade\_channel](#input\_node\_os\_upgrade\_channel)

Description: - (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are Unmanaged, SecurityPatch, NodeImage and None. Defaults to Unmanaged.

Type: `string`

Default: `"Unmanaged"`

### <a name="input_node_resource_group"></a> [node\_resource\_group](#input\_node\_resource\_group)

Description: (Optional) The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created.

Type: `string`

Default: `null`

### <a name="input_oidc_issuer_enabled"></a> [oidc\_issuer\_enabled](#input\_oidc\_issuer\_enabled)

Description: (Optional) Enable or Disable the OIDC issuer URL

Type: `bool`

Default: `true`

### <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled)

Description: boolean to enable or disable the OMS agent

Type: `bool`

Default: `false`

### <a name="input_oms_agent_use_aad_auth"></a> [oms\_agent\_use\_aad\_auth](#input\_oms\_agent\_use\_aad\_auth)

Description: Use AAD authentication for the OMS agent (Bicep Compatibility)

Type: `bool`

Default: `false`

### <a name="input_primary_node_pools"></a> [primary\_node\_pools](#input\_primary\_node\_pools)

Description: A map of node pools that need to be created and attached on the Kubernetes cluster. The key of the map can be the name of the node pool, and the key must be static string. The value of the map is a `node_pool` block as defined below:  
map(object({  
  node\_count                    = (Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` (inclusive) for user pools and between `1` and `1000` (inclusive) for system pools and must be a value in the range `min_count` - `max_count`.  
  vm\_size                       = (Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created.  
  host\_group\_id                 = (Optional) The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from. Changing this forces a new resource to be created.  
  capacity\_reservation\_group\_id = (Optional) Specifies the ID of the Capacity Reservation Group where this Node Pool should exist. Changing this forces a new resource to be created.  
  enable\_auto\_scaling           = (Optional) Whether to enable [auto-scaler](https://docs.microsoft.com/azure/aks/cluster-autoscaler).  
  enable\_host\_encryption        = (Optional) Should the nodes in this Node Pool have host encryption enabled? Changing this forces a new resource to be created.  
  enable\_node\_public\_ip         = (Optional) Should each node have a Public IP Address? Changing this forces a new resource to be created.  
  eviction\_policy               = (Optional) The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. Possible values are `Deallocate` and `Delete`. Changing this forces a new resource to be created. An Eviction Policy can only be configured when `priority` is set to `Spot` and will default to `Delete` unless otherwise specified.  
  gpu\_instance                  = (Optional) Specifies the GPU MIG instance profile for supported GPU VM SKU. The allowed values are `MIG1g`, `MIG2g`, `MIG3g`, `MIG4g` and `MIG7g`. Changing this forces a new resource to be created.  
  fips\_enabled       = (Optional) Should the nodes in this Node Pool have Federal Information Processing Standard enabled? Changing this forces a new resource to be created. FIPS support is in Public Preview - more information and details on how to opt into the Preview can be found in [this article](https://docs.microsoft.com/azure/aks/use-multiple-node-pools#add-a-fips-enabled-node-pool-preview).  
  kubelet\_disk\_type  = (Optional) The type of disk used by kubelet. Possible values are `OS` and `Temporary`.  
  max\_count          = (Optional) The maximum number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` and must be greater than or equal to `min_count`.  
  max\_pods           = (Optional) The minimum number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` and must be less than or equal to `max_count`.  
  min\_count          = (Optional) The minimum number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` and must be less than or equal to `max_count`.  
  node\_labels                  = (Optional) A map of Kubernetes labels which should be applied to nodes in this Node Pool.  
  node\_public\_ip\_prefix\_id     = (Optional) Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool. `enable_node_public_ip` should be `true`. Changing this forces a new resource to be created.  
  node\_taints                  = (Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g `key=value:NoSchedule`). Changing this forces a new resource to be created.  
  os\_disk\_size\_gb              = (Optional) The Agent Operating System disk size in GB. Changing this forces a new resource to be created.  
  os\_disk\_type                 = (Optional) The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. Changing this forces a new resource to be created.  
  os\_sku                       = (Optional) Specifies the OS SKU used by the agent pool. Possible values include: `Ubuntu`, `CBLMariner`, `Mariner`, `Windows2019`, `Windows2022`. If not specified, the default is `Ubuntu` if OSType=Linux or `Windows2019` if OSType=Windows. And the default Windows OSSKU will be changed to `Windows2022` after Windows2019 is deprecated. Changing this forces a new resource to be created.  
  os\_type                      = (Optional) The Operating System which should be used for this Node Pool. Changing this forces a new resource to be created. Possible values are `Linux` and `Windows`. Defaults to `Linux`.  
  pod\_subnet\_id                = (Optional) The ID of the Subnet where the pods in the Node Pool should exist. Changing this forces a new resource to be created.  
  priority                     = (Optional) The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are `Regular` and `Spot`. Defaults to `Regular`. Changing this forces a new resource to be created.  
  proximity\_placement\_group\_id = (Optional) The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed. Changing this forces a new resource to be created. When setting `priority` to Spot - you must configure an `eviction_policy`, `spot_max_price` and add the applicable `node_labels` and `node_taints` [as per the Azure Documentation](https://docs.microsoft.com/azure/aks/spot-node-pool).  
  spot\_max\_price               = (Optional) The maximum price you're willing to pay in USD per Virtual Machine. Valid values are `-1` (the current on-demand price for a Virtual Machine) or a positive value with up to five decimal places. Changing this forces a new resource to be created. This field can only be configured when `priority` is set to `Spot`.  
  scale\_down\_mode              = (Optional) Specifies how the node pool should deal with scaled-down nodes. Allowed values are `Delete` and `Deallocate`. Defaults to `Delete`.  
  type = Optional. The type of the agent pool. Possible values are `VirtualMachineScaleSets` and `AvailabilitySet`. Defaults to `VirtualMachineScaleSets`. Changing this forces a new resource to be created.  
  ultra\_ssd\_enabled            = (Optional) Used to specify whether the UltraSSD is enabled in the Node Pool. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/use-ultra-disks) for more information. Changing this forces a new resource to be created.  
  vnet\_subnet\_id               = (Optional) The ID of the Subnet where this Node Pool should exist. Changing this forces a new resource to be created. A route table must be configured on this Subnet.  
  zones            = (Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster Node Pool should be located. Changing this forces a new Kubernetes Cluster Node Pool to be created.
}))

Type:

```hcl
map(object({
    node_count                    = optional(number, 3)
    vm_size                       = optional(string, "Standard_D2S_v3")
    host_group_id                 = optional(string, null)
    capacity_reservation_group_id = optional(string, null)
    enable_auto_scaling           = optional(bool, true)
    enable_host_encryption        = optional(bool, false)
    eviction_policy               = optional(string, "Delete")
    enable_node_public_ip         = optional(bool, false)
    gpu_instance                  = optional(string, null)
    fips_enabled                  = optional(bool, false)
    kubelet_disk_type             = optional(string, null)
    max_count                     = optional(number, 3)
    max_pods                      = optional(number, 110)
    min_count                     = optional(number, 2)
    node_labels                   = optional(map(string), null)
    node_public_ip_prefix_id      = optional(string, null)
    node_taints                   = optional(list(string), ["CriticalAddonsOnly=true:NoSchedule"])
    os_disk_size_gb               = optional(number, 128)
    os_disk_type                  = optional(string, "Managed")
    os_sku                        = optional(string, "Ubuntu")
    os_type                       = optional(string, "Linux")
    pod_subnet_id                 = optional(string, null)
    priority                      = optional(string, "Regular")
    proximity_placement_group_id  = optional(string, null)
    spot_max_price                = optional(number, null)
    scale_down_mode               = optional(string, "Delete")
    scale_set_eviction_policy     = optional(string, "Delete")
    type                          = optional(string, "VirtualMachineScaleSets")
    ultra_ssd_enabled             = optional(bool, false)
    max_surge                     = optional(string, "33%")
    zones                         = optional(set(number), [1, 2, 3])
  }))
```

Default:

```json
{
  "systempool": {
    "enable_auto_scaling": true,
    "enable_host_encryption": false,
    "enable_node_public_ip": false,
    "eviction_policy": "Delete",
    "fips_enabled": false,
    "max_count": 3,
    "max_pods": 110,
    "min_count": 2,
    "node_count": 3,
    "node_taints": [
      "CriticalAddonsOnly=true:NoSchedule"
    ],
    "os_disk_size_gb": 128,
    "os_disk_type": "Managed",
    "os_type": "Linux",
    "vm_size": "Standard_D2S_v3"
  }
}
```

### <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id)

Description: id of the private dns zone to add the a record to

Type: `string`

Default: `"System"`

### <a name="input_rbac_enabled"></a> [rbac\_enabled](#input\_rbac\_enabled)

Description: DEPRECATED: boolean to enable or disable role-based access control

Type: `bool`

Default: `null`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description: A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - The condition which will be used to scope the role assignment.
- `condition_version` - The version of the condition syntax. If you are using a condition, valid values are '2.0'.
- `name` - (optional) The name of the role assignment.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

Type:

```hcl
map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    name                                   = optional(string, null)
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_service_mesh_profile"></a> [service\_mesh\_profile](#input\_service\_mesh\_profile)

Description: The Service Mesh Profile configuration for the Kubernetes Cluster.
- `mode` - (Optional) The mode of the service mesh. Possible value is Istio.
- `revision` - (Required) Specify 1 or 2 Istio control plane revisions for managing minor upgrades using the canary upgrade process. For example, create the resource with revisions set to ["asm-1-20"], or leave it empty (the revisions will only be known after apply). To start the canary upgrade, change revisions to ["asm-1-20", "asm-1-21"]. To roll back the canary upgrade, revert to ["asm-1-20"]. To confirm the upgrade, change to ["asm-1-21"].

Type:

```hcl
object({
    mode     = string
    revision = string
  })
```

Default: `null`

### <a name="input_storage_profile"></a> [storage\_profile](#input\_storage\_profile)

Description: The Storage Profile configuration for the Kubernetes Cluster.

- `blob_driver_enabled` - (Optional) Specifies whether the Blob CSI driver should be enabled for the cluster. Defaults to false.
- `file_driver_enabled` - (Optional) Specifies whether the File CSI driver should be enabled for the cluster. Defaults to true.
- `disk_driver_enabled` - (Optional) Specifies whether the Disk CSI driver should be enabled for the cluster. Defaults to true.
- `snapshot_controller_enabled` - (Optional) Specifies whether the Snapshot controllerr should be enabled for the cluster. Defaults to true.

Type:

```hcl
object({
    blob_driver_enabled         = optional(bool, false)
    file_driver_enabled         = optional(bool, true)
    disk_driver_enabled         = optional(bool, true)
    snapshot_controller_enabled = optional(bool, true)
  })
```

Default:

```json
{
  "blob_driver_enabled": false
}
```

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The subscription id for the aks cluster

Type: `string`

Default: `null`

### <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id)

Description: tenant id where the subscription to deploy the aks cluster is

Type: `string`

Default: `"72b17115-9915-42c0-9f1b-4f98e5a4bcd2"`

### <a name="input_upgrade_settings"></a> [upgrade\_settings](#input\_upgrade\_settings)

Description: ::warning:: DEPRECATED: variables defining the AKS upgrade settings config

Type:

```hcl
object({
    max_surge = string
  })
```

Default: `null`

### <a name="input_web_app_routing_enabled"></a> [web\_app\_routing\_enabled](#input\_web\_app\_routing\_enabled)

Description: (Optional). Specifies whether the webApplicationRoutingEnabled add-on is enabled or not.

Type: `bool`

Default: `false`

### <a name="input_workload_autoscaler_profile"></a> [workload\_autoscaler\_profile](#input\_workload\_autoscaler\_profile)

Description: The Workload Autoscaler Profile configuration for the Kubernetes Cluster.
- `keda_enabled` - "Optional. Enables Kubernetes Event-driven Autoscaling (KEDA). Defaults to false.
- `vertical_pod_autoscaler_enabled` - "Optional. Enables Kubernetes Vertical Pod Autoscaler (VPA). Defaults to  false. (currently this value is not supported and will be available in the future)

Type:

```hcl
object({
    keda_enabled                    = optional(bool, false)
    vertical_pod_autoscaler_enabled = optional(bool, false)
  })
```

Default:

```json
{
  "keda_enabled": false,
  "vertical_pod_autoscaler_enabled": false
}
```

### <a name="input_workload_identity_enabled"></a> [workload\_identity\_enabled](#input\_workload\_identity\_enabled)

Description: (Optional) Specifies whether Azure AD Workload Identity should be enabled for the Cluster. Defaults to false.

Type: `bool`

Default: `true`

## Outputs

The following outputs are exported:

### <a name="output_aks_arm"></a> [aks\_arm](#output\_aks\_arm)

Description: n/a

### <a name="output_aks_spn"></a> [aks\_spn](#output\_aks\_spn)

Description: n/a
<!-- END_TF_DOCS -->