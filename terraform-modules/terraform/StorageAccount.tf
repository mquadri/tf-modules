resource "github_repository" "storage_account" {
  name                 = "tf-modules-azure-storage-account"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

