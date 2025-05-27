resource "github_repository" "network_security_group_association" {
  name                 = "tf-modules-azure-network-security-group-association"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

