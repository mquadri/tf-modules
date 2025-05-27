# HDInsight Spark Cluster
resource "azurerm_hdinsight_spark_cluster" "spark_cluster" {
  name                          = local.name
  resource_group_name           = data.azurerm_resource_group.rg.name
  location                      = data.azurerm_resource_group.rg.location
  cluster_version               = var.cluster_version
  tier                          = var.tier
  tls_min_version               = var.tls_min_version
  encryption_in_transit_enabled = var.encryption_in_transit_enabled
  tags                          = local.tags

  component_version {
    spark = var.spark_version
  }

  gateway {
    username = var.gateway_username
    password = var.spark_gateway_password
  }

  storage_account_gen2 {
    is_default                   = true
    storage_resource_id          = var.storage_account_gen2.storage_resource_id
    filesystem_id                = var.storage_account_gen2.filesystem_id
    managed_identity_resource_id = var.storage_account_gen2.managed_identity_resource_id
  }

  roles {
    head_node {
      username           = var.nodes_username
      vm_size            = var.head_node_vm_size
      password           = var.spark_nodes_password
      virtual_network_id = var.virtual_network_id
      subnet_id          = var.subnet_id
    }
    worker_node {
      username              = var.nodes_username
      vm_size               = var.worker_node_vm_size
      target_instance_count = var.worker_node_instance_count
      password              = var.spark_nodes_password
      virtual_network_id    = var.virtual_network_id
      subnet_id             = var.subnet_id
    }
    zookeeper_node {
      username           = var.nodes_username
      vm_size            = var.zookeeper_node_vm_size
      password           = var.spark_nodes_password
      virtual_network_id = var.virtual_network_id
      subnet_id          = var.subnet_id
    }
  }

  network {
    connection_direction = var.network_connection_direction
    private_link_enabled = var.network_private_link_enabled
  }
}