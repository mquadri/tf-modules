resource "github_repository" "storage_account_blob" {
  name                 = "tf-modules-azure-storage-account-blob"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

