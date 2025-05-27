# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_api_management" "apim0" {
  name                 = var.azurerm_api_management_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  publisher_name       = var.publisher_name
  publisher_email      = var.publisher_email
  virtual_network_type = var.virtual_network_type
  sku_name             = var.sku_name
  tags                 = var.tags

  dynamic "virtual_network_configuration" {
    for_each = var.subnet_id == null ? [] : [var.subnet_id]
    content {
      subnet_id = var.subnet_id
    }
  }
  dynamic "additional_location" {
    for_each = var.additional_locations

    content {
      location = additional_location.value["location"]

      dynamic "virtual_network_configuration" {
        for_each = additional_location.value["subnet_id"] == null ? [] : [1]

        content {
          subnet_id = additional_location.value["subnet_id"]
        }
      }
    }
  }
  identity {
    type = "SystemAssigned"
  }

  security {
    enable_backend_ssl30  = var.enable_backend_ssl30
    enable_backend_tls10  = var.enable_backend_tls10
    enable_backend_tls11  = var.enable_backend_tls11
    enable_frontend_ssl30 = var.enable_frontend_ssl30
    enable_frontend_tls10 = var.enable_frontend_tls10
    enable_frontend_tls11 = var.enable_frontend_tls11

    tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = var.tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled
    tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = var.tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled
    tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = var.tls_ecdheRsa_with_aes256_cbc_sha_ciphers_enabled
    tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = var.tls_ecdheRsa_with_aes128_cbc_sha_ciphers_enabled
    tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = var.tls_rsa_with_aes128_gcm_sha256_ciphers_enabled
    tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = var.tls_rsa_with_aes256_cbc_sha256_ciphers_enabled
    tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = var.tls_rsa_with_aes128_cbc_sha256_ciphers_enabled
    tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = var.tls_rsa_with_aes256_cbc_sha_ciphers_enabled
    tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = var.tls_rsa_with_aes128_cbc_sha_ciphers_enabled
    triple_des_ciphers_enabled                          = var.triple_des_ciphers_enabled
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
