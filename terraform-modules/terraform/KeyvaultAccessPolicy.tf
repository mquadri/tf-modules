resource "github_repository" "accesspolicy" {
  name                 = "tf-modules-azure-key-vault-access-policy"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

