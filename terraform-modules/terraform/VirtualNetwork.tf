resource "github_repository" "virtuaLnetwork" {
  name                 = "tf-modules-azure-virtual-network"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

