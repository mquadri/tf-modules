resource "github_repository" "Databricks" {
  name                 = "tf-modules-azure-databricks"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

