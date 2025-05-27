output "cdn_profile_id" {
  description = "The ID of the CDN Front Door Profile"
  value       = module.cdn_frontdoor.cdn_profile_id
}

output "cdn_profile_resource_guid" {
  description = "The UUID of the CDN Front Door Profile"
  value       = module.cdn_frontdoor.cdn_profile_resource_guid
}

output "cdn_custom_domain_id" {
  description = "The ID of the Front Door Custom Domain."
  value       = module.cdn_frontdoor.cdn_custom_domain_id
}

output "cdn_custom_domain_expiration_date" {
  description = "The date time that the token expires."
  value       = module.cdn_frontdoor.cdn_custom_domain_expiration_date
}

output "cdn_custom_domain_validation_token" {
  description = "Challenge used for DNS TXT record or file based validation."
  value       = module.cdn_frontdoor.cdn_custom_domain_validation_token
}

output "cdn_origin_group_id" {
  description = "The ID of the CDN origin group."
  value       = module.cdn_frontdoor.cdn_origin_group_id
}

output "cdn_origin_id" {
  description = "The ID of the CDN origin."
  value       = module.cdn_frontdoor.cdn_origin_id
}

output "cdn_rule_set_id" {
  description = "The ID of the CDN rule set."
  value       = module.cdn_frontdoor.cdn_rule_set_id
}

output "cdn_rule_id" {
  description = "The ID of the Front Door Rule."
  value       = module.cdn_frontdoor.cdn_rule_id
}

output "cdn_frontdoor_rule_set_name" {
  description = "The name of the Front Door Rule Set containing this Front Door Rule."
  value       = module.cdn_frontdoor.cdn_frontdoor_rule_set_name
}