resource "github_repository" "redis" {
  name                 = "tf-modules-azure-redis-cache"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

