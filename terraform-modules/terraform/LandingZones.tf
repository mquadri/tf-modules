resource "github_repository" "LandingZone" {
  name                 = "tf-modules-azure-landing-zone"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

