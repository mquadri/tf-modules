resource "github_repository" "cosmosdbaccount" {
  name                 = "tf-modules-azure-cosmos-db-account"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

