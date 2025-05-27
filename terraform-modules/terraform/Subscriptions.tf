resource "github_repository" "Subscriptions" {
  name                 = "tf-modules-azure-subscriptions"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

