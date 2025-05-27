output "document_intelligence_name" {
  value = module.document_intelligence.name
}

output "document_intelligence_private_endpoints" {
  value = module.document_intelligence.private_endpoints
}

output "document_intelligence_resource" {
  value     = module.document_intelligence.resource
  sensitive = true
}

output "document_intelligence_resource_id" {
  value = module.document_intelligence.resource_id
}