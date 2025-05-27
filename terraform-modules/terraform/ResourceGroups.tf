resource "github_repository" "resourcegroups" {
  name                 = "tf-modules-azure-resourcegroups"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

