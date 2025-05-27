resource "github_repository" "routetable" {
  name                 = "tf-modules-azure-route-table"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

