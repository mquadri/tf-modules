## Naming and Tags ##
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appid" {
  condition = var.appid != null
  summary   = "WARNING: Deprecation Notice, appid is not loger used, please remove this variable from your configuration"
}


variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

resource "validation_warning" "env" {
  condition = var.env != null
  summary   = "WARNING: Deprecation Notice, env is not loger used, please remove this variable from your configuration and use environment"
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costCostCenter" {
  condition = var.costCostCenter != null
  summary   = "WARNING: Deprecation Notice, costCostCenter is not loger used, please remove this variable from your configuration"
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costVP" {
  condition = var.costVP != null
  summary   = "WARNING: Deprecation Notice, costVP is not loger used, please remove this variable from your configuration"
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerTech" {
  condition = var.costAppOwnerTech != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerTech is not loger used, please remove this variable from your configuration"
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerManager" {
  condition = var.costAppOwnerManager != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerManager is not loger used, please remove this variable from your configuration"
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costBudgetOwner" {
  condition = var.costBudgetOwner != null
  summary   = "WARNING: Deprecation Notice, costBudgetOwner is not loger used, please remove this variable from your configuration"
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costbaseline" {
  condition = var.costbaseline != null
  summary   = "WARNING: Deprecation Notice, costbaseline is not loger used, please remove this variable from your configuration"
}

variable "resourcetype" {
  description = "resource type -- 3 letters"
  type        = string
}

variable "costDivision" {
  description = "cost division"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costDivision" {
  condition = var.costDivision != null
  summary   = "WARNING: Deprecation Notice, costDivision is not loger used, please remove this variable from your configuration"
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAllocation" {
  condition = var.costAllocation != null
  summary   = "WARNING: Deprecation Notice, costAllocation is not loger used, please remove this variable from your configuration"
}

variable "appFunction" {
  description = "app function"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appFunction" {
  condition = var.appFunction != null
  summary   = "WARNING: Deprecation Notice, appFunction is not loger used, please remove this variable from your configuration"
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "monthlyBudget" {
  condition = var.monthlyBudget != null
  summary   = "WARNING: Deprecation Notice, monthlyBudget is not loger used, please remove this variable from your configuration"
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
}

#aks vars
variable "vnet_subnet_id" {
  description = "the subnet ID of the node pool"
  type        = string
}

variable "admin_group_object_ids" {
  description = "this should only ever be assigned to groups that do not include users"
  type        = string
}

variable "rbac_enabled" {
  default     = null
  type        = bool
  description = "DEPRECATED: boolean to enable or disable role-based access control"
}

resource "validation_warning" "rbac_enabled" {
  condition = var.rbac_enabled != null
  summary   = "WARNING: Deprecation Notice, rbac_enabled is not loger used, please remove this variable from your configuration"
}

variable "tenant_id" {
  description = "tenant id where the subscription to deploy the aks cluster is"
  default     = "72b17115-9915-42c0-9f1b-4f98e5a4bcd2"
  nullable    = false
  type        = string
}

variable "dns_resource_group_name" {
  description = "DEPRECATED: resource group for the dns private zones"
  default     = "rg-dns_infrastructure"
  type        = string
}

resource "validation_warning" "dns_resource_group_name" {
  condition = var.dns_resource_group_name != null
  summary   = "WARNING: Deprecation Notice, dns_resource_group_name is not loger used, please remove this variable from your configuration"
}

variable "resource_group_name" {
  description = "the name of the resourcegroup to deploy the aks cluster to"
  type        = string
}

variable "kubernetes_version" {
  description = "version of kubernetes to deploy"
  type        = string
}

variable "automatic_channel_upgrade" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to stable."
  type        = string
  default     = "stable"
  validation {
    condition     = contains(["none", "patch", "rapid", "node-image", "stable"], var.automatic_channel_upgrade)
    error_message = "The automatic upgrade channel must be one of the following values: none, patch, rapid, node-image and stable"
  }
}

variable "private_dns_zone_id" {
  type        = string
  description = "id of the private dns zone to add the a record to"
  default     = "System"
}

variable "upgrade_settings" {
  description = "::warning:: DEPRECATED: variables defining the AKS upgrade settings config"
  type = object({
    max_surge = string
  })
  default = null
}

resource "validation_warning" "upgrade_settings" {
  condition = var.upgrade_settings != null
  summary   = "WARNING: Deprecation Notice, upgrade_settings and is used inside the nodes definitions is not loger used, please remove this variable from your configuration"
}

