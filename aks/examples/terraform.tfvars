#---------Identity and Access Management (IAM)---------
tf_team_group           = ["randomuser1@example.com", "randomuser2@example.com"]
aks_cluster_admin_group = "random.admin.group"
aks_cluster_user_group  = "random.user.group"
aks_rbac_admin_group    = "random.rbac.admin.group"
aks_rbac_reader_group   = "random.rbac.reader.group"
aks_rbac_writer_group   = "random.rbac.writer.group"

# ----------------- AKS -----------------

kubernetes_version     = "1.30.3"
admin_group_object_ids = "a1b2c3d4-5678-90ab-cdef-1234567890ab"

network_profile = {
  network_plugin    = "kubenet"
  network_policy    = "calico"
  dns_service_ip    = "10.2.0.10"
  service_cidr      = "10.2.0.0/24"
  load_balancer_sku = "standard"
  pod_cidr          = "10.3.0.0/16"
  load_balancer_profile = {
    backend_pool_type         = null
    managed_outbound_ip_count = null
  }
  outbound_type = "userDefinedRouting"
}

additional_node_pools = {
  app_nodepool1 = {
    name                           = "appnodepool"
    vm_size                        = "Standard_D16s_v3"
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

