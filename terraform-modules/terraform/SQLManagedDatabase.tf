resource "github_repository" "SQLServerMIDB" {
  name                 = "tf-modules-azure-sql-managed-database"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

