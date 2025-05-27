resource "github_repository" "ad_group" {
  name                 = "tf-modules-azure-ad-group"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

