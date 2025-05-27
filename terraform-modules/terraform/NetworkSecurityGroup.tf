resource "github_repository" "network_security_group" {
  name                 = "tf-modules-azure-network-security-group"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

