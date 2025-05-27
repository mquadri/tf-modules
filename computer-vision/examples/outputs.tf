output "computer_vision_name" {
  value = module.computer_vision.name
}

output "computer_vision_private_endpoints" {
  value = module.computer_vision.private_endpoints
}

output "computer_vision_resource" {
  value     = module.computer_vision.resource
  sensitive = true
}

output "computer_vision_resource_id" {
  value = module.computer_vision.resource_id
}