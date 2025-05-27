# tflint-ignore: terraform_unused_declarations
locals {

  network_profile_load_balancer = {
    load_balancer_profile = {
      backend_pool_type         = "NodeIPConfiguration"
      managed_outbound_ip_count = 2
    }
  }

  # tflint-ignore: terraform_unused_declarations
  additional_mgmt_node_pools = {
    app_nodepool1 = {
      name                           = "appnodepool"
      vm_size                        = "Standard_D8s_v3"
      cluster_auto_scaling           = true
      os_disk_size_gb                = 2000
      os_disk_type                   = "Managed"
      type                           = "VirtualMachineScaleSets"
      enable_node_public_ip          = false
      zones                          = []
      taints                         = null
      labels                         = {}
      max_pods                       = 110
      cluster_auto_scaling_min_count = 2
      cluster_auto_scaling_max_count = 20
      node_count                     = 2
      os_type                        = "Linux"
    }
  }
}
