resource "github_repository" "virtualmachine" {
  name                 = "tf-modules-azure-virtual-machine"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

