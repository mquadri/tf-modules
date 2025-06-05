locals {
  cmk_expire_date = formatdate("YYYY-MM-DD'T'hh:mm:ssZ", timeadd(timestamp(), "17520h"))
  naming          = "${var.resourcetype}-${var.appname}-${var.env}"
  role_definitions = {
    KeyVaultCryptoUser                  = { name = "Key Vault Crypto User" }
    KeyVaultCryptoServiceEncryptionUser = { name = "Key Vault Crypto Service Encryption User" }
    KeyVaultCryptoOfficer               = { name = "Key Vault Crypto Officer" }
    KeyVaultCryptoServiceReleaseUser    = { name = "Key Vault Crypto Service Release User" }
  }
  userIdentities = length(var.userIdentities) > 0 ? concat(var.userIdentities, try([module.user_managed_identity_setup.resource_id[0]], [])) : try([module.user_managed_identity_setup.resource_id[0]], [])
  mandatory_tags = {
    environment   = var.environment
    app_id        = var.app_id
    msftmigration = var.msftmigration
  }
}

