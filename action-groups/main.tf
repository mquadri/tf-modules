data "azurerm_key_vault" "kv" {
  count               = var.key_vault_name != "" ? 1 : 0
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

data "azurerm_key_vault_secret" "integration_key_secret" {
  for_each     = toset(flatten([for action_group_name, action_group in var.action_groups : [for webhook in(action_group.webhook_receivers != null ? action_group.webhook_receivers : []) : webhook.key_vault_secret_id != null ? [webhook.key_vault_secret_id] : []]]))
  name         = each.key
  key_vault_id = data.azurerm_key_vault.kv[0].id
}

locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
    mal_id        = var.mal_id # Added mal_id
  }
}

resource "azurerm_monitor_action_group" "group" {
  for_each = var.action_groups

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  short_name          = each.value.short_name
  enabled             = lookup(each.value, "enabled", true)
  location            = lookup(each.value, "location", "global")
  # Updated tag merging order: mandatory tags > per-group tags > general module instance tags
  tags                = merge(var.tags, lookup(each.value, "tags", {}), local.mandatory_tags)


  dynamic "arm_role_receiver" {
    for_each = each.value.arm_role_receivers != null ? toset(each.value.arm_role_receivers) : toset([])

    content {
      name                    = lookup(arm_role_receiver.value, "name", null)
      role_id                 = lookup(arm_role_receiver.value, "role_id", null)
      use_common_alert_schema = lookup(arm_role_receiver.value, "use_common_alert_schema", null)
    }
  }

  dynamic "automation_runbook_receiver" {
    for_each = each.value.automation_runbook_receivers != null ? toset(each.value.automation_runbook_receivers) : toset([])

    content {
      name                    = lookup(automation_runbook_receiver.value, "name", null)
      automation_account_id   = lookup(automation_runbook_receiver.value, "automation_account_id", null)
      runbook_name            = lookup(automation_runbook_receiver.value, "runbook_name", null)
      webhook_resource_id     = lookup(automation_runbook_receiver.value, "webhook_resource_id", null)
      is_global_runbook       = lookup(automation_runbook_receiver.value, "is_global_runbook", null)
      service_uri             = lookup(automation_runbook_receiver.value, "service_uri", null)
      use_common_alert_schema = lookup(automation_runbook_receiver.value, "use_common_alert_schema", null)
    }
  }

  dynamic "azure_app_push_receiver" {
    for_each = each.value.azure_app_push_receivers != null ? toset(each.value.azure_app_push_receivers) : toset([])

    content {
      name          = lookup(azure_app_push_receiver.value, "name", null)
      email_address = lookup(azure_app_push_receiver.value, "email_address", null)
    }
  }


  dynamic "azure_function_receiver" {
    for_each = each.value.azure_function_receivers != null ? toset(each.value.azure_function_receivers) : toset([])

    content {
      name                     = lookup(azure_function_receiver.value, "name", null)
      function_app_resource_id = lookup(azure_function_receiver.value, "function_app_resource_id", null)
      function_name            = lookup(azure_function_receiver.value, "function_name", null)
      http_trigger_url         = lookup(azure_function_receiver.value, "http_trigger_url", null)
      use_common_alert_schema  = lookup(azure_function_receiver.value, "use_common_alert_schema", null)
    }
  }

  dynamic "event_hub_receiver" {
    for_each = each.value.event_hub_receivers != null ? toset(each.value.event_hub_receivers) : toset([])

    content {
      name                    = lookup(event_hub_receiver.value, "name", null)
      event_hub_namespace     = lookup(event_hub_receiver.value, "event_hub_namespace", null)
      event_hub_name          = lookup(event_hub_receiver.value, "event_hub_name", null)
      subscription_id         = lookup(event_hub_receiver.value, "subscription_id", null)
      tenant_id               = lookup(event_hub_receiver.value, "tenant_id", null)
      use_common_alert_schema = lookup(event_hub_receiver.value, "use_common_alert_schema", null)
    }
  }


  dynamic "itsm_receiver" {
    for_each = each.value.itsm_receivers != null ? toset(each.value.itsm_receivers) : toset([])

    content {
      name                 = lookup(itsm_receiver.value, "name", null)
      workspace_id         = lookup(itsm_receiver.value, "workspace_id", null)
      connection_id        = lookup(itsm_receiver.value, "connection_id", null)
      ticket_configuration = lookup(itsm_receiver.value, "ticket_configuration", null)
      region               = lookup(itsm_receiver.value, "region", null)
    }
  }


  dynamic "logic_app_receiver" {
    for_each = each.value.logic_app_receivers != null ? toset(each.value.logic_app_receivers) : toset([])

    content {
      name                    = lookup(logic_app_receiver.value, "name", null)
      resource_id             = lookup(logic_app_receiver.value, "resource_id", null)
      callback_url            = lookup(logic_app_receiver.value, "callback_url", null)
      use_common_alert_schema = lookup(logic_app_receiver.value, "use_common_alert_schema", null)
    }
  }


  dynamic "sms_receiver" {
    for_each = each.value.sms_receivers != null ? toset(each.value.sms_receivers) : toset([])

    content {
      name         = lookup(sms_receiver.value, "name", null)
      country_code = lookup(sms_receiver.value, "country_code", null)
      phone_number = lookup(sms_receiver.value, "phone_number", null)
    }
  }


  dynamic "voice_receiver" {
    for_each = each.value.voice_receivers != null ? toset(each.value.voice_receivers) : toset([])

    content {
      name         = lookup(voice_receiver.value, "name", null)
      country_code = lookup(voice_receiver.value, "country_code", null)
      phone_number = lookup(voice_receiver.value, "phone_number", null)
    }
  }


  dynamic "webhook_receiver" {
    for_each = each.value.webhook_receivers != null ? toset(each.value.webhook_receivers) : toset([])

    content {
      name                    = lookup(webhook_receiver.value, "name", null)
      service_uri             = lookup(webhook_receiver.value, "service_uri", null) != null ? lookup(webhook_receiver.value, "service_uri", null) : data.azurerm_key_vault_secret.integration_key_secret[webhook_receiver.value.key_vault_secret_id].value
      use_common_alert_schema = lookup(webhook_receiver.value, "use_common_alert_schema", null)

      dynamic "aad_auth" {
        for_each = contains(keys(webhook_receiver.value), "aad_auth") && webhook_receiver.value.aad_auth != null ? [webhook_receiver.value.aad_auth] : []

        content {
          object_id      = lookup(aad_auth.value, "object_id", null)      # Required
          identifier_uri = lookup(aad_auth.value, "identifier_uri", null) # Optional
          tenant_id      = lookup(aad_auth.value, "tenant_id", null)      # Optional
        }
      }
    }
  }

  dynamic "email_receiver" {
    for_each = each.value.email_receivers != null ? toset(each.value.email_receivers) : toset([])

    content {
      name                    = lookup(email_receiver.value, "name", null)
      email_address           = lookup(email_receiver.value, "email_address", null)
      use_common_alert_schema = lookup(email_receiver.value, "use_common_alert_schema", null)
    }
  }
}
