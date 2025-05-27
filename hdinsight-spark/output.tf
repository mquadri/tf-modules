output "cluster" {
  description = "HDInsight Spark Cluster resource name."
  value       = azurerm_hdinsight_spark_cluster.spark_cluster.name
}

output "cluster_id" {
  description = "The ID of the HDInsight Spark Cluster."
  value       = azurerm_hdinsight_spark_cluster.spark_cluster.id
}

output "https_endpoint" {
  description = "The HTTPS Connectivity Endpoint for this HDInsight Spark Cluster."
  value       = azurerm_hdinsight_spark_cluster.spark_cluster.https_endpoint
}

output "ssh_endpoint" {
  description = "The SSH Connectivity Endpoint for this HDInsight Spark Cluster."
  value       = azurerm_hdinsight_spark_cluster.spark_cluster.ssh_endpoint
}