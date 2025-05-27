# tflint-ignore: terraform_required_version
locals {
  naming = "${var.resourcetype}-${var.appname}-${var.env}"

  tags = {
    appid               = var.appid
    appname             = var.appname
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    costVP              = var.costVP
    environment         = var.env
    resourcetype        = var.resourcetype
    location            = var.location
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
  }

}

#importing resource group information
data "azurerm_resource_group" "azappgw" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "vnetrg" {
  name = var.rg_vnet
}

#importing vnet/subnet information
data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.vnetrg.name
}

data "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

#importing key vault information
data "azurerm_key_vault" "cert_kv" {
  name                = var.key_vault
  resource_group_name = var.rg_kv
}

data "azurerm_key_vault_secret" "kv_secret" {
  name         = var.kv_secret_name
  key_vault_id = data.azurerm_key_vault.cert_kv.id
}

#importing azure identity 
data "azurerm_user_assigned_identity" "identity" {
  count               = length(var.user-managed-identities) > 0 && var.identity.enable ? length(var.user-managed-identities) : 0
  name                = element(var.user-managed-identities, count.index)
  resource_group_name = var.identity_rg
}

#create public ip
resource "azurerm_public_ip" "pip" {
  name                = "${local.naming}-pip-${var.additionalcontext}"
  resource_group_name = data.azurerm_resource_group.azappgw.name
  location            = data.azurerm_resource_group.azappgw.location
  sku                 = "Standard"
  allocation_method   = "Static"
  zones               = var.enable_zones ? var.avzones : null
  tags                = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }
}

