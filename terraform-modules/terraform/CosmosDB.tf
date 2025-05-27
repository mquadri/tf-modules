resource "github_repository" "cosmossqldb" {
  name                 = "tf-modules-azure-cosmos-sql-db"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

