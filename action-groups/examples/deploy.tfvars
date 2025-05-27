# Key Vault settings
key_vault_name    = "your-kv"
key_vault_rg_name = "your-rg"

# Action groups configuration
action_groups = {
  "example-action-group" = {
    name                = "Example Action Group"
    resource_group_name = "your-rg"
    short_name          = "EAG"
    enabled             = true
    location            = "your-loc"

    arm_role_receivers = [
      {
        name                    = "Role name"
        role_id                 = "e3973bdf-4987-49ae-837a-ba8e2212131c7286q121"
        use_common_alert_schema = true
      }
    ]

    automation_runbook_receivers = [
      {
        name                    = "example-runbook"
        automation_account_id   = "/subscriptions/your-subs/resourceGroups/your-rg/providers/Microsoft.Automation/automationAccounts/your-aa"
        runbook_name            = "myRunbook"
        webhook_resource_id     = "/subscriptions/your-subs/resourceGroups/your-rg/providers/Microsoft.Automation/automationAccounts/your-aa/webHooks/webhoobk-name"
        is_global_runbook       = true
        service_uri             = "https://987c482b-e3b7-4e64-949d-0b0b1fe02005.webhook.eus.azure-automation.net/webhooks?token=8YNq%2fEjiSQurJTXxtDX%2bfO%2fDOcnqkz5Pa4AsfgUocxg%3d"
        use_common_alert_schema = true
      }
    ]

    azure_app_push_receivers = [
      {
        name          = "Push Receiver"
        email_address = "admin@contoso.com"
      }
    ]

    azure_function_receivers = [
      {
        name                     = "FunctionReceiver12"
        function_app_resource_id = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Web/sites/{siteName}"
        function_name            = "myFunction"
        http_trigger_url         = "https://example.com/trigger"
        use_common_alert_schema  = true
      }
    ]

    event_hub_receivers = [
      {
        name                    = "Example Event Hub Receiver"
        event_hub_namespace     = "eventhubnamespace"
        event_hub_name          = "eventhub1"
        subscription_id         = "00000000-0000-0000-0000-000000000000"
        tenant_id               = "00000000-0000-0000-0000-000000000000"
        use_common_alert_schema = false
      }
    ]

    itsm_receivers = [
      {
        name                 = "ITSM Receiver"
        workspace_id         = "05a4028e-14a9-4f7d-baf3-2629d5a430bc|12345678-1234-5678-1234-123456789abc"
        connection_id        = "12345678-1234-1234-1234-123456789abc"
        ticket_configuration = "{\"PayloadRevision\":0,\"WorkItemType\":\"Incident\",\"UseTemplate\":false,\"WorkItemData\":\"{}\",\"CreateOneWIPerCI\":false}"
        region               = "southcentralus"
      }
    ]

    logic_app_receivers = [
      {
        name                    = "Logic App Receiver"
        resource_id             = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-logic-app-group/providers/Microsoft.Logic/workflows/myLogicApp"
        callback_url            = "https://example.com/callback"
        use_common_alert_schema = true
      }
    ]

    sms_receivers = [
      {
        name         = "SMS Receiver"
        country_code = "1"
        phone_number = "1231231234"
      }
    ]

    voice_receivers = [
      {
        name         = "Voice Receiver"
        country_code = "86"
        phone_number = "13888888888"
      }
    ]

    webhook_receivers = [
      {
        name                    = "Webhook Receiver"
        service_uri             = "https://987c482b-e3b7-4e64-949d-0b0b1fe02005.webhook.eus.azure-automation.net/webhooks?token=LIDAC5nwMGxqh%2bqmi3iytxGhvy2XDnDEVJ2ooLcN2ac%3d"
        use_common_alert_schema = true
        key_vault_secret_id     = "my-secret-id"
        aad_auth = {
          object_id      = "object-id"
          identifier_uri = "https://example.com/identifier"
          tenant_id      = "tenant-id"
        }
      }
    ]

    email_receivers = [
      {
        name                    = "Email Receiver"
        email_address           = "email@contoso.com"
        use_common_alert_schema = true
      }
    ]
  }
}

