resource "github_repository" "appgateway" {
  name                 = "tf-modules-azure-app-gateway"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

