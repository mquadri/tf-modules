resource "github_repository" "apimanagement" {
  name                 = "tf-modules-azure-api-management"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

