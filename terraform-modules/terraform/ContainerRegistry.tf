resource "github_repository" "containerregistry" {
  name                 = "tf-modules-azure-container-registry"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

