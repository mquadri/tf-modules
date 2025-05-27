resource "github_repository" "naming" {
  name                 = "tf-modules-azure-naming"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