variable "network_profile" {

  type = object({
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
  default = {
    dns_service_ip = "10.199.96.10"
    service_cidr   = "10.199.96.0/19"
    pod_cidr       = "10.199.64.0/19"
  }
  description = <<NETWORK_PROFILE
  The network profile configuration for the Kubernetes Cluster.

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
  NETWORK_PROFILE

  validation {
    condition     = contains(["azure", "kubenet"], var.network_profile.network_plugin)
    error_message = "network_plugin must be one of: 'azure', 'kubenet'."
  }

  validation {
    condition     = contains(["azure", "calico", "cilium"], var.network_profile.network_policy)
    error_message = "network_policy must be one of: 'azure', 'calico'."
  }

  validation {
    condition     = contains(["standard", "basic"], var.network_profile.load_balancer_sku)
    error_message = "load_balancer_sku must be one of: 'standard', 'basic'."
  }

  validation {
    condition     = var.network_profile.network_policy == "azure" ? var.network_profile.network_plugin == "azure" : true
    error_message = "When network_policy is set to azure, the network_plugin field can only be set to azure."
  }

  validation {
    condition     = var.network_profile.network_policy == "cilium" ? var.network_profile.network_data_plane == "cilium" : true
    error_message = "When network_policy is set to cilium, the network_data_plane field must be set to cilium."
  }


}

resource "validation_warning" "ips_out_of_non_route" {
  condition = !(contains(["10.199.96.0/19", "10.199.64.0/19"], var.network_profile.service_cidr) || contains(["10.199.96.0/19", "10.199.64.0/19"], var.network_profile.pod_cidr))
  summary   = <<VALIDATION_WARNING
  WARNING: The service_cidr and pod_cidr are not in the non-routable IP address space. This may cause issues with routing and connectivity with on prem services.
  VALIDATION_WARNING
}

variable "default_node_pool" {
  description = "DEPRECATED: a default node pool block"
  type        = any
  default     = null
}

resource "validation_warning" "default_node_pool" {
  condition = var.default_node_pool != null
  summary   = "WARNING: Deprecation Notice, default_node_pool is not loger used, please remove this variable from your configuration"
}

variable "default_node_pool_zones" {
  description = "the default_node_pools AZs"
  type        = list(string)
  default     = ["1", "2", "3"]
}

resource "validation_warning" "default_node_pool_zones" {
  condition = var.default_node_pool_zones != null
  summary   = "WARNING: Deprecation Notice, default_node_pool_zones is not loger used, please remove this variable from your configuration"
}

variable "default_node_pool_node_taints" {
  description = "DEPRECATED: the default_node_pools node taints"
  type        = list(string)
  default     = null
}
resource "validation_warning" "default_node_pool_node_taints" {
  condition = var.default_node_pool_node_taints != null
  summary   = "WARNING: Deprecation Notice, default_node_pool_node_taints is not loger used, please remove this variable from your configuration"
}

variable "mgmt_sub_id" {
  description = "the mgmt subcription id for where the private dns zones reside"
  default     = "000bdcc8-114c-418a-ad9d-a1ac486ac658"
  type        = string
}

variable "aks_private_dns_name" {
  description = "DEPRECATED: private dns zone name"
  default     = "privatelink.azure.com"
  type        = string
}

resource "validation_warning" "aks_private_dns_name" {
  condition = var.aks_private_dns_name != "privatelink.azure.com"
  summary   = "WARNING: Deprecation Notice, aks_private_dns_name is not loger used, please remove this variable from your configuration"
}

variable "aks_vnet_subnet_name" {
  description = "aks subnet name where aks will be deployed"
  type        = string
}

variable "network_resource_group_name" {
  description = "resource group where vnet/subnet aks will be deployed to."
  type        = string
}

variable "aks_vnet_name" {
  description = "aks vnet name where aks will be deployed"
  type        = string
}

variable "additional_node_pools" {
  type = map(object({
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
  description = <<NODE_POOLS
  Additional node pools to be added to the cluster. Each node pool is defined as a map of objects with the following keys:

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

  NODE_POOLS

  default = {}
  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : v.os_disk_type != null ? contains(["Ephemeral", "Managed"], v.os_disk_type) : true]) : true
    error_message = "os_disk_type must be one of: 'Ephemeral', 'Managed'."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : v.kubelet_disk_type != null ? contains(["OS", "Temporary"], v.kubelet_disk_type) : true]) : true
    error_message = "kubelet_disk_type must be one of: 'OS', 'Temporary'."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : contains(["VirtualMachineScaleSets", "AvailabilitySet"], v.type)]) : true
    error_message = "type must be one of: 'VirtualMachineScaleSets', 'AvailabilitySet'."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : v.node_public_ip_prefix_id != null ? alltrue(v.node_public_ip_prefix_id != null, v.enable_node_public_ip) : true]) : true
    error_message = "enable_node_public_ip must be true if node_public_ip_prefix_id is set."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : contains(["Ubuntu", "Windows2019", "Windows2022", "AzureLinux"], v.os_sku)]) : true
    error_message = "os_sku must be one of: 'Ubuntu', 'Windows2019', 'Windows2022', 'AzureLinux'."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : contains(["Linux", "Windows"], v.os_type)]) : true
    error_message = "os_type must be one of: 'Linux', 'Windows'."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : contains(["Delete", "Deallocate"], v.scale_down_mode)]) : true
    error_message = "scale_down_mode must be one of: 'Delete', 'Deallocate'."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : v.eviction_policy != null ? (v.priority == "Spot" && contains(["Delete", "Deallocate"], v.eviction_policy)) : (v.priority == null ? v.piority == "Regular" : true)]) : true
    error_message = "eviction_policy must be one of: 'Delete', 'Deallocate' and only set when priority is set to 'Spot'."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : anytrue([v.priority == "Spot" && v.spot_max_price != null, v.priority == "Regular"])]) : true
    error_message = "spot_max_price must be set when priority is set to 'Spot'."
  }

  validation {
    condition     = var.additional_node_pools != {} ? alltrue([for _, v in var.additional_node_pools : v.workload_runtime != null ? contains(["OCIContainer", "WasmWasi"], v.workload_runtime) : true]) : true
    error_message = "workload_runtime must be one of: 'OCIContainer', 'WasmWasi'."
  }

}




