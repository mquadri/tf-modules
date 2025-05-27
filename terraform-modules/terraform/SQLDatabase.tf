resource "github_repository" "SQLDatabase" {
  name                 = "tf-modules-azure-sql-database"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

