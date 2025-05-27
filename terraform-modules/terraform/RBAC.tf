resource "github_repository" "rbac" {
  name                 = "tf-modules-azure-rbac-assignment"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

