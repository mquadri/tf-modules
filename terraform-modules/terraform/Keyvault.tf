resource "github_repository" "keyvault" {
  name                 = "tf-modules-azure-key-vault"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

