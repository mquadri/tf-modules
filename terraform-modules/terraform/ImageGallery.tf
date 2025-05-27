resource "github_repository" "ImageGallery" {
  name                 = "tf-modules-azure-compute-gallery"
  visibility           = var.visibility
  auto_init            = true
  topics               = var.topics
  vulnerability_alerts = true
  lifecycle {
    ignore_changes = [
    ]
  }
}

