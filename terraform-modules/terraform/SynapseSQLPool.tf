resource "github_repository" "synapse_sql_pool" {
  name                 = "tf-modules-azure-synapse-sql-pool"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

