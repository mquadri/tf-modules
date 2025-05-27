output "custom_vision_prediction_name" {
  value = module.custom_vision_prediction.name
}

output "custom_vision_prediction_private_endpoints" {
  value = module.custom_vision_prediction.private_endpoints
}

output "custom_vision_prediction_resource" {
  value     = module.custom_vision_prediction.resource
  sensitive = true
}

output "custom_vision_prediction_resource_id" {
  value = module.custom_vision_prediction.resource_id
}
