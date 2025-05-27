output "app-sample-dev-01_id" {
  value = module.app-sample-dev-01.resource_id
}

output "app-sample-dev-01_resource" {
  value     = module.app-sample-dev-01.resource
  sensitive = true
}
