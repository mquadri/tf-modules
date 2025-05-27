resource "github_repository" "synapse_workspace" {
  name                 = "tf-modules-azure-synapse-workspace"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

