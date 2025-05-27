
variable "admin_group_object_ids" {
  description = "this should only ever be assigned to groups that do not include users"
  type        = string
}

variable "kubernetes_version" {
  description = "version of kubernetes to deploy"
  type        = string
}

variable "network_profile" {

  type = object({
    network_plugin    = optional(string, "kubenet")
    network_policy    = optional(string, "calico")
    dns_service_ip    = string
    service_cidr      = string
    load_balancer_sku = optional(string, "standard")
    load_balancer_profile = optional(object({
      backend_pool_type         = optional(string, null)
      managed_outbound_ip_count = optional(number, null)
      }), {
      backend_pool_type         = null
      managed_outbound_ip_count = null
    })
    pod_cidr           = string
    outbound_type      = optional(string, "loadBalancer")
    network_data_plane = optional(string, "azure")
  })
  default = {
    dns_service_ip = "10.2.0.10"
    service_cidr   = "10.2.0.0/24"
    pod_cidr       = "10.244.0.0/16"
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
  NETWORK_PROFILE
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "network_profile" {
  condition = var.network_profile != null
  summary   = "WARNING: The 'network_profile' variable is not currently used. Consider removing it."
}

variable "additional_node_pools" {
  description = "values mapped to kubernetes_cluster_node_pool resource arguments"
  type = map(object({
    name                           = string
    vm_size                        = string
    cluster_auto_scaling           = bool
    os_disk_size_gb                = number
    os_disk_type                   = string #{Ephemeral, Managed}
    type                           = string
    enable_node_public_ip          = bool
    zones                          = list(string)
    taints                         = list(string)
    labels                         = map(string)
    max_pods                       = number
    cluster_auto_scaling_min_count = number
    cluster_auto_scaling_max_count = number
    node_count                     = number
    os_type                        = string
  }))
}


variable "default_node_pool_zones" {
  description = "the default_node_pools AZs"
  type        = list(string)
  default     = []
}
