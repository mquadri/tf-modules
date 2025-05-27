variable "resource_group_name" {
  description = "The resource group name."
}

variable "additional_locations" {
  description = "The additional locations where the resource will be deployed. Example format: [{ location = \"location\", subnet_id = \"subnet_id\" }]"
  default     = []
  type = list(
    object(
      {
        location  = string
        subnet_id = string
      }
    )
  )
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_api_management_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
}

variable "publisher_name" {
  description = "The name of publisher/company."
}

variable "publisher_email" {
  description = "The email of publisher/company."
}

variable "sku_name" {
  description = "sku_name is a string consisting of two parts separated by an underscore(_). The fist part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  default     = "Developer_1"
}

variable "tags" {
}

variable "virtual_network_type" {
  description = "The type of virtual network you want to use, valid values include: None, External, Internal."
  default     = "None"
}

variable "subnet_id" {
  description = "The id of the subnet that will be used for the API Management."
  default     = null
}

variable "enable_backend_ssl30" {
  description = "Flag to enable/disable SSL3 on bakend"
  default     = false
}

variable "enable_backend_tls10" {
  description = "Flag to enable/disable TLS 1.0 on bakend"
  default     = false
}

variable "enable_backend_tls11" {
  description = "Flag to enable/disable 1.1 on bakend"
  default     = false
}

variable "enable_frontend_ssl30" {
  description = "Flag to enable/disable SSL3 on front end"
  default     = false
}

variable "enable_frontend_tls10" {
  description = "Flag to enable/disable TLS 1.0 on front end"
  default     = false
}

variable "enable_frontend_tls11" {
  description = "Flag to enable/disable 1.1 on front end"
  default     = false
}

variable "tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled" {
  description = "Flag to enable/disable TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA"
  default     = false
}

variable "tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled" {
  description = "Flag to enable/disable TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA"
  default     = false
}

variable "tls_ecdheRsa_with_aes256_cbc_sha_ciphers_enabled" {
  description = "Should the TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA cipher be enabled? Defaults to false."
  default     = false
}

variable "tls_ecdheRsa_with_aes128_cbc_sha_ciphers_enabled" {
  description = "Should the TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA cipher be enabled? Defaults to false."
  default     = false
}

variable "tls_rsa_with_aes256_cbc_sha256_ciphers_enabled" {
  description = "Should the tls_rsa_with_aes256_cbc_sha256 cipher be enabled? Defaults to false."
  default     = false
}

variable "tls_rsa_with_aes128_gcm_sha256_ciphers_enabled" {
  description = "Should the tls_rsa_with_aes128_gcm_sha256 cipher be enabled? Defaults to false."
  default     = false
}

variable "tls_rsa_with_aes128_cbc_sha256_ciphers_enabled" {
  description = "Should the cipher tls_rsa_with_aes128_cbc_sha256 be enabled? Defaults to false."
  default     = false
}

variable "tls_rsa_with_aes256_cbc_sha_ciphers_enabled" {
  description = "Should the tls_rsa_with_aes256_cbc_sha cipher be enabled? Defaults to false."
  default     = false
}

variable "tls_rsa_with_aes128_cbc_sha_ciphers_enabled" {
  description = "Should the tls_rsa_with_aes128_cbc_sha cipher be enabled? Defaults to false."
  default     = false
}

variable "triple_des_ciphers_enabled" {
  description = "Should the triple_des cipher be enabled? Defaults to false."
  default     = false
}