resource "azurerm_application_gateway" "appgw" {
  name                = "${local.naming}-${var.additionalcontext}"
  resource_group_name = data.azurerm_resource_group.azappgw.name
  location            = data.azurerm_resource_group.azappgw.location
  enable_http2        = var.enable-http2
  zones               = var.enable_zones ? var.avzones : null
  tags                = local.tags

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }

  sku {
    name     = var.sku.name
    tier     = var.sku.tier
    capacity = var.sku.capacity
  }

  dynamic "gateway_ip_configuration" {
    for_each = var.gateway-ip-configurations
    content {
      name      = gateway_ip_configuration.value.gateway-ip-configuration-name
      subnet_id = data.azurerm_subnet.snet.id
    }
  }

  dynamic "frontend_port" {
    for_each = var.frontend-ports
    content {
      name = frontent_port.value.frontend-port-name
      port = frontend_port.value.frontend-port
    }
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  dynamic "http_listener" {
    for_each = var.http-listeners
    content {
      name                           = http_listener.value.http-listener-name
      frontend_ip_configuration_name = http_listener.value.frontend-ip-configuration-name
      frontend_port_name             = http_listener.value.frontend-port-name
      protocol                       = http_listener.value.http-listener-protocol
      host_name                      = http_listener.value.host-name
      host_names                     = http_listener.value.host-names
      require_sni                    = http_listener.value.require-sni
      ssl_certificate_name           = http_listener.value.ssl-certificate-name
    }
  }

  dynamic "identity" {
    for_each = var.identity.enable ? [""] : []
    content {
      type = var.identity.identity-type
      # tflint-ignore: terraform_deprecated_index
      identity_ids = var.identity.identity-type == "UserAssigned" ? data.azurerm_user_assigned_identity.identity.*.id : null
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.request-routing-rules
    content {
      name                        = request_routing_rule.value.request-routing-rule-name
      rule_type                   = request_routing_rule.value.request-routing-rule-type
      http_listener_name          = request_routing_rule.value.http-listener-name
      backend_address_pool_name   = request_routing_rule.value.backend-address-pool-name
      backend_http_settings_name  = request_routing_rule.value.backend-http-settings-name
      redirect_configuration_name = request_routing_rule.value.redirect-configuration-name
      rewrite_rule_set_name       = request_routing_rule.value.rewrite-rule-set-name
      priority                    = request_routing_rule.value.priority
    }
  }

  dynamic "probe" {
    for_each = var.probes
    content {
      name                                      = probe.value.probe-name
      host                                      = probe.value.probe-host
      interval                                  = probe.value.probe-interval
      protocol                                  = probe.value.protocol
      path                                      = probe.value.probe-path
      timeout                                   = probe.value.probe-timeout
      unhealthy_threshold                       = probe.value.probe-unhealthy-threshold
      port                                      = probe.value.port
      pick_host_name_from_backend_http_settings = probe.value.pick-host-name-from-backend-http-settings
      minimum_servers                           = probe.value.minimum-servers
      match {
        body        = probe.value.match-body
        status_code = probe.value.status-codes
      }
    }
  }

  dynamic "backend_address_pool" {
    for_each = var.backend-address-pools
    content {
      name         = backend_address_pool.value.backend_address_pool_name
      fqdns        = backend_address_pool.value.fqdns
      ip_addresses = backend_address_pool.value.ip-addresses
    }
  }

  dynamic "backend_http_settings" {
    for_each = var.backend-http-settings
    content {
      name                                = backend_http_settings.value.backend-http-settings-name
      port                                = backend_http_settings.value.port
      protocol                            = backend_http_settings.value.protocol
      path                                = backend_http_settings.value.override-backend-path
      probe_name                          = backend_http_settings.value.probe-name
      request_timeout                     = backend_http_settings.value.request-timeout
      host_name                           = backend_http_settings.value.host-name
      pick_host_name_from_backend_address = backend_http_settings.value.pick-host-name-from-backend-address
      cookie_based_affinity               = backend_http_settings.value.cookie-based-affinity
      affinity_cookie_name                = backend_http_settings.value.affinity-cookie-name
      trusted_root_certificate_names      = backend_http_settings.value.trusted-root-certificates
      connection_draining {
        drain_timeout_sec = backend_http_settings.value.drain-timeout-sec
        enabled           = backend_http_settings.value.connection-draining-enabled
      }

      dynamic "authentication_certificate" {
        for_each = [for auth_cert in backend_http_settings.value.authentication-certificates : auth_cert if auth_cert.enable]
        content {
          name = authentication_certificate.value.authentication-certificate-name
        }
      }
    }
  }

  dynamic "authentication_certificate" {
    for_each = [for auth_cert in var.authentication-certificates : auth_cert if auth_cert.enable]
    content {
      name = authentication_certificate.value.authentication-certificate-name
      data = authentication_certificate.value.authentication-certificate-data
    }
  }

  dynamic "trusted_root_certificate" {
    for_each = var.trusted-root-certificates
    content {
      name = trusted_root_certificate.value.trusted-root-certificate-name
      # tflint-ignore: terraform_deprecated_index
      data = trusted_root_certificate.value.trusted-root-certificate-data-secret-name != "" ? data.azurerm_key_vault_secret.kv_secret[index(data.azurerm_key_vault_secret.kv_secret.*.name, trusted_root_certificate.value.trusted-root-certificate-data-secret-name)].value : trusted_root_certificate.value.trusted-root-certificate-data
    }
  }

  dynamic "ssl_policy" {
    for_each = var.ssl-policy
    content {
      disabled_protocols   = var.ssl-policy.disabled-protocols
      policy_name          = var.ssl-policy.policy-type == "Predefined" ? var.ssl-policy.policy-name : null
      policy_type          = var.ssl-policy.policy-type != "" ? var.ssl-policy.policy-type : null
      min_protocol_version = var.ssl-policy.min-protocol-version
      cipher_suites        = var.ssl-policy.policy-type == "Custom" ? var.ssl-policy.cipher-suites : null
    }
  }

  dynamic "ssl_certificate" {
    for_each = var.ssl-certificates
    content {
      name = ssl_certificate.value.ssl-certificate-name
      # tflint-ignore: terraform_deprecated_index
      data = ssl_certificate.value.ssl-certificate-data-secret-name != "" ? data.azurerm_key_vault_secret.kv_secret[index(data.azurerm_key_vault.kv_secret.*.name, ssl_certificate.value.ssl-certificate-data-secret-name)].value : ssl_certificate.value.ssl-certificate-data
      # tflint-ignore: terraform_deprecated_index
      password = ssl_certificate.value.ssl-certificate-password-secret-name != "" ? data.azurerm_key_vault_secret.kv_secret[index(data.azurerm_key_vault_secret.kv_secret.*.name, ssl_certificate.value.ssl-certificate-password-secret-name)].value : ssl_certificate.value.ssl-certificate-password
      # tflint-ignore: terraform_deprecated_index
      key_vault_secret_id = var.identity.enable ? data.azurerm_key_vault_secret.kv_secret[index(data.azurerm_key_vault_secret.kv_secret.*.name, ssl_certificate.value.key-vault-secret-id)].id : null
    }
  }

  dynamic "redirect_configuration" {
    for_each = [for redirect-config in var.redirect-configurations : redirect-config if redirect-config.enable]
    content {
      name                 = redirect_configuration.value.redirect-configuration-name
      redirect_type        = redirect_configuration.value.redirect-type
      target_listener_name = redirect_configuration.value.target-listener-name
      target_url           = redirect_configuration.value.target-url
      include_path         = redirect_configuration.value.include-path
      include_query_string = redirect_configuration.value.incude-query-string
    }
  }

  dynamic "autoscale_configuration" {
    for_each = var.autoscale-configuration.enable ? [""] : []
    content {
      min_capacity = var.autoscale-configuration.autoscale-min-capacity
      max_capacity = var.autoscale-configuration.autoscale-max-capacity
    }
  }

  dynamic "rewrite_rule_set" {
    for_each = [for rrs in var.rewrite-rule-set : rrs if rrs.enable]
    content {
      name = rewrite_rule_set.value.rewrite-rule-set-name
      dynamic "rewrite_rule" {
        for_each = rewrite_rule_set.value.rewrite-rules
        content {
          name          = rewrite_rule.value.rewrite-rule-name
          rule_sequence = rewrite_rule.value.rule-sequence
          dynamic "condition" {
            for_each = rewrite_rule.value.conditions
            content {
              variable    = condition.value.variable
              pattern     = condition.value.pattern
              ignore_case = condition.value.ignore-case
              negate      = condition.value.negate
            }
          }
          dynamic "request_header_configuration" {
            for_each = rewrite_rule.value.request-header-configurations
            content {
              header_name  = request_header_configuration.value.header-name
              header_value = request_header_configuration.value.header-value
            }
          }
          dynamic "response_header_configuration" {
            for_each = rewrite_rule.value.response-header-configurations
            content {
              header_name  = response_header_configuration.value.header-name
              header_value = response_header_configuration.value.header-value
            }
          }
        }
      }
    }
  }
}

data "azurerm_monitor_diagnostic_categories" "default" {
  resource_id = azurerm_application_gateway.appgw.id


}

# tflint-ignore: terraform_required_providers
resource "azurerm_monitor_diagnostic_setting" "agw" {
  name                       = "${local.naming}-diag-${var.additionalcontext}"
  target_resource_id         = azurerm_application_gateway.appgw.id
  log_analytics_workspace_id = var.law_id
  storage_account_id         = var.storage_account_id

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.default.logs
    content {
      category = log.value
      enabled  = true

      retention_policy {
        enabled = false
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.default.metrics
    content {
      category = metric.value
      enabled  = true

      retention_policy {
        enabled = false
      }
    }
  }
}