output "cdn_profile_id" {
  description = "The ID of the CDN Front Door Profile"
  value       = azurerm_cdn_frontdoor_profile.cdn.id
}

output "cdn_profile_resource_guid" {
  description = "The UUID of the CDN Front Door Profile"
  value       = azurerm_cdn_frontdoor_profile.cdn.resource_guid
}

output "cdn_custom_domain_id" {
  description = "The ID of the Front Door Custom Domain."
  value       = azurerm_cdn_frontdoor_custom_domain.cdn_custom_domain.id
}

output "cdn_custom_domain_expiration_date" {
  description = "The date time that the token expires."
  value       = azurerm_cdn_frontdoor_custom_domain.cdn_custom_domain.expiration_date
}

output "cdn_custom_domain_validation_token" {
  description = "Challenge used for DNS TXT record or file based validation."
  value       = azurerm_cdn_frontdoor_custom_domain.cdn_custom_domain.validation_token
}

output "cdn_origin_group_id" {
  description = "The ID of the CDN origin group."
  value       = azurerm_cdn_frontdoor_origin_group.cdn_origin_group.id
}

output "cdn_origin_id" {
  description = "The ID of the CDN origin."
  value       = azurerm_cdn_frontdoor_origin.cdn_origin.id
}

output "cdn_rule_set_id" {
  description = "The ID of the CDN rule set."
  value       = azurerm_cdn_frontdoor_rule_set.cdn_rule_set.id
}

output "cdn_rule_id" {
  description = "The ID of the Front Door Rule."
  value       = azurerm_cdn_frontdoor_rule.cdn_rule.id
}

output "cdn_frontdoor_rule_set_name" {
  description = "The name of the Front Door Rule Set containing this Front Door Rule."
  value       = azurerm_cdn_frontdoor_rule_set.cdn_rule_set.name
}