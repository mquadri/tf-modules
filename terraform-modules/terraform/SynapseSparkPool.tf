resource "github_repository" "synapse_spark_pool" {
  name                 = "tf-modules-azure-synapse-spark-pool"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

