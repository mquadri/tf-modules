resource "github_repository" "storage_account_container" {
  name                 = "tf-modules-azure-storage-account-container"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

