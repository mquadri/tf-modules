# Optional features for Azure Container Registry
# This file contains feature flags and configuration for optional capabilities

locals {
  # Feature flags for optional capabilities
  enable_features = {
    encryption           = var.enable_encryption
    retention_policy     = var.enable_retention_policy
    content_trust        = var.enable_content_trust
    network_rules        = var.enable_network_rules
    quarantine_policy    = var.enable_quarantine_policy
    encryption_key_vault = var.enable_encryption_with_key_vault
  }

  # Only create encryption configuration if enabled
  encryption_config = local.enable_features.encryption ? {
    encryption = {
      status             = "enabled"
      key_vault_key_id   = var.encryption_key_vault_key_id
      identity_client_id = var.encryption_identity_client_id
    }
  } : {}

  # Only create network rules if enabled
  network_rule_set = local.enable_features.network_rules ? {
    default_action  = var.network_rule_default_action
    ip_rule         = var.network_rule_ip_rules
    virtual_network = var.network_rule_virtual_network_rules
  } : null

  # Only create retention policy if enabled
  retention_policy = local.enable_features.retention_policy ? {
    days    = var.retention_policy_days
    enabled = true
  } : null

  # Only create trust policy if enabled
  trust_policy = local.enable_features.content_trust ? {
    enabled = true
  } : null

  # Only create quarantine policy if enabled
  quarantine_policy = local.enable_features.quarantine_policy ? {
    enabled = true
  } : null
}
