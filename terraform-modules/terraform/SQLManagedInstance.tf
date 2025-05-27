resource "github_repository" "SQLServerMI" {
  name                 = "tf-modules-azure-sql-managed-instance"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