## AVM

variable "managed_identities" {
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default     = {}
  description = <<IDENTITY
An object that sets the managed identity configuration for the virtual machine being deployed. Be aware that capabilities such as the Azure Monitor Agent and Role Assignments require that a managed identity has been configured.

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
IDENTITY
  nullable    = false
}


variable "diagnostic_settings" {
  type = map(object({
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
  default     = {}
  description = <<DESCRIPTION
A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

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
DESCRIPTION
  nullable    = false

  validation {
    condition     = alltrue([for _, v in var.diagnostic_settings : contains(["Dedicated", "AzureDiagnostics"], v.log_analytics_destination_type)])
    error_message = "Log analytics destination type must be one of: 'Dedicated', 'AzureDiagnostics'."
  }
  validation {
    condition = alltrue(
      [
        for _, v in var.diagnostic_settings :
        v.workspace_resource_id != null || v.storage_account_resource_id != null || v.event_hub_authorization_rule_resource_id != null || v.marketplace_partner_resource_id != null
      ]
    )
    error_message = "At least one of `workspace_resource_id`, `storage_account_resource_id`, `marketplace_partner_resource_id`, or `event_hub_authorization_rule_resource_id`, must be set."
  }
}


## Bicep variables

variable "monitoring_workspace_id" {
  description = "value of the monitoring workspace id for the OMS agent"
  type        = string
  nullable    = true
  default     = null
}

variable "oms_agent_enabled" {
  description = "boolean to enable or disable the OMS agent"
  type        = bool
  default     = false
}

variable "enable_container_insights" {
  description = "boolean to enable or disable the container insights"
  type        = bool
  default     = false
}

variable "linux_profile" {
  type = object({
    admin_username = optional(string, "azureuser")
    ssh_key        = optional(string, null)
  })
  default     = null
  description = <<LINUX_PROFILE
The Linux Profile configuration for the Kubernetes Cluster virtual machine.

- `admin_username` - The username for the Virtual Machine.
- `ssh_key` - The SSH key for the Virtual Machine.
LINUX_PROFILE
  nullable    = true
}

variable "aks_service_principal" {
  description = "service principal for the aks cluster"
  type = object({
    client_id     = string
    client_secret = string
  })
  default = null
}

variable "ingress_application_gateway" {
  description = "ingress application gateway"
  type = object({
    enabled      = bool
    gateway_id   = optional(string, null)
    gateway_name = optional(string, null)
    subnet_cidr  = optional(string, null)
    subnet_id    = optional(string, null)
  })

  default = {
    enabled = false
  }

  validation {
    condition     = anytrue([alltrue([var.ingress_application_gateway.enabled == true, anytrue([var.ingress_application_gateway.gateway_id != null, var.ingress_application_gateway.subnet_cidr != null, var.ingress_application_gateway.subnet_id != null]), var.ingress_application_gateway.gateway_name != null]), var.ingress_application_gateway.enabled == false])
    error_message = "If ingress_application_gateway is enabled, any of gateway_id, subnet_cidr, and subnet_id must be set and gateway_name must be set."
  }

}

variable "authorized_ip_ranges" {
  description = "authorized ip ranges"
  type        = list(string)
  default     = null
}

variable "auto_scaler_profile" {
  type = object({
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

  default = {
    balance_similar_node_groups = false
  }
  nullable    = false
  description = <<AUTO_SCALER_PROFILE
The Auto Scaler Profile configuration for the Kubernetes Cluster.


- `balance_similar_node_groups` - (Optional) Detect similar node groups and balance the number of nodes between them. Defaults to false.
- `expander` - (Optional) Expander to use. Possible values are least-waste, priority, most-pods and random. Defaults to random.
- `max_graceful_termination_sec` - (Optional) Maximum number of seconds the cluster autoscaler waits for pod termination when trying to scale down a node. Defaults to 600.
- `max_node_provisioning_time` - (Optional) Maximum time the autoscaler waits for a node to be provisioned. Defaults to 15m.
- `max_unready_nodes` - (Optional) Maximum Number of allowed unready nodes. Defaults to 3.
- `max_unready_percentage` - (Optional) Maximum percentage of unready nodes the cluster autoscaler will stop if the percentage is exceeded. Defaults to 45.
- `new_pod_scale_up_delay` - (Optional) For scenarios like burst/batch scale where you don't want CA to act before the kubernetes scheduler could schedule all the pods, you can tell CA to ignore unscheduled pods before they're a certain age. Defaults to 10s.
- `scale_down_delay_after_add` - (Optional) How long after the scale up of AKS nodes the scale down evaluation resumes. Defaults to 10m.
- `scale_down_delay_after_delete` - (Optional) How long after node deletion that scale down evaluation resumes. Defaults to the value used for scan_interval.
- `scale_down_delay_after_failure` - (Optional) How long after scale down failure that scale down evaluation resumes. Defaults to 3m.
- `scan_interval` - (Optional) How often the AKS Cluster should be re-evaluated for scale up/down. Defaults to 10s.
- `scale_down_unneeded` - (Optional) How long a node should be unneeded before it is eligible for scale down. Defaults to 10m.
- `scale_down_unready` - (Optional) How long an unready node should be unneeded before it is eligible for scale down. Defaults to 20m.
- `scale_down_utilization_threshold` - (Optional) Node utilization level, defined as sum of requested resources divided by capacity, below which a node can be considered for scale down. Defaults to 0.5.
- `empty_bulk_delete_max` - (Optional) Maximum number of empty nodes that can be deleted at the same time. Defaults to 10.
- `skip_nodes_with_local_storage` - (Optional) If true cluster autoscaler will never delete nodes with pods with local storage, for example, EmptyDir or HostPath. Defaults to true.
- `skip_nodes_with_system_pods` - (Optional) If true cluster autoscaler will never delete nodes with pods from kube-system (except for DaemonSet or mirror pods). Defaults to true.

AUTO_SCALER_PROFILE

}

variable "cost_analysis_enabled" {
  description = "(Optional) Should cost analysis be enabled for this Kubernetes Cluster? Defaults to false. The sku_tier must be set to Standard or Premium to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal."
  type        = bool
  default     = true

}

variable "microsoft_defender" {
  type = object({
    enabled                    = optional(bool, false)
    log_analytics_workspace_id = optional(string, null)
  })
  default     = { enabled = false }
  description = <<DEFENDER
The Microsoft Defender configuration for the Kubernetes Cluster.

- `enabled` - (Optional) Specifies whether Microsoft Defender should be enabled for the cluster. Defaults to false.
- `log_analytics_workspace_id ` - (Optional) The ID of the Log Analytics workspace to send Microsoft Defender logs to.
DEFENDER
}

variable "image_cleaner_interval_hours" {
  description = "the interval in hours to run the image cleaner"
  type        = number
  default     = 24
}

variable "key_vault_secrets_provider" {
  type = object({
    secret_rotation_enabled  = bool
    secret_rotation_interval = optional(string, "2m")
  })
  default = {
    secret_rotation_enabled = false
  }

  description = <<KEY_VAULT_SECRETS_PROVIDER
The Key Vault Secrets Provider configuration for the Kubernetes Cluster.

- `secret_rotation_enabled` - Specifies whether the Key Vault Secrets Provider CSI should be enabled for the cluster. Defaults to false.
- `secret_rotation_interval` -  - (Optional) The interval to poll for secret rotation. This attribute is only set when `secret_rotation_enabled` is true. Defaults to 2m.

KEY_VAULT_SECRETS_PROVIDER

}

variable "storage_profile" {
  type = object({
    blob_driver_enabled         = optional(bool, false)
    file_driver_enabled         = optional(bool, true)
    disk_driver_enabled         = optional(bool, true)
    snapshot_controller_enabled = optional(bool, true)
  })
  default = {
    blob_driver_enabled = false
  }
  description = <<STORAGE_PROFILE
The Storage Profile configuration for the Kubernetes Cluster.

- `blob_driver_enabled` - (Optional) Specifies whether the Blob CSI driver should be enabled for the cluster. Defaults to false.
- `file_driver_enabled` - (Optional) Specifies whether the File CSI driver should be enabled for the cluster. Defaults to true.
- `disk_driver_enabled` - (Optional) Specifies whether the Disk CSI driver should be enabled for the cluster. Defaults to true.
- `snapshot_controller_enabled` - (Optional) Specifies whether the Snapshot controllerr should be enabled for the cluster. Defaults to true.
STORAGE_PROFILE

}

variable "flux_extension_configuration" {
  type = object({
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
  default = {
    enabled = false
  }
  description = <<FLUX_EXTENSION_CONFIGURATION
The Flux Extension configuration for the Kubernetes Cluster.

- `enabled` - Specifies whether the Flux Extension should be enabled for the cluster. Defaults to false.
- `name` - (Optional) The name of the Flux Extension. One will be generated if not set, however this will not be unique if you want to create multiple Flux Extension resources.
- `release_namespace` - (Optional) The namespace where the Flux Extension should be installed. Defaults to the namespace where the Flux Extension is installed.
- `target_namespace` - (Optional) The namespace where the Flux Extension should deploy resources. Defaults to the namespace where the Flux Extension is installed.
- `release_train` - (Optional) The release train to use for the Flux Extension. Defaults to the release train used by the Flux Extension.
- `configuration_protected_settings` - (Optional) The protected settings for the Flux Extension.
- `configuration_settings` - (Optional) The settings for the Flux Extension.
- `version` - (Optional) The version of the Flux Extension.
- `configurations` - (Optional) The configurations for the Flux Extension.

FLUX_EXTENSION_CONFIGURATION
}

variable "http_application_routing_enabled" {
  description = "(Optional) Should HTTP Application Routing be enabled?"
  type        = bool
  default     = false
}

variable "kubelet_identity" {
  type = object({
    client_id                 = optional(string, null)
    client_secret             = optional(string, null)
    user_assigned_identity_id = optional(string, null)
  })
  default     = null
  description = <<KUBELET_IDENTITY

The kubelet identity configuration for the Kubernetes Cluster.

- `client_id` - (Optional) The client ID of the kubelet identity.
- `client_secret` - (Optional) The client secret of the kubelet identity.
- `user_assigned_identity_id` - (Optional) The user assigned identity ID of the kubelet identity.

Note: When kubelet_identity is enabled - The type field in the identity block must be set to UserAssigned and identity_ids must be set.

KUBELET_IDENTITY
}

variable "lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  default     = null
  description = "The lock level to apply to the Key Vault. Default is `None`. Possible values are `None`, `CanNotDelete`, and `ReadOnly`."

  validation {
    condition     = var.lock != null ? contains(["CanNotDelete", "ReadOnly", "None"], var.lock.kind) : true
    error_message = "Lock kind must be either `\"None\"` `\"CanNotDelete\"` or `\"ReadOnly\"`."
  }
}


variable "maintenance_window" {
  type = object({
    allowed = optional(set(object({
      day   = string
      hours = list(string)
    })), null)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })), null)
  })
  default     = null
  description = <<MAINTENANCE_WINDOW
The maintenance window configuration for the Kubernetes Cluster.

- `allowed` - (Optional) The allowed maintenance window for the Kubernetes Cluster.
  - `day` - A day in a week. Possible values are Sunday, Monday, Tuesday, Wednesday, Thursday, Friday and Saturday.
  - `hours` - An array of hour slots in a day. For example, specifying 1 will allow maintenance from 1:00am to 2:00am. Specifying 1, 2 will allow maintenance from 1:00am to 3:00m. Possible values are between 0 and 23.

- `not_allowed` - (Optional) The not allowed maintenance window for the Kubernetes Cluster.
  - `end` - The end of a time span, formatted as an RFC3339 string.
  - `start` - The start of a time span, formatted as an RFC3339 string.

MAINTENANCE_WINDOW

}

resource "validation_warning" "maintenance_window" {
  condition = var.maintenance_window != null
  summary   = "WARNING:  maintenance_window is defined by terraform but not used in bicep, we will leave for compatibility"
}

variable "default_node_pool_os_disk_type" {
  description = "the default_node_pools os disk type"
  type        = string
  default     = null
}

resource "validation_warning" "default_node_pool_os_disk_type" {
  condition = var.default_node_pool_os_disk_type != null
  summary   = "WARNING: Deprecation Notice, default_node_pool_os_disk_type is not loger used, please remove this variable from your configuration"
}



variable "role_assignments" {
  type = map(object({
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
  default     = {}
  description = <<DESCRIPTION
A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - The condition which will be used to scope the role assignment.
- `condition_version` - The version of the condition syntax. If you are using a condition, valid values are '2.0'.
- `name` - (optional) The name of the role assignment.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.
DESCRIPTION
  nullable    = false


  validation {
    condition     = alltrue([for _, v in var.role_assignments : v.role_definition_id_or_name != "Owner" && v.role_definition_id_or_name != "Contributor"])
    error_message = "The role_definition_id_or_name cannot be 'Owner' or 'Contributor'"
  }

}

variable "subscription_id" {
  description = "The subscription id for the aks cluster"
  type        = string
  default     = null
}


variable "node_resource_group" {
  description = "(Optional) The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "workload_autoscaler_profile" {
  type = object({
    keda_enabled                    = optional(bool, false)
    vertical_pod_autoscaler_enabled = optional(bool, false)
  })
  default = {
    keda_enabled                    = false
    vertical_pod_autoscaler_enabled = false
  }
  description = <<WORKLOAD_AUTOSCALER_PROFILE
The Workload Autoscaler Profile configuration for the Kubernetes Cluster.
- `keda_enabled` - "Optional. Enables Kubernetes Event-driven Autoscaling (KEDA). Defaults to false.
- `vertical_pod_autoscaler_enabled` - "Optional. Enables Kubernetes Vertical Pod Autoscaler (VPA). Defaults to  false. (currently this value is not supported and will be available in the future)
WORKLOAD_AUTOSCALER_PROFILE
}

resource "validation_warning" "workload_autoscaler_profile" {
  condition = var.workload_autoscaler_profile.vertical_pod_autoscaler_enabled
  summary   = "WARNING: This value is not supported and will be available in the future"
}

variable "workload_identity_enabled" {
  description = "(Optional) Specifies whether Azure AD Workload Identity should be enabled for the Cluster. Defaults to false."
  type        = bool
  default     = true
}

variable "oidc_issuer_enabled" {
  description = "(Optional) Enable or Disable the OIDC issuer URL"
  type        = bool
  default     = true

}

variable "web_app_routing_enabled" {
  description = "(Optional). Specifies whether the webApplicationRoutingEnabled add-on is enabled or not."
  default     = false
  type        = bool
}


# tags
variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}

variable "aad_profile_client_id" {
  description = "AAD Profile Client ID (Bicep Compatibility)"
  type        = string
  default     = null
}

variable "aad_profile_server_id" {
  description = "AAD Profile Server ID (Bicep Compatibility)"
  type        = string
  default     = null
}

variable "aad_profile_server_app_secret" {
  description = "AAD Profile Server App Secret (Bicep Compatibility)"
  type        = string
  default     = null
}

variable "node_os_upgrade_channel" {
  description = "- (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are Unmanaged, SecurityPatch, NodeImage and None. Defaults to Unmanaged."
  type        = string
  default     = "Unmanaged"
  validation {
    condition     = contains(["Unmanaged", "SecurityPatch", "NodeImage", "node-image", "None"], var.node_os_upgrade_channel)
    error_message = "The node operating system upgrade channel must be one of the following values: Unmanaged, SecurityPatch, NodeImage, node-image and None"
  }
}

variable "defaultIngressControllerType" {
  description = "Ingress type for the default NginxIngressController custom resource. It will be ignored if `webApplicationRoutingEnabled` is set to `false`."
  type        = string
  default     = "Internal"
  validation {
    condition     = contains(["AnnotationControlled", "External", "Internal", "None"], var.defaultIngressControllerType)
    error_message = "The defaultIngressControllerType must be one of the following values: AnnotationControlled, External, Internal and None"
  }
}

variable "service_mesh_profile" {
  type = object({
    mode     = string
    revision = string
  })
  default     = null
  description = <<SERVICE_MESH_PROFILE
The Service Mesh Profile configuration for the Kubernetes Cluster.
- `mode` - (Optional) The mode of the service mesh. Possible value is Istio.
- `revision` - (Required) Specify 1 or 2 Istio control plane revisions for managing minor upgrades using the canary upgrade process. For example, create the resource with revisions set to ["asm-1-20"], or leave it empty (the revisions will only be known after apply). To start the canary upgrade, change revisions to ["asm-1-20", "asm-1-21"]. To roll back the canary upgrade, revert to ["asm-1-20"]. To confirm the upgrade, change to ["asm-1-21"].
SERVICE_MESH_PROFILE
  nullable    = true
}

variable "certificate_authority" {
  type = object({
    key_vault_id           = string
    root_cert_object_name  = string
    cert_chain_object_name = string
    cert_object_name       = string
    key_object_name        = string
  })
  default     = null
  description = <<CERTIFICATE_AUTHORITY
A certificate_authority. When this property is specified, key_vault_secrets_provider is also required to be set. This configuration allows you to bring your own root certificate and keys for Istio CA in the Istio-based service mesh add-on for Azure Kubernetes Service.

- `key_vault_id` - The ID of the Key Vault where the root certificate and keys are stored.
- `root_cert_object_name` - The name of the root certificate object in the Key Vault.
- `cert_chain_object_name` - The name of the certificate chain object in the Key Vault.
- `cert_object_name` - The name of the certificate object in the Key Vault.
- `key_object_name` - The name of the key object in the Key Vault.
CERTIFICATE_AUTHORITY
  nullable    = true
}

variable "external_ingress_gateway_enabled" {
  description = "(Optional) Is Istio External Ingress Gateway enabled?"
  type        = bool
  default     = false
}

variable "internal_ingress_gateway_enabled" {
  description = "(Optional) Is Istio Internal Ingress Gateway enabled?"
  type        = bool
  default     = false
}

variable "maintenance_window_auto_upgrade" {
  type = object({
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
  default     = null
  description = <<-EOT
 - `day_of_month` - (Optional) The day of the month for the maintenance run. Required in combination with RelativeMonthly frequency. Value between 0 and 31 (inclusive).
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
EOT
}

variable "maintenance_window_node_os" {
  type = object({
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
  default     = null
  description = <<-EOT
 - `day_of_month` -
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
EOT
}

variable "oms_agent_use_aad_auth" {
  description = "Use AAD authentication for the OMS agent (Bicep Compatibility)"
  type        = bool
  default     = false

}

variable "primary_node_pools" {
  type = map(object({
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
  default = {
    systempool = {
      node_count             = 3
      vm_size                = "Standard_D2S_v3"
      enable_auto_scaling    = true
      enable_host_encryption = false
      eviction_policy        = "Delete"
      enable_node_public_ip  = false
      fips_enabled           = false
      max_count              = 3
      max_pods               = 110
      min_count              = 2
      node_taints            = ["CriticalAddonsOnly=true:NoSchedule"]
      os_disk_size_gb        = 128
      os_disk_type           = "Managed"
      os_type                = "Linux"
    }
  }
  description = <<-EOT
  A map of node pools that need to be created and attached on the Kubernetes cluster. The key of the map can be the name of the node pool, and the key must be static string. The value of the map is a `node_pool` block as defined below:
  map(object({
    node_count                    = (Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` (inclusive) for user pools and between `1` and `1000` (inclusive) for system pools and must be a value in the range `min_count` - `max_count`.
    vm_size                       = (Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created.
    host_group_id                 = (Optional) The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from. Changing this forces a new resource to be created.
    capacity_reservation_group_id = (Optional) Specifies the ID of the Capacity Reservation Group where this Node Pool should exist. Changing this forces a new resource to be created.
    enable_auto_scaling           = (Optional) Whether to enable [auto-scaler](https://docs.microsoft.com/azure/aks/cluster-autoscaler).
    enable_host_encryption        = (Optional) Should the nodes in this Node Pool have host encryption enabled? Changing this forces a new resource to be created.
    enable_node_public_ip         = (Optional) Should each node have a Public IP Address? Changing this forces a new resource to be created.
    eviction_policy               = (Optional) The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. Possible values are `Deallocate` and `Delete`. Changing this forces a new resource to be created. An Eviction Policy can only be configured when `priority` is set to `Spot` and will default to `Delete` unless otherwise specified.
    gpu_instance                  = (Optional) Specifies the GPU MIG instance profile for supported GPU VM SKU. The allowed values are `MIG1g`, `MIG2g`, `MIG3g`, `MIG4g` and `MIG7g`. Changing this forces a new resource to be created.
    fips_enabled       = (Optional) Should the nodes in this Node Pool have Federal Information Processing Standard enabled? Changing this forces a new resource to be created. FIPS support is in Public Preview - more information and details on how to opt into the Preview can be found in [this article](https://docs.microsoft.com/azure/aks/use-multiple-node-pools#add-a-fips-enabled-node-pool-preview).
    kubelet_disk_type  = (Optional) The type of disk used by kubelet. Possible values are `OS` and `Temporary`.
    max_count          = (Optional) The maximum number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` and must be greater than or equal to `min_count`.
    max_pods           = (Optional) The minimum number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` and must be less than or equal to `max_count`.
    min_count          = (Optional) The minimum number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` and must be less than or equal to `max_count`.
    node_labels                  = (Optional) A map of Kubernetes labels which should be applied to nodes in this Node Pool.
    node_public_ip_prefix_id     = (Optional) Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool. `enable_node_public_ip` should be `true`. Changing this forces a new resource to be created.
    node_taints                  = (Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g `key=value:NoSchedule`). Changing this forces a new resource to be created.
    os_disk_size_gb              = (Optional) The Agent Operating System disk size in GB. Changing this forces a new resource to be created.
    os_disk_type                 = (Optional) The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. Changing this forces a new resource to be created.
    os_sku                       = (Optional) Specifies the OS SKU used by the agent pool. Possible values include: `Ubuntu`, `CBLMariner`, `Mariner`, `Windows2019`, `Windows2022`. If not specified, the default is `Ubuntu` if OSType=Linux or `Windows2019` if OSType=Windows. And the default Windows OSSKU will be changed to `Windows2022` after Windows2019 is deprecated. Changing this forces a new resource to be created.
    os_type                      = (Optional) The Operating System which should be used for this Node Pool. Changing this forces a new resource to be created. Possible values are `Linux` and `Windows`. Defaults to `Linux`.
    pod_subnet_id                = (Optional) The ID of the Subnet where the pods in the Node Pool should exist. Changing this forces a new resource to be created.
    priority                     = (Optional) The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are `Regular` and `Spot`. Defaults to `Regular`. Changing this forces a new resource to be created.
    proximity_placement_group_id = (Optional) The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed. Changing this forces a new resource to be created. When setting `priority` to Spot - you must configure an `eviction_policy`, `spot_max_price` and add the applicable `node_labels` and `node_taints` [as per the Azure Documentation](https://docs.microsoft.com/azure/aks/spot-node-pool).
    spot_max_price               = (Optional) The maximum price you're willing to pay in USD per Virtual Machine. Valid values are `-1` (the current on-demand price for a Virtual Machine) or a positive value with up to five decimal places. Changing this forces a new resource to be created. This field can only be configured when `priority` is set to `Spot`.
    scale_down_mode              = (Optional) Specifies how the node pool should deal with scaled-down nodes. Allowed values are `Delete` and `Deallocate`. Defaults to `Delete`.
    type = Optional. The type of the agent pool. Possible values are `VirtualMachineScaleSets` and `AvailabilitySet`. Defaults to `VirtualMachineScaleSets`. Changing this forces a new resource to be created.
    ultra_ssd_enabled            = (Optional) Used to specify whether the UltraSSD is enabled in the Node Pool. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/use-ultra-disks) for more information. Changing this forces a new resource to be created.
    vnet_subnet_id               = (Optional) The ID of the Subnet where this Node Pool should exist. Changing this forces a new resource to be created. A route table must be configured on this Subnet.
    zones            = (Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster Node Pool should be located. Changing this forces a new Kubernetes Cluster Node Pool to be created.
  }))
  EOT
  nullable    = false
}