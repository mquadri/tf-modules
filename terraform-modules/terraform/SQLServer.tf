resource "github_repository" "SQLServer" {
  name                 = "tf-modules-azure-sql-server"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

