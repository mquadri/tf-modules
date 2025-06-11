# Test main Terraform file
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}
